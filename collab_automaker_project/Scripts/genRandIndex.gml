var output;
//output = "inst_";
output = "";

var rand;
rand = 0;

repeat(8){
    //generate a random hex number in decimal
    rand = irandom(15);
    switch (rand){
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
            output += string(rand);
            break;
        case 10:
            output += 'A';
            break;
        case 11:
            output += 'B';
            break;
        case 12:
            output += 'C';
            break;
        case 13:
            output += 'D';
            break;
        case 14:
            output += 'E';
            break;
        case 15:
            output += 'F';
            break;
    }
}
return output;
