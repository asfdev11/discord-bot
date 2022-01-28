import 'package:nyxx/nyxx.dart';

class NyxxSettings {
  final String token;
  final int gatewayIntents;
  final List<BasePlugin> plugins;

  NyxxSettings(
      {required this.token,
      required this.gatewayIntents,
      this.plugins = const []});
}
