import 'package:nyxx/nyxx.dart';

import 'robot/discord_robot.dart';

void main(List<String> arguments) {
  /*final bot = NyxxFactory.createNyxxWebsocket(
      'OTI5NTAwNDQ2NTgwNjk5MTk4.YdoOvw.gA6HH2RifRcAU5VEB6N-Fo63HrI',
      GatewayIntents.allUnprivileged)
    ..registerPlugin(IgnoreExceptions())
    ..connect();

  bot.eventsWs.onReady.listen((event) {
    print('I\'m ready');
  });*/
  DiscordRobot discordRobot = DiscordRobot();
}
