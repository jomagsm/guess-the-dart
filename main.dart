import 'dart:io';

import 'dart:math';

void main() {
  startGame();
}
void startGame(){
  stdout.write("Выберите режим игры:\n"
               "1)Компьютер угадывает число\n"
               "2)Пользователь угадывает число\n");
  int inputUser = int.parse(stdin.readLineSync()!);
  if(inputUser==1){
    compGuess();
  }
  else if(inputUser==2){
    userGuess();
  }
}

int getRandomNumber(min, max) {
  var rn = new Random();
  return min + rn.nextInt(max - min);
}

String comparisonOfNumber(int hiddenNumber, int inputUserNumber) {
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

void userGuess() {
  var hiddenNumber = getRandomNumber(1, 101);
  int steps = 0;
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

void compGuess() {
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

int getRandom(min,max){
  return getRandomNumber(min, max);
}

int getMiddle(min,max){
  return (min+max)~/2;
}