import 'dart:io';

import 'dart:math';

void main() {
  var hiddenNumber = getRandomNumber(1, 101);

  // userGuess(hiddenNumber);
  compGuess();
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

getRandomNumber(min, max) {
  var rn = new Random();
  return min + rn.nextInt(max - min);
}

comparisonOfNumber(int hiddenNumber, int inputUserNumber) {
  String answer = "";
  if (hiddenNumber == inputUserNumber) {
    answer = "OK";
  } else if (hiddenNumber > inputUserNumber) {
    answer = "меньше";
  } else if (hiddenNumber < inputUserNumber) {
    answer = "больше";
  }
  return answer;
}

userGuess(hiddenNumber) {
  int steps = 0;
  print(hiddenNumber);
  for (;;) {
    steps += 1;
    stdout.write("Введите число: ");
    int inputUserNumber = int.parse(stdin.readLineSync()!);
    var answer = comparisonOfNumber(hiddenNumber, inputUserNumber);
    if (answer == 'OK') {
      print('Вы выиграли за $steps хода');
      break;
    } else {
      print('Число $answer загаданного');
    }
  }
}

compGuess() {
  int steps = 0;
  var min = 0;
  var max = 101;
  for (;;) {
    steps += 1;
    print('$min $max');
    var number = getRandomNumber(min, max);
    print('Это число $number?');
    var userAnswer = stdin.readLineSync();
    if (userAnswer == 'less') {
      max = number;
    } else if (userAnswer == 'greater') {
      min = number + 1;
    } else if (userAnswer == 'yes') {
      print('Компьютер угадал за $steps хода');
      break;
    }
  }
}
