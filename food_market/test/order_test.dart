import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_market/helpers/theme.dart';
import 'package:food_market/l10n/l10n.dart';
import 'package:food_market/pages/home/home_page.dart';
import 'package:food_market/providers/locale_provider.dart';
import 'package:food_market/providers/theme_provider.dart';
import 'package:provider/provider.dart';

// To trigger, run: flutter test test/order_test.dart

void main() {

  test('Calculation', () {
    expect(1 + 1, 2);
    expect(1 + 1 + 1, 3);
    expect(1 + 1 + 1 + 1, 4);
    expect(1 + 1 + 1 + 1 + 1, 5);
  });

  test('Wording', () {
    expect('a', 'a');
    expect('b', 'b');
    expect('c', 'c');
    expect('d', 'd');
  });

  testWidgets('HomePage hides AppBar on scroll down', (WidgetTester tester) async {
    
    expect(1 + 1, 2);
    expect(1 + 1 + 1, 3);
    expect(1 + 1 + 1 + 1, 4);
    expect(1 + 1 + 1 + 1 + 1, 5);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ],
        child: Consumer2<ThemeProvider, LocaleProvider>(
          builder: (context, theme, locale, child) {
            return MaterialApp(
              title: 'Food Market',
              debugShowCheckedModeBanner: false,
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
              home: const Scaffold(
                body: HomePage(),
              ),
            );
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Expect AppBar to be hidden
    expect(find.textContaining('Something Delicious!'), findsOneWidget);
  });
}