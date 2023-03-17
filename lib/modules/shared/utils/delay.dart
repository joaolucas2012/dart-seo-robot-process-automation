class Time {
  /// This method is used to create a delay with the given number of seconds
  static Future<void> delay(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
  }
}
