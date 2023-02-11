//checkKind(kind value)

var effect,effectDigits;
effect = argument0;
effectDigits = string_digits(argument0);

//if no numeral value return '0'
if (effect == '' or effectDigits == '') return '0';
//otherwise return numeral value
else return effectDigits;
