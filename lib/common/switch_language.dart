// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:go_router/go_router.dart';
// import 'package:jobspot/router.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LanguageCubit(),
//       child: BlocBuilder<LanguageCubit, Locale>(
//         builder: (context, lang) {
//           return MaterialApp.router(
//             locale: lang,
//             debugShowCheckedModeBanner: false,
//             routerDelegate: appRouter.routerDelegate,
//             routeInformationProvider: appRouter.routeInformationProvider,
//             routeInformationParser: appRouter.routeInformationParser,
//             localizationsDelegates: AppLocalizations.localizationsDelegates,
//             supportedLocales: AppLocalizations.supportedLocales,
//           );
//         },
//       ),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // context.read<LanguageCubit>().changeStartLang();
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(AppLocalizations.of(context)!.appTitle),
//             const Divider(),
//             TextButton(
//               onPressed: () {
//                 context.read<LanguageCubit>().changeLang(context, 'en');
//               },
//               child: const Text('English'),
//             ),
//             TextButton(
//               onPressed: () {
//                 context.read<LanguageCubit>().changeLang(context, 'ka');
//               },
//               child: const Text('ქართული'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LanguageCubit extends Cubit<Locale> {
//   LanguageCubit() : super(const Locale('ka'));

//   void changeLang(context, String data) async {
//     emit(Locale(data, ''));
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('lang', data);
//   }
// }
