import 'package:flutter/material.dart';
import 'package:flutter_placeholder_app/domain/usecases/fetch_post_usecase.dart';
import 'package:flutter_placeholder_app/domain/usecases/fetch_user_usecase.dart';
import 'data/post_repository_impl.dart';
import 'data/user_repository_impl.dart';
import 'domain/repositories/user_repositoy.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/post_provider.dart';
import 'domain/usecases/login_auth_usecase.dart';
import 'domain/repositories/post_repository.dart';
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
        Provider<PostRepository>(create: (_) => PostRepositoryImpl()),
        Provider<UserRepository>(create: (_) => UserRepositoryImpl()),
        Provider<LoginAuthUseCase>(create: (_) => LoginAuthUseCase()),
        Provider<FetchUsersUseCase>(
            create: (context) =>
                FetchUsersUseCase(context.read<UserRepository>())),
        Provider<FetchPostsUseCase>(
            create: (context) =>
                FetchPostsUseCase(context.read<PostRepository>())),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(context.read<LoginAuthUseCase>()),
        ),
        ChangeNotifierProvider<PostProvider>(
            create: (context) => PostProvider(context.read<FetchPostsUseCase>(),
                context.read<FetchUsersUseCase>())),
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
