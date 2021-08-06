import 'package:easyrecord/DatabaseManager/auth_repo.dart';
import 'package:easyrecord/DatabaseManager/storage_repo.dart';
import 'package:easyrecord/view_controller/user_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserController>(UserController());
}