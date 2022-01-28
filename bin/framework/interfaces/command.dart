import 'package:nyxx/nyxx.dart';

abstract class ICommand {
  final String name;
  final List<String> aliases;

  ICommand(this.name, [this.aliases = const []]);

  Future<void> listen(IMessageReceivedEvent event, [List<String>? args]);
}
