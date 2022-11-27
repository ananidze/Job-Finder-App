// import 'package:go_router/go_router.dart';
// import 'package:jobspot/common/error_screen.dart';
// import 'package:jobspot/config/app_route.dart';
// import 'package:jobspot/screens/login/view/login_page.dart';
// import 'package:jobspot/screens/sign_up/sign_up.dart';
// import 'package:jobspot/screens/splash/splash.dart';

// class ScreenPaths {
//   static String splash = '/';
//   static String login = '/log_in';
//   static String signup = '/sign_up';
//   static String home = '/home';
// }

// final appRouter = GoRouter(
//   redirect: (context, state) async {
//     // final AuthenticationRepository auth = AuthenticationRepository();
//     // final Future<User> isAuthenticated = auth.user;
//     // log('isAuthenticated: $isAuthenticated');
//     // log('isAuthenticated: ${auth.user}');
//     // final bool loggedIn = await AuthenticationRepository().isLoggedIn();
//     // if (!loggedIn) {
//     //   return '/login';
//     // }

//     return null;
//   },
//   errorBuilder: (context, GoRouterState state) => ErrorScreen(state.error!),
//   routes: [
//     AppRoute('/', (_) => const SplashScreen()),
//     AppRoute(ScreenPaths.login, (_) => const LoginPage()),
//     AppRoute(ScreenPaths.signup, (_) => const SignUpPage()),
//   ],
// );
