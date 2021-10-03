class UnknownHandleException implements Exception {
  final String message;

  UnknownHandleException(this.message);
  @override
  String toString() {
    return message;
  }
}
