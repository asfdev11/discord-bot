import 'package:nyxx/nyxx.dart';

import '../../../../../framework/interfaces/command.dart';

class KickCommand implements ICommand {
  @override
  String get name => 'kick';

  @override
  List<String> get aliases => [];

  @override
  void listen(IMessageReceivedEvent event, [List<String>? args]) async {
    final permissions = await event.message.member!.effectivePermissions;
    if (permissions.hasPermission(PermissionsConstants.kickMembers)) {
      final user = await event.message.mentions.first.download();
      final guild = await event.message.guild!.download();
      final member = await guild.fetchMember(user.id);
      member.kick(auditReason: 'Você foi kickado');
    } else {
      event.message.channel.sendMessage(
          MessageBuilder.content('Você não tem permissões para isso.'));
    }
  }
}
