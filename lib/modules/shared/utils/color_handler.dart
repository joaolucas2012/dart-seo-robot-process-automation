import 'package:chalkdart/chalk.dart';

void printError(String message) {
  print(chalk.bold.red(message));
}

void printInfo(String message) {
  print(chalk.bold.cyan(message));
}

void printColored(String message) {
  print(chalk.bold.white(message));
}

void printSuccess(String message) {
  print(chalk.bold.green(message));
}
