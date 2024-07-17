import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/provider/user_provider.dart';
import 'auth/ui/welcome_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buy Smart',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const WelcomeScreen(),
    );
  }
}
