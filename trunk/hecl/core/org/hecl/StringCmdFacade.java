/* Copyright 2006 David N. Welton

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

class StringCmdFacade implements Command {
    private int cmdtype;

    public StringCmdFacade(int cmd) {
	cmdtype = cmd;
    }

    public void cmdCode(Interp interp, Thing[] argv) throws HeclException {
	StringCmds.dispatch(cmdtype, interp, argv);
    }
}
