import 'dart:io';

import 'dart:math';

void main(){
    var hiddenNumber = getRandomNumber(1, 101);
    print(hiddenNumber);
    for(;;){
    stdout.write("Введите число: ");
    int inputUserNumber = int.parse(stdin.readLineSync()!);
    var answer = comparisonOfNumber(hiddenNumber,inputUserNumber);
    if (answer == 'OK'){
        print('Вы выиграли');
        break;
    }
    else{
        print('Число $answer загаданного');
    }
    }
    // var name = stdin.readLineSync();
    // stdout.write(name);
    //
    // void printValue(int value){
    //     print(value);
    // }
    // printValue(123);
    //
    //     var number = 0;
//     int intValue = 42;
//     double doubleValue = 12.22;
//     num value = getValueFromServer();
//     print(number.runtimeType);
//     print(doubleValue.runtimeType);
//     print(value.runtimeType);
//
//     String str = "Hello world";
//     int numb = 42;
//     print("${str.toUpperCase()} - $numb");
//
//     print(1 == int.parse('1'));
//     print(12.22 == double.parse('12.22'));
//
// }
// double getValueFromServer(){
//     return 12.88;
}

getRandomNumber(min, max){
    var rn = new Random();
    return min + rn.nextInt(max - min);
}

comparisonOfNumber(int hiddenNumber,int inputUserNumber){
    String answer = "";
    if (hiddenNumber == inputUserNumber){
        answer = "OK";
    }
    else if (hiddenNumber > inputUserNumber){
        answer = "меньше";
    }
    else if (hiddenNumber < inputUserNumber){
         answer = "больше";
    }
    return answer;
}