import 'package:nyxx/nyxx.dart';

import '../framework/classes/nyxx_settings.dart';
import '../framework/interfaces/command.dart';
import '../framework/interfaces/robot.dart';
import 'middlewares/commands/utils/server_command.dart';
import 'settings/robot_settings.dart';

import '../../env.dart';

class DiscordRobot extends IRobot {
  final IRobotSettings settings;

  @override
  List<ICommand> commands = [ServerCommand()];

  DiscordRobot(this.settings);

  @override
  void build() {
    super.build();
    var result = settings.createSettings(NyxxSettings(
        token: Env.token, gatewayIntents: GatewayIntents.allUnprivileged));

    result.fold((l) => close(l), (r) => [super.startRobot(r)]);
  }
}
