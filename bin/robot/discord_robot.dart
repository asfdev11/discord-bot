import 'package:nyxx/nyxx.dart';
import 'package:shelf_modular/shelf_modular.dart';

import '../framework/classes/nyxx_settings.dart';
import '../framework/interfaces/robot.dart';
import '../framework/errors/settings_errors.dart';
import 'settings/robot_settings.dart';

import '../../env.dart';

class DiscordRobot extends IRobot {
  final IRobotSettings settings;

  DiscordRobot(this.settings);

  @override
  void initState() {
    super.initState();
  }

  @override
  void build() {
    super.build();
    var result = settings.createSettings(NyxxSettings(
        token: Env.token, gatewayIntents: GatewayIntents.allUnprivileged));

    result.fold((l) => close(l), (r) => null);
  }

  @override
  void close([ISettingsException? exception]) {
    super.close(exception);
  }
}
