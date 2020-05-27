import 'package:chatapp/providers/locator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth_provider.dart';
import 'conversation_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => locator<ConversationProvider>(),
  ),
  ChangeNotifierProvider(
    create: (context) => locator<AuthProvider>(),
  ),
];