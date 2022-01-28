import '../../../env.dart';
import '../errors/settings_errors.dart';

abstract class IRobot {
  void initState() {
    if (Env.enableLogs) {
      print('INITIALIZING ${runtimeType.toString()}');
    }
    build();
  }

  void build() {
    if (Env.enableLogs) {
      print('BUILDING ${runtimeType.toString()}');
    }
  }

  void close([ISettingsException? exception]) {
    if (Env.enableLogs) {
      if (exception != null) {
        print(
            'CLOSING ${runtimeType.toString()} BECAUSE AN EXCEPTION OCCURRED\nMESSAGE: ${exception.message}');
      } else {
        print('CLOSING ${runtimeType.toString()}');
      }
    }
  }
}
