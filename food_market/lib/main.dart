import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/helpers/theme.dart';
import 'package:food_market/l10n/l10n.dart';
import 'package:food_market/providers/locale_provider.dart';
import 'package:food_market/providers/theme_provider.dart';
import 'package:food_market/route_management.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('darkTheme', false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, theme, locale, child) {
          return GetMaterialApp(
            title: 'Food Market',
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.rightToLeftWithFade,
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode: (theme.isDarkTheme == false) 
                      ? ThemeMode.light
                      : ThemeMode.dark,
            locale: locale.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            initialRoute: Routes.splash,
            getPages: allPages,
          );
        },
      ),
    );
  }
}
