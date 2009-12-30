/* jCalculus - Java Calculus
 * Copyright (C) 2003  Maheshwaran.S
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA  02111-1307, USA. The text ol license can be also found
 * at http://www.gnu.org/copyleft/lgpl.html
 */

/**
 * <p>Title: jCalculus</p>
 * <p>Description: Java Calculus</p>
 * <p>Copyright: Copyright (c) 2003 Maheshwaran.S</p>
 * <p>Company: </p>
 * @author Maheshwaran.S
 * @version 1.0
 */

package calculus;

import gnu.prolog.vm.*;
import gnu.prolog.term.*;
import gnu.prolog.io.*;
import gnu.prolog.database.PrologTextLoaderError;
import java.io.*;
import java.util.*;

public class PrologEngine implements Serializable{
  private HashMap variableResult;
  private StringReader sr;
  private TermReader tr;
  private ReadOptions rd_ops;
  private Environment env;
  private Interpreter interpreter;
  private WriteOptions wr_ops, options;
  private Term goalTerm;
  private Interpreter.Goal goal;
  private String response, fileName, goalToExecute;
  private TermWriter out;

  public PrologEngine(String fileName) throws ParseException {

    this.fileName = fileName;
    env = new Environment();
    env.ensureLoaded(AtomTerm.get(fileName));
    interpreter = env.createInterpreter();
    env.runIntialization(interpreter);
    /* show any error occured */
    for (Iterator iter = env.getLoadingErrors().iterator(); iter.hasNext(); ) {
      PrologTextLoaderError err = (PrologTextLoaderError) iter.next();
      System.err.println(err);
    }
    rd_ops = new ReadOptions();
    rd_ops.operatorSet = env.getOperatorSet();

    wr_ops = new WriteOptions();
    wr_ops.operatorSet = env.getOperatorSet();

    out = new TermWriter(new StringWriter());
  }

  public String getResult(String variable) throws Exception {
    Object obj = variableResult.get(variable);

    if (obj == null) {
      throw new Exception("No Such Variable : " + variable);
    }
    else {
      Term res = ( (Term) obj).dereference();
      String output = out.toString(res);
      return output;
    }
  }

  public void exec(String goalToExecute) {
    try {
      this.goalToExecute = goalToExecute;
      sr = new StringReader(goalToExecute);
      tr = new TermReader(sr);

      goalTerm = tr.readTermEof(rd_ops);
      goal = interpreter.prepareGoal(goalTerm);

      int flag = interpreter.execute(goal);

      switch (flag) {
        case PrologCode.SUCCESS:
        case PrologCode.SUCCESS_LAST:
          variableResult = (HashMap) rd_ops.variableNames;
          break;
        case PrologCode.FAIL:
          throw new Exception("Cannot Execute for : " + goalToExecute);
      }
    }
    catch (Exception e) {
      System.err.println(e);
    }
  }
}
