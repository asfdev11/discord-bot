import 'package:nyxx/nyxx.dart';

import '../../../env.dart';
import '../errors/robot_errors.dart';
import '../errors/settings_errors.dart';
import 'command.dart';

abstract class IRobot {
  INyxxWebsocket? robot;

  List<ICommand> commands = [];

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
      robot?.dispose();
      if (exception != null) {
        print(
            'CLOSING ${runtimeType.toString()} BECAUSE AN EXCEPTION OCCURRED\nMESSAGE: ${exception.message}');
      } else {
        print('CLOSING ${runtimeType.toString()}');
      }
    }
  }

  void startRobot(INyxxWebsocket websocket) {
    robot = websocket;
    for (var command in commands) {
      _add(command);
    }
    robot!.connect();
  }

  void _add(ICommand command) {
    if (robot != null) {
      robot!.eventsWs.onMessageReceived.listen((event) {
        if (event.message.author.bot) return;
        if (!event.message.content.startsWith(Env.prefix)) return;

        var args = event.message.content.trim().split(' ');
        var cmd = args[0].substring(1).toLowerCase();

        if (cmd == command.name || command.aliases.contains(cmd)) {
          command.listen(event);
        }
      });
    } else {
      throw AddMiddlewareException('Robot instance is null');
    }
  }
}
