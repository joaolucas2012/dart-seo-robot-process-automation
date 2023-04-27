/// This function is used to create a delay with the given number of seconds
Future<void> delay(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}
