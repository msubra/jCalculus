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

import java.io.*;
import calculus.PrologEngine;
import javax.swing.*;
import calculus.*;


public class test {
  static String goalToRun ;

  static void dx() throws Exception{
    Derivative d = new Derivative();
    String s = d.eval(goalToRun,"x");
    System.out.println("Differential of " + goalToRun + " : " + s);
  }

  static void in() throws Exception{
    Integral d = new Integral();
    String s = d.eval(goalToRun,"x");
    System.out.println("Integral of " + goalToRun + " : " + s);
  }

  static void intro(){
    String s;
    s  = "==========================================================================";
    s += "\t\t\tjCalculus - Mathematical Calculus Package\n";
    s += "==========================================================================\n";
    s += "jCalculus by created by Maheshwaran.S of Sona College of Technology, B.E III\n";
    s += "Year CSE. jCalculus, is Prolog + Java interface package. The calculus source is written\n";
    s += "in Prolog and it is interfaced using gnuprolog, with Java.\n";
    s += "email: smahesh_monu@rediffmail.com or smahesh_cse@ieee.org";
    s += " web: http://microprogrammers.150m.com";

    System.out.println(s + "\n");
  }

  public static void main(String args[]) throws Exception {
    intro();
    goalToRun ="sin(x^3)";
    dx();
    in();
  }
}