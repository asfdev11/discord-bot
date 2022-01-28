import 'package:shelf_modular/shelf_modular.dart';

import 'framework/interfaces/robot.dart';
import 'robot/discord_robot.dart';
import 'robot/settings/robot_settings.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => RobotSettings()),
        Bind.singleton((i) => DiscordRobot(i<IRobotSettings>()))
      ];

  start() {
    final robot = Modular.get<IRobot>();
    robot.initState();
  }
}
