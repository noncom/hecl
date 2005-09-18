test list-1 {
    set bar [list a b   c]
    set bar
} {a b c}


test list-2 {
    set bar {a b c}
    set bar
} {a b c}

test list-3 {
    set bar [list a   b c]
    set bar
} {a b c}

test lappend-4 {
    set bar [list a b c]
    set foo &bar
    lappend &bar d
    set foo
} {a b c d}

test lrange-5 {
    set foo {a b c d e f g}
    lrange $foo 0 2
} {a b c}

test lrange-6 {
    set foo {a b c d e f g}
    lrange $foo 3 -1
} {d e f g}

test lrange-7 {
    set foo {a b c d e f g}
    lrange $foo -2 -1
} {f g}
