/*
 * Copyright 2005-2006
 * Wolfgang S. Kechel, data2c GmbH (www.data2c.com)
 * 
 * Author: Wolfgang S. Kechel - wolfgang.kechel@data2c.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.hecl.midp20.lcdui;

import org.hecl.HeclException;
import org.hecl.Interp;
import org.hecl.Properties;
import org.hecl.Thing;

public abstract class OwnedThingCmd extends ThingCmd {
    public OwnedThingCmd(Interp ip,Object x,Properties p) throws HeclException {
	super(x);
	creator = ip;

	if(p != null) {
	    Thing optargs[] = p.getProps();
	    configure(creator,optargs,0,optargs.length);
	}
    }


    public Interp getCreator() {
	return creator;
    }


    private Interp creator;
}
    