import '../../../env.dart';

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

  void close() {
    if (Env.enableLogs) {
      print('CLOSING ${runtimeType.toString()}');
    }
  }
}
