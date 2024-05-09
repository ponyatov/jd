module syntax;

import pegged.grammar;

mixin(grammar("
ini:
    term < any*
    any < .
"));
