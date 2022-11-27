import 'package:flutter/material.dart';
import 'package:jobspot/config/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/app/bloc/app_bloc.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jobspot/screens/login/view/view.dart';
import 'package:jobspot/screens/sign_up/sign_up.dart';
import 'package:jobspot/screens/splash/splash.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const SplashScreen(),
      theme: AppTheme.light,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const Scaffold(body: Center(child: Text('HI')))
      },
      initialRoute: '/',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
