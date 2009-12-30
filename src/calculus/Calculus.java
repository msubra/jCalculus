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
import java.io.*;

public abstract class Calculus {
  static String path;
  static PrologEngine e;

  abstract public String eval(String a, String b);
  abstract public String eval(String a);

  public static PrologEngine getEngine() throws Exception{
    e = new PrologEngine("calculus.pl");
    return e;
  }
}