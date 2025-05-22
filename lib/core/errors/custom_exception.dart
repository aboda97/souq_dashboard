class CustomException implements Exception {
  final String exceptionMsg;

  CustomException({required this.exceptionMsg});
  @override
  String toString() {
    return exceptionMsg;
  }
}
