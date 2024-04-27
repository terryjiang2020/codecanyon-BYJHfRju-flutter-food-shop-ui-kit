import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/helpers/theme.dart';
import 'package:food_market/l10n/l10n.dart';
import 'package:food_market/main.dart';
import 'package:food_market/pages/home/home_page.dart';
import 'package:food_market/providers/locale_provider.dart';
import 'package:food_market/providers/theme_provider.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

// To trigger, run: flutter test test/order_test.dart

// Advanced trigger test: flutter drive --driver test/integration_test.dart --target test/order_test.dart

// On iPhone: use the original resolution
// On iPad: times the resolution by 2
const screenSize = Size(750, 1334);

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('HomePage can scroll (and take screenshots)', (WidgetTester tester) async {

    final ScreenshotController screenshotController = ScreenshotController();

    // tester.view.physicalSize = screenSize;
    
    runApp(
      Screenshot(
        controller: screenshotController,
        child: const MyApp(
          home: Routes.home,
        ),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 7));

    num currentNo = 0;

    // Screenshot the first screen before starting the scrolling
    try {
      await screenshotController
          .capture(delay: const Duration(milliseconds: 10))
          .then((capturedImage) async {
        print('Screenshot captured: $currentNo');
        if (capturedImage != null) {
          print('Screenshot not null, proceed to upload.');
          final base64Value = uint8ListToBase64(capturedImage);
          return Dio().post('https://testserver.pretjob.com/api/designcomp/extension/screenshot/base64', data: {
            'items': [
              {
                'name': 'scrollable_$currentNo',
                'base64': 'data:image/png;base64,$base64Value',
              }
            ],
          },)
          .then((res) {
            print('Screenshot uploaded successfully.');

            return currentNo;
          });
        }
        else {
          print('Screenshot is null, skip.');

          return currentNo;
        }
      }).catchError((onError) {
        print('screenshotController.capture failed, error $onError');
      });
    }
    catch(err) {
      print('Error: $err');
    }

    currentNo++;

    currentNo = await scrollEachItem(tester, screenshotController, currentNo);
    
    print('currentNo: $currentNo');

    await delayed(milliseconds: 5000);
  });
}

Future<num> scrollEachItem(
  WidgetTester tester,
  ScreenshotController screenshotController,
  num currentNo,
) async {
  print('scrollEachItem is triggered');
  // First approach: get a single scrollable widget and drag it
  final scrollableElements = <Widget>[];

  // This will only contain the widgets that have been loaded.
  // By default, this means the widgets that are in the current viewport, due to lazy loading.
  // Which means that this would need to be re-run after each scroll to get the next set of widgets.
  final allWidgets = tester.allWidgets;

  for (final widget in allWidgets) {
    if (widget is ListView ||
        widget is ScrollView ||
        widget is SingleChildScrollView ||
        widget is CustomScrollView ||
        widget is NestedScrollView) {
      scrollableElements.add(widget);
    }
  }

  // If no scrollable element found, abort.
  if (scrollableElements.isEmpty) {
    print('scrollableElements is empty, abort');
    return currentNo;
  }
  else {
    print('scrollableElements is not empty, proceed');

    print('scrollableElements.length: ${scrollableElements.length}');

    // Otherwise, start screenshoting.
    // The following tasks should be done:
    // 1. If no element exists in the current viewport, take screenshot and then scroll down.
    // 2. If any element exists in the current viewport, adjust the viewport to contain the whole element, take screenshot and then scroll down on that element until reach its bottom.
    // 3. Repeat the above steps until the bottom of the page is reached.

    for (final scrollable in scrollableElements) {

      print('Discovered scrollable type: ${scrollable.runtimeType.toString()}');

      // print('find.byWidget(scrollable): ${find.byWidget(scrollable)}');

      final scrollableFinder = find.byWidget(scrollable);

      try {
        tester.firstWidget<Widget>(scrollableFinder);
        print('Element found. Proceed.');

        final screenSize = tester.getSize(scrollableFinder);

        print('Checkpoint 1');

        print('scrollableFinder: $scrollableFinder');

        print('screenSize: $screenSize');

        final scrollableSize = screenSize.height;
        // const scrollableSize = 100.0;

        print('Checkpoint 2');

        // final offset = Offset(0.0, scrollableSize); // (Works) Vertical downwards dragging, moving upwards
        final offset = Offset(0, -scrollableSize); // (Breaks) Vertical upwards dragging, moving downwards
        // final offset = Offset(-scrollableSize, 0.0); // (Works) Horizontal leftwards dragging, moving rightwards
        // final offset = Offset(scrollableSize, 0.0); // (Works) Horizontal rightwards dragging, moving leftwards
        // final offset = Offset(-scrollableSize, 0.0);
        
        print('Checkpoint 3');

        var i = 0;

        // Repeat 5 times
        while (i < 5) {
          print('Dragging: $currentNo');
          // Drag from top to bottom with a slight offset to ensure enough movement
          print('screenSize.center(Offset.zero): ${screenSize.center(Offset.zero)}');

          await tester.pumpAndSettle();

          print('Checkpoint W 0');
          
          /*
          UPDATE: The screen turns blank not because of any element.
          It triggers if the page is scrollable vertically.
          */
          // await tester.timedDragFrom(
          //   screenSize.center(Offset.zero),
          //   offset,
          //   const Duration(seconds: 1)
          // );
          await tester.dragFrom(screenSize.center(Offset.zero), offset);

          print('Checkpoint W 1');

          // await delayed();
          
          print('Checkpoint W 2');

          await tester.pumpAndSettle(); // Wait for UI to rebuild after scroll

          // await delayed();
          
          print('Checkpoint W 3');

          await tester.pumpAndSettle();
          
          expect(find.textContaining('Pizza with Tomato Sauce'), findsAtLeastNWidgets(1));

          print('Dragging $currentNo completed, proceed to screenshot taking.');

          try {
            await screenshotController
                .capture(delay: const Duration(milliseconds: 10))
                .then((capturedImage) async {
              print('Screenshot captured: $currentNo');
              if (capturedImage != null) {
                print('Screenshot not null, proceed to upload.');
                final base64Value = uint8ListToBase64(capturedImage);
                return Dio().post('https://testserver.pretjob.com/api/designcomp/extension/screenshot/base64', data: {
                  'items': [
                    {
                      'name': 'scrollable_$currentNo',
                      'base64': 'data:image/png;base64,$base64Value',
                    }
                  ],
                },)
                .then((res) {
                  print('Screenshot uploaded successfully.');

                  return currentNo;
                });
              }
              else {
                print('Screenshot is null, skip.');

                return currentNo;
              }
            }).catchError((onError) {
              print('screenshotController.capture failed, error $onError');
            });
          }
          catch(err) {
            print('Error: $err');
          }

          print('Checkpoint W 4');

          print('Screenshot completed, proceed to next iteration.');

          i++;

          currentNo++;
          
          print('Checkpoint W 5');
        }
      }
      catch(err) {
        print('Element not found. err: $err');
      }

    }

    return currentNo;
  }
}

String uint8ListToBase64(Uint8List uint8List) {
  // Encode the uint8List to Base64
  String base64String = base64Encode(uint8List);
  return base64String;
}

Future<dynamic> delayed ({int milliseconds = 666}) async {
  /// 适当延时，让操作节奏慢下来
  return Future<dynamic>.delayed(Duration(milliseconds: milliseconds));
}

const Duration scrollDuration = Duration(milliseconds: 300);
