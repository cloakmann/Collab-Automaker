//checkKind(kind value)

var kind,kindDigits;
kind = argument0;
kindDigits = string_digits(argument0);

//if no numeral value return '0'
if (kind == '' or kindDigits == '') return '0';
//if numeral value negative or outbound return '0'
else if(real(kindDigits) > 31 or string_pos('-',kind) != 0){
    return '0';
}
//otherwise return numeral value
else return kindDigits;
