import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onhigh_ai/constants/constants.dart';
import 'package:onhigh_ai/providers/chats_provider.dart';
import 'package:onhigh_ai/providers/models_provider.dart';
import 'package:onhigh_ai/screens/chat_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_logIn_signUp/screens/reset_password.dart';
import 'firebase_logIn_signUp/screens/signin_screen.dart';
import 'firebase_logIn_signUp/screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter ChatBOT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
              color: cardColor,
            )),
        initialRoute: 'signin_screen',
        routes: {
          'chat_screen': (context) => ChatScreen(),
          'signin_screen': (context) => SignInScreen(),
          'signup_screen': (context) => SignUpScreen(),
          'reset_password': (context) => ResetPassword()
        },
      ),
    );
  }
}
