import 'package:shelf_modular/shelf_modular.dart';

import 'app_module.dart';

void main(List<String> arguments) {
  final module = AppModule();
  Modular(module: module);
  module.start();
}
