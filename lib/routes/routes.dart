import 'package:chat_private/pages/chat_page.dart';

import 'package:flutter/material.dart';

import 'package:chat_private/pages/loading_page.dart';
import 'package:chat_private/pages/login_page.dart';
import 'package:chat_private/pages/register_page.dart';
import 'package:chat_private/pages/users_pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => const UsersPage(),
  'chat': (_) => const ChatPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'loading': (_) => const LoadingPage(),
};
