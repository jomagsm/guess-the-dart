import 'dart:io';

import 'dart:math';

void main() {
  compGuess();
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
  var difficultyLevel;
  stdout.write("Выберите уровень:\n1) Легкий\n"
                                  "2) Средний \n");
  int choose = int.parse(stdin.readLineSync()!);
  if(choose==1){
    difficultyLevel = 1;}
  else if(choose==2){
    difficultyLevel = 2;
  }
  for (;;) {
    steps += 1;
    int number;
    if (difficultyLevel==1){number = getRandomNumber(min, max);}
    else{number = getMiddle(min, max);}
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

getRandom(min,max){
  return getRandomNumber(min, max);
}

getMiddle(min,max){
  return (min+max)~/2;
}