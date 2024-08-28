import 'package:flutter/material.dart';
import 'domain/providers/auth_provider.dart';
import 'domain/services/auth_service.dart';
import 'presentation/login/login_screen.dart';
import 'package:provider/provider.dart';

import 'presentation/posts/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(context.read<AuthService>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter JsonPlaceholder App',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepOrange,
          primaryColor: const Color(0xFFF94E22), // FUDO hexa
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFF94E22),
            brightness: Brightness.light,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFFF94E22),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/posts': (context) => const PostsScreen(),
        },
      ),
    );
  }
}
