import 'dart:async';
import 'dart:math';

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
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('darkTheme', false);
  runApp(MyApp());
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _checkForScrollableWidgets();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _checkForScrollableWidgets();
  }

  void _checkForScrollableWidgets() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Obtain the current BuildContext using the Navigator's context
      final context = navigator?.context;
      if (context != null) {
        bool hasScrollableWidget = _findScrollableWidget(context);
        print(hasScrollableWidget
            ? 'Scrollable widget is present!'
            : 'No scrollable widget found!');
      }
    });
  }

  bool _findScrollableWidget(BuildContext context) {
    // Use Scrollable.maybeOf() to find if a scrollable widget is present
    print('_findScrollableWidget is triggered');
    try {
      return Scrollable.maybeOf(context) != null;
    } on Exception catch (_) {
      print('_findScrollableWidget error: $_');
      return false;
    }
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.home});

  final String? home;
  final screenshotController = ScreenshotController();

  Future<void> pressHandler(Widget? child, BuildContext context) async {
    print('Button pressed, updated 3');

    if (child == null) {
      print('Child is null. Abort.');
      
      return;
    }

    try {
      // Initial screenshot
      await screenshotController
      .capture(delay: const Duration(milliseconds: 100))
      .then((image) {
        if (image != null) {
          print('Capture Done');
        } else {
          print('Capture Failed');
        }
      }).catchError((onError) {
        print('Capture Error: $onError');
      });

      // Try to scroll down
      await scrollEachItem(child, screenshotController);
    }
    catch(err) {
      print('Error: $err');
    }

    try {
      final hasScrollable = _findScrollableWidget(context);

      if (hasScrollable) {
        print('It has scrollable!');
      }
      else {
        print('It has no scrollable!');
      }
    }
    catch(err) {
      print('Error: $err');
    }
  }

  bool isScrollable(dynamic widget) {
    return 
      // Check if widget is scrollable
      (
        widget is ListView &&
        // Check if widget has a scroll controller
        widget.controller != null &&
        // Check if widget has a max scroll extent
        widget.controller!.position.maxScrollExtent as num > 0 &&
        // Check if widget is not at the bottom
        widget.controller!.offset as num < widget.controller!.position.maxScrollExtent
      ) ||
      (
        widget is ScrollView &&
        // Check if widget has a scroll controller
        widget.controller != null &&
        // Check if widget has a max scroll extent
        widget.controller!.position.maxScrollExtent as num > 0 &&
        // Check if widget is not at the bottom
        widget.controller!.offset as num < widget.controller!.position.maxScrollExtent
      ) ||
      (
        widget is SingleChildScrollView &&
        // Check if widget has a scroll controller
        widget.controller != null &&
        // Check if widget has a max scroll extent
        widget.controller!.position.maxScrollExtent as num > 0 &&
        // Check if widget is not at the bottom
        widget.controller!.offset as num < widget.controller!.position.maxScrollExtent
      ) ||
      (
        widget is CustomScrollView &&
        // Check if widget has a scroll controller
        widget.controller != null &&
        // Check if widget has a max scroll extent
        widget.controller!.position.maxScrollExtent as num > 0 &&
        // Check if widget is not at the bottom
        widget.controller!.offset as num < widget.controller!.position.maxScrollExtent
      ) ||
      (
        widget is NestedScrollView &&
        // Check if widget has a scroll controller
        widget.controller != null &&
        // Check if widget has a max scroll extent
        widget.controller!.position.maxScrollExtent as num > 0 &&
        // Check if widget is not at the bottom
        widget.controller!.offset as num < widget.controller!.position.maxScrollExtent
      );
  }

  Future<int> scrollEachItem(
    dynamic child,
    ScreenshotController screenshotController,
  ) async {

    print('scrollEachItem is triggered');
    
    // Check if any scrollable widget exists
    // If not, return 0

    if (
      isScrollable(child) == true &&
      child.key != null &&
      child.key.currentContext != null &&
      child.key.currentContext!.findRenderObject() != null &&
      child.key.currentContext!.findRenderObject().size != null
    ) {
      print('Scrollable widget found');

      while (isScrollable(child) == true) {
        // Calculate the widget's height
        final num widgetHeight = (child.key.currentContext!.findRenderObject() as RenderBox).size.height;

        final num remainingScrollingHeight = (child.controller!.position.maxScrollExtent as num) - (child.position.pixels as num);

        final num maxScrollableExtend = min(
          remainingScrollingHeight,
          widgetHeight
        );

        // Scroll down
        child.controller?.animateTo(
          maxScrollableExtend,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }

    final scrollableWidgets = <dynamic>[];

    if (child is Column) {
      for (final widget in child.children) {
        if (isScrollable(widget) == true) {
          scrollableWidgets.add(widget);
        }
      }
    }
    
    return 0;
  }
  
  bool _findScrollableWidget(BuildContext context) {
    // Use Scrollable.of() to find if a scrollable widget is present
    print('_findScrollableWidget is triggered');
    try {
      return Scrollable.maybeOf(context) != null;
    } on Exception catch (_) {
      print('_findScrollableWidget error: $_');
      return false;
    }
  }
  
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
            navigatorObservers: [MyNavigatorObserver()],
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
            initialRoute: home ?? Routes.splash,
            getPages: allPages,
            builder: (context, child) {
              return Scaffold(
                body: Screenshot(
                  controller: screenshotController,
                  child: child,
                ),
                floatingActionButton: FloatingActionButton(
                  // onPressed: () {
                  //   pressHandler();
                  // },
                  onPressed: ()=>Timer(Duration(milliseconds: 10), () => pressHandler(child, context)),
                  child: const Icon(Icons.add),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
              );
            },
          );
        },
      ),
    );
  }
}
