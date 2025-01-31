import 'package:blog_app_flutter/core/secrets/app_secrets.dart';
import 'package:blog_app_flutter/core/theme/theme.dart';
import 'package:blog_app_flutter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app_flutter/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(
                supabase.client,
              ),
            ),
          ),
        ),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}
