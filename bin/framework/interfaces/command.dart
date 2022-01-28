import 'package:nyxx/nyxx.dart';

abstract class ICommand {
  final String name;

  ICommand(this.name);

  void listen(IMessageReceivedEvent event, [List<String>? args]);
}
