/* Copyright 2004-2005 David N. Welton

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

package org.hecl;

/**
 * <code>BasicMathCmd</code> implements the basic math commands, +, -, *, and /.
 * 
 * @author <a href="mailto:davidw@dedasys.com">David N. Welton </a>
 * @version 1.0
 */

class BasicMathCmd implements Command {

    public void cmdCode(Interp interp, Thing[] argv) throws HeclException {
        char cmd = (argv[0].getStringRep()).charAt(0);
        switch (cmd) {
            case '+' :
                interp.setResult(IntThing.create(IntThing.get(argv[1])
                        + IntThing.get(argv[2])));
                break;
            case '-' :
                interp.setResult(IntThing.create(IntThing.get(argv[1])
                        - IntThing.get(argv[2])));
                break;
            case '*' :
                interp.setResult(IntThing.create(IntThing.get(argv[1])
                        * IntThing.get(argv[2])));
                break;
            case '/' :
                interp.setResult(IntThing.create(IntThing.get(argv[1])
                        / IntThing.get(argv[2])));
                break;
        }
    }
}
