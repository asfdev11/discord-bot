import 'package:dartz/dartz.dart';
import 'package:nyxx/nyxx.dart';

import '../../framework/classes/nyxx_settings.dart';
import '../../framework/errors/settings_errors.dart';

abstract class IRobotSettings {
  Either<ISettingsException, INyxxWebsocket> createSettings(
      NyxxSettings settings);
}

class RobotSettings implements IRobotSettings {
  @override
  Either<ISettingsException, INyxxWebsocket> createSettings(
      NyxxSettings settings) {
    INyxxWebsocket websocket;
    try {
      websocket = NyxxFactory.createNyxxWebsocket(
          settings.token, settings.gatewayIntents);

      for (var plugin in settings.plugins) {
        websocket.registerPlugin(plugin);
      }
    } catch (e) {
      return left(CreateSettingsException(e.toString()));
    }

    return right(websocket);
  }
}
