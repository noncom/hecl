## script.hcl - this is a series of Hecl/Android examples
## demonstrating various parts of the API.

# Hash table containing a mapping from titles like 'Web View' to proc
# names like WebView
set titles_names {}



# main --
#
#	The initial, main screen.

proc main {} {
    global context
    global procname

    set procname main
    set layout [linearlayout -new $context]
    $layout setorientation VERTICAL
    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set tv [textview -new $context -text {Welcome to Hecl on Android. This is a short tour of some of the functionality that can be scripted in Hecl.} -layoutparams $layoutparams]

    $layout addview $tv

    set lview [basiclist $context [list "Introduction" "Simple Widgets" "Web View" "Date Picker" \
				       "Time Picker" "Progress Dialog" "Spinner" \
				       "Hecl Editor" "Hecl Server" \
				       "Contacts" "Task List"] \
		   -layoutparams $layoutparams]

    $lview requestfocus
    $layout addview $lview

    set callback [callback -new [list [list SelectDemo]]]
    $lview setonitemclicklistener $callback

    [activity] setcontentview $layout

    MenuSetup
}

# MenuSetup --
#
#	Set up the menus so that it's possible to see the source code
#	for the current widget demo/proc.

proc MenuSetup {} {
    # Used to set up a callback for when the menu is requested by the
    # user, and it's necessary to set it up.

    proc MenuCallBack {menu} {
	$menu add "View Source"
    }

    [activity] -field onCreateOptionsMenuCallBack MenuCallBack

    # Sets up the actual callback code for when a menu item is
    # selected.

    proc OptionsSelected {menuitem} {
	viewCode
    }

    [activity] -field onOptionsItemSelectedCallBack OptionsSelected
}

# This is used everywhere, so making it a global is no big deal.
set context [activity]

# Start things running.
main

# CreateActivity --
#
#	CreateActivity and RunActivity

proc CreateActivity {name title code} {
    global titles_names
    hset $titles_names $title $name

    set setup "\[activity\] settitle"
    append $setup " \"$title\" \n"
    append $setup "\n"
    append $setup "MenuSetup\n"
    append $setup "global procname\n"
    append $setup "set procname $name\n"
    append $setup $code

    proc $name {} $setup
}

CreateActivity Introduction "Introduction" {
    set textsize 20.0
    set context [activity]

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set scroll [scrollview -new $context -layoutparams $layoutparams]

    set layout [linearlayout -new $context -layoutparams $layoutparams]
    $layout setorientation VERTICAL

    $scroll addview $layout
    [activity] setcontentview $scroll

    $layout addview [textview -new $context \
			   -text "Hello, and welcome to Hecl on Android.  This application gives you a brief overview of some of the things the Hecl scripting language is capable of on Android.  And of course, the entire application is written in Hecl!\n\nYou can even view and edit the source code by using the 'view source' menu button." \
			   -layoutparams $layoutparams -textsize $textsize]
}

# SimpleWidgets --
#
#	A demo of some basic widgets: textview, button, edittext and
#	digitalclock and imagebutton.

CreateActivity SimpleWidgets "Simple Widgets" {
    set textsize 30.0

    set context [activity]

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set scroll [scrollview -new $context -layoutparams $layoutparams]

    set swlayout [linearlayout -new $context -layoutparams $layoutparams]
    $swlayout setorientation VERTICAL

    $scroll addview $swlayout
    [activity] setcontentview $scroll

    $swlayout addview [button -new $context -text "This is a button" \
			   -layoutparams $layoutparams]

    $swlayout addview [edittext -new $context \
			   -text "This is editable text" \
			   -layoutparams $layoutparams]

    $swlayout addview [textview -new $context \
			   -text "Digital clock:" \
			   -layoutparams $layoutparams -textsize $textsize]

    java android.widget.DigitalClock digitalclock

    $swlayout addview [digitalclock -new $context \
			   -layoutparams $layoutparams -textsize $textsize]

    java android.widget.ImageButton imagebutton

    set ib [imagebutton -new $context -layoutparams $layoutparams]
    $swlayout addview $ib
    $ib setImageResource [reslookup "R.drawable.buttonhecl"]


    # Since this is added to the linearlayout, it has to have
    # linearlayoutparams

    java {android.widget.RadioGroup$LayoutParams} radiogrouplayoutparams
    java android.widget.RadioButton radiobutton
    java android.widget.RadioGroup radiogroup

    set radiolayoutparams [radiogrouplayoutparams -new {FILL_PARENT WRAP_CONTENT}]
    set radiogroup \
	[radiogroup -new $context \
	     -layoutparams [linearlayoutparams -new {FILL_PARENT FILL_PARENT}]]

    $radiogroup setorientation VERTICAL

    $swlayout addview [textview -new $context \
			   -text "Radio buttons:" \
			   -layoutparams $layoutparams -textsize $textsize]

    $swlayout addview $radiogroup

    $radiogroup addview [radiobutton -new $context \
			     -text "Android" -layoutparams $radiolayoutparams]
    $radiogroup addview [radiobutton -new $context \
			     -text "JavaME" -layoutparams $radiolayoutparams]
    $radiogroup addview [radiobutton -new $context \
			     -text "Flash Lite" -layoutparams $radiolayoutparams]

    $swlayout addview [textview -new $context \
			   -text "Check boxes - pick any two:" \
			   -layoutparams $layoutparams -textsize $textsize]

    java android.widget.CheckBox checkbox
    set cb1 [checkbox -new $context \
		 -text "Fast" -layoutparams $layoutparams]
    set cb2 [checkbox -new $context \
		 -text "Cheap" -layoutparams $layoutparams]
    set cb3 [checkbox -new $context \
		 -text "Good" -layoutparams $layoutparams]

    set callback [callback -new [list [list CheckBoxCallback $cb1 $cb2 $cb3]]]

    foreach cb [list $cb1 $cb2 $cb3] {
	$cb setoncheckedchangelistener $callback
	$swlayout addview $cb
    }
}

# WebView --
#
#	Demonstrate the WebView widget.

CreateActivity WebView "Web View" {
    set context [activity]
    set procname WebView

    set layoutparams [linearlayoutparams -new {WRAP_CONTENT WRAP_CONTENT}]

    java "android.webkit.WebView" webview

    set wv [webview -new $context -layoutparams $layoutparams]
    [activity] setcontentview $wv
    # Fetch the Hecl web page, which, unfortunately, isn't all that
    # beautiful ...
    $wv loadurl http://www.hecl.org
    $wv requestfocus
}

# Callback --
#
#	Generic callback proc to hand off to various widgets.

proc Callback {args} {
    set args [lrange $args 1 -1]
    alert "Callback called with arguments: $args"
}

# DatePicker --
#
#	Put a datepicker dialog up on the screen.

proc DatePicker {} {
    global context

    java android.app.DatePickerDialog datedialog

    set callback [callback -new [list [list Callback]]]
    set dp [datedialog -new [list $context $callback 2007 10 1]]
    $dp show
}

# TimePicker --
#
#	Put a time picker dialog up on the screen.

proc TimePicker {} {
    global context

    java android.app.TimePickerDialog timedialog

    set callback [callback -new [list [list Callback]]]
    set tp [timedialog -new [list $context $callback 5 0 0]]
    $tp show
}

# ProgressDialog --
#
#	Create a "progress bar", and, via the updateProgress proc,
#	update it and finally dismiss it.

proc ProgressDialog {} {
    global context

    java android.app.ProgressDialog progressdialog

    set pd [progressdialog show $context "Working..." \
		"This is a progress dialog - it lasts 5 seconds" 0 0]
    updateProgress $pd 0
}

# updateProgress --
#
#	This proc is called at intervals to update the progress
#	dialog, and then dismiss it when its time is up.  This is done
#	via the after command.

proc updateProgress {pd progress} {
    $pd setprogress [i $progress]
    if { < $progress 5000 } {
	after 1000 [list updateProgress $pd [+ 2000 $progress]]
    } else {
	$pd dismiss
    }
}

# CheckBoxCallback --
#
#	This is the callback for the CheckBox code.  It ensures that
#	the user can only select two out of the three options.

proc CheckBoxCallback {cb1 cb2 cb3 checkbox ischecked} {
    # Only do something if the checkbox has been checked, rather than
    # unchecked.
    if { = 1 $ischecked } {
	set total 0
	foreach cb [list $cb1 $cb2 $cb3] {
	    incr $total [$cb ischecked]
	}
	# If they've checked the third of three, uncheck it.
	if { = $total 3 } {
	    $checkbox setchecked 0
	}
    }
}

# Spinner --
#
#	Displays a spinner, and links it to a textview via a callback,
#	SpinnerCallback.

CreateActivity Spinner "Spinner" {
    set procname Spinner
    set context [activity]

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set layout [linearlayout -new $context]
    $layout setorientation VERTICAL

    set spinner [basicspinner $context [list "Wheel" "Of" "Fortune!"] \
		     -layoutparams $layoutparams]
    $layout addview $spinner
    # requestfocus is necessary or you won't be able to access the
    # spinner if it's redisplayed.  I think this is an Android bug.
    $spinner requestfocus

    set selected [textview -new $context -text "Currently selected: Wheel" \
		      -layoutparams $layoutparams]
    $layout addview $selected

    set callback [callback -new [list [list SpinnerCallback $selected]]]
    $spinner setonitemselectedlistener $callback

    [activity] setcontentview $layout
}

# SpinnerCallback --
#
#	Display the currently selected spinner item.

proc SpinnerCallback {textview parent view position id} {
    set text [$view gettext]
    $textview settext "Currently selected: $text"
}

# HeclEditor --
#
#	Edit and run simple Hecl scripts.

CreateActivity HeclEditor "Hecl Editor" {
    set procname HeclEditor
    set context [activity]

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set layout [linearlayout -new $context]
    $layout setorientation VERTICAL

    $layout addview [textview -new $context \
			 -text "Hecl evaluator: enter code below and hit 'eval' to evaluate" \
			 -layoutparams $layoutparams]

    # The default script:
    set script {proc AddOne {num} {
    return [+ $num 1]
}
set res [AddOne 41]
alert "Result: $res"
set res
}

    set editor [edittext -new $context -text $script -layoutparams $layoutparams]
    $layout addview $editor

    set eval [button -new $context -text "Eval" -layoutparams $layoutparams]
    $layout addview $eval

    set results [textview -new $context -text "Results:" -layoutparams $layoutparams]
    $layout addview $results

    set callback [callback -new [list [list EditCallback $editor $results]]]
    $eval setonclicklistener $callback
    [activity] setcontentview $layout
}

# EditCallback --
#
#	Run the script and display the results.

proc EditCallback {editor results button} {
    set res "Results: [eval [$editor gettext]]"
    $results settext $res
}

# Contacts --
#
#	Display the phone's contact list.

CreateActivity Contacts "Contacts" {
    set context [activity]

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set layout [linearlayout -new $context]
    $layout setorientation VERTICAL

    $layout addview [textview -new $context \
			 -layoutparams $layoutparams \
			 -text "Contacts:" -textsize 32.0]

    set cursor [contentQuery content://contacts/people/]

    set i 0
    while { $cursor moveToNext } {
	set name [$cursor getstring [$cursor getcolumnindex name]]
	set number [$cursor getstring [$cursor getcolumnindex number]]
	$layout addview [textview -new $context \
			     -layoutparams $layoutparams \
			     -text "Who: $name Number: $number"]
	incr $i
    }
    if { = $i 0 } {
	$layout addview [textview -new $context \
			     -layoutparams $layoutparams \
			     -text "No contacts"]
    }

    [activity] setcontentview $layout
}

# TaskList --
#
#	Display a list of taks, and let the user switch between them.

CreateActivity TaskList "Task List" {
    set context [activity]

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set layout [linearlayout -new $context]
    $layout setorientation VERTICAL

    # Create ourselves some commands to access Android internals.
    java android.app.ActivityManagerNative activitymanagernative
    java android.app.IActivityManager iactivitymanager
    java android.content.ComponentName componentname
    java {android.app.ActivityManager$RunningTaskInfo} runningtaskinfo
    # Utilized to contain the result of gettasks

    set am [activitymanagernative getdefault]
    set tasks [$am gettasks 10 0 [null]]
    set tasklist {}
    set taskIdList {}
    foreach task $tasks {
	set baseactivity [$task -field baseactivity]
	lappend $tasklist "Task: [$baseactivity getpackagename]"
	lappend $taskIdList [$task -field id]
    }
    androidlog "IDs: $taskIdList"
    $layout addview [textview -new $context -layoutparams $layoutparams \
			 -text "Currently running tasks.  Click to switch:"]

    set lview [basiclist $context $tasklist -layoutparams $layoutparams]
    $layout addview $lview
    $lview requestfocus

    set callback [callback -new [list [list SelectTask $taskIdList]]]
    $lview setonitemclicklistener $callback

    [activity] setcontentview $layout
}

proc SelectTask {taskIdList parent view position id} {
    [activitymanagernative getdefault] movetasktofront [lindex $taskIdList $position]
}


# SelectScripts --
#
#	Display the available Hecl scripts in permanent storage.

CreateActivity SelectScripts "Hecl Scripts" {
    set  context [activity]

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set layout [linearlayout -new $context -layoutparams $layoutparams]
    $layout setorientation VERTICAL

    set cursor [contentQuery content://org.hecl.android.Scripts/scripts]

    $layout addview [textview -new $context -layoutparams $layoutparams -text "Available scripts:" -textsize 30.0]

    set scriptlist [list]
    while { $cursor next } {
	lappend $scriptlist [$cursor getstring 1]
    }

    set lview [basiclist $context $scriptlist -layoutparams $layoutparams]
    $layout addview $lview
    $lview requestfocus

    [activity] setcontentview $layout
}

# HeclServer --
#
#	Create a Hecl command-line server.  Listen for connections and
#	execute commands.

CreateActivity HeclServer "Hecl Server" {
    set context [activity]

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]

    set layout [linearlayout -new $context -layoutparams $layoutparams]
    $layout setorientation VERTICAL

    set port 7405

    $layout addview [textview -new $context \
			 -layoutparams $layoutparams \
			 -text "Running Hecl server on port ${port}.  You can telnet to this port to interact with Hecl after running this command: adb forward tcp:7405 tcp:7405\nSince the interpreter that you are accessing is a sub-interpreter, to run commands in the main interpreter, which has access to the Android GUI thread, you have to pass them with the maineval command, like this: maineval { ... code ... }"]

    set recvcode [textview -new $context -layoutparams $layoutparams]
    $layout addview $recvcode

    [activity] setcontentview $layout

    # We currently run the server in its own interpreter/thread, which
    # has some consequences: we can't do GUI stuff, or interact with
    # the rest of the running program in a meaningful way.  We use a
    # handler to do that via the maineval proc.
    set newi [interp -new [list]]
    [activity] loadlibs $newi

    set hh [[activity] getHandler]

    $newi setVar "handler" $hh
    $newi setVar "port" $port

    $newi evalAsync {
	java java.io.InputStream inputstream
	java java.io.OutputStream outputstream
	java java.io.InputStreamReader inputstreamreader
	java java.io.OutputStreamWriter outputstreamwriter
	java java.io.BufferedReader bufferedreader
	java java.net.ServerSocket serversock
	java java.net.Socket socket

	java org.hecl.android.HeclHandler heclhandler

	# Create a server socket.
	set serverSock [serversock -new [list $port]]

	set sock [$serverSock accept]

	# Create some line-oriented IO streams.
	set is [$sock getinputstream]
	set isr [inputstreamreader -new [list $is]]
	set br [bufferedreader -new [list $isr]]
	set os [$sock getoutputstream]
	set osw [outputstreamwriter -new [list $os]]
	global osw

	# Print something back to the socket.
	proc put {str} {
	    global osw
	    $osw write [s ${str}]
	    $osw flush
	}

	proc puts {str} {
	    put "${str}\n"
	}

	# Evaluate a command in the main interpreter - note that we
	# don't get the results back.
	proc maineval {code} {
	    global handler
	    set msg [message -new [list]]
	    $msg -field obj $code
	    $handler sendmessage $msg
	}

	java android.os.Message message

	# Main server loop.
	androidlog "Server operational on port $port"
	while { true } {
	    if { = 1 [catch {
		put "> "
		puts [eval [$br readline]]
	    } err] } {
		set errstr "HeclServer error: $err"
		androidlog $errstr
		puts $errstr
	    }
	}
    }
}

# SelectDemo --
#
#	Select which demo to display.

proc SelectDemo {parent view position id} {
    set dest [$view gettext]

    global titles_names
    set procname [hget $titles_names $dest]
    if { eq $procname "" } {
	# If the procname doesn't appear in the lookup table, it's one
	# of the following, and doesn't require its own activity.
	if {eq $dest "Date Picker"} {
	    DatePicker
	} elseif {eq $dest "Progress Dialog"} {
	    ProgressDialog
	} elseif {eq $dest "Time Picker"} {
	    TimePicker
	}
    } else {
	global context
	newActivity $context $procname
    }
}

# viewCode --
#
#	View the code of the proc that is currently displayed.

proc viewCode {} {
    global procname
    global context

    set layoutparams [linearlayoutparams -new {FILL_PARENT WRAP_CONTENT}]
    set layout [linearlayout -new $context -layoutparams $layoutparams]
    $layout setorientation VERTICAL

    set saverun [button -new $context -text "Save and Run" \
			 -layoutparams $layoutparams]
    $layout addview $saverun

    set scroll [scrollview -new $context -layoutparams $layoutparams]

    set text [intro proccode $procname]
    set editor [edittext -new $context \
			 -text [s $text] \
			 -layoutparams $layoutparams]
    $scroll addview $editor

    $layout addview $scroll

    [activity] setcontentview $layout

    set callback [callback -new [list [list SaveCode $editor $context $procname]]]
    $saverun setonclicklistener $callback
    set procname viewCode
}

# SaveCode --
#
#	Save the code and run it.

proc SaveCode {editor context procname button} {
    set txt [$editor gettext]
    proc $procname {} $txt
    newActivity $context $procname
}
