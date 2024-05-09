import std.stdio;
import std.range;
import std.file;

import syntax;

void main(string[] args) {
    arg(0, args[0]);
    foreach (argc,argv; args[1..$].enumerate(1))
    {
        arg(argc,argv);
        writeln(syntax.ini(readText(argv)));
    }
}

void arg(int argc, string argv) { //
    writefln("argv[%d] = <%s>", argc, argv);
}
