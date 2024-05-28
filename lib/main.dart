import 'package:drugpack/router/router.dart';
import 'package:drugpack/themes/themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final futures = [
    EasyLocalization.ensureInitialized(),
  ];

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemStatusBarContrastEnforced: true,
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );

  await Future.wait(futures);

  if (kIsWeb) BrowserContextMenu.disableContextMenu();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: "assets/translations",
      fallbackLocale: const Locale("ru"),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Grid',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      // backButtonDispatcher: dispatcher,
    );
  }
}

