import 'package:nyxx/nyxx.dart';

import '../../../../framework/interfaces/command.dart';

class ServerCommand implements ICommand {
  @override
  String get name => 'server';

  @override
  List<String> get aliases => [];

  @override
  void listen(IMessageReceivedEvent event, [List<String>? args]) {
    print('Received command to server from guild ${event.message.guild!.id}');
  }
}
