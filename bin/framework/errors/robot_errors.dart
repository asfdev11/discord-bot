abstract class IRobotException implements Exception {
  final String message;

  IRobotException(this.message);
}

class AddMiddlewareException extends IRobotException {
  AddMiddlewareException(String message) : super(message);
}
