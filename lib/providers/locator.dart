
import 'package:chatapp/providers/auth_provider.dart';
import 'package:get_it/get_it.dart';

import 'conversation_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(()=> ConversationProvider());
  locator.registerFactory(()=> AuthProvider());
}