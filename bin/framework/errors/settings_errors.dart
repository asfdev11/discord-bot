abstract class ISettingsException implements Exception {
  final String message;

  ISettingsException(this.message);
}

class CreateSettingsException extends ISettingsException {
  CreateSettingsException(String message) : super(message);
}
