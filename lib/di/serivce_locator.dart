import 'package:get_it/get_it.dart';
import 'package:sinarmas/data/local/database_manager.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(openConnection());
}
