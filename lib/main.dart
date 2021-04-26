import 'package:brave_girls/controllers/bindings/authBinding.dart';
import 'package:brave_girls/ui/splash_page.dart';
import 'package:brave_girls/utils/fimber_helper.dart';
import 'package:brave_girls/utils/pages.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var defaultFormat = AssertFormattedTree();

  Fimber.plantTree(defaultFormat);
  await Firebase.initializeApp();

  initializeDateFormatting("ko").then((_) => runApp(
        Phoenix(
          child: BraveGirlsApp(),
        ),
      ));
}

class BraveGirlsApp extends StatefulWidget {
  @override
  _BraveGirlsAppState createState() => _BraveGirlsAppState();
}

class _BraveGirlsAppState extends State<BraveGirlsApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("329e1815-98ad-49f8-8c80-977ef14ede14");

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent notification) {
      notification.complete(notification.notification);
      // will be called whenever a notification is received
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      // will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // will be called whenever the subscription changes
      //(ie. user gets registered with OneSignal and gets a user ID)
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges emailChanges) {
      // will be called whenever then user's email subscription changes
      // (ie. OneSignal.setEmail(email) is called and the user gets registered
    });
    OneSignal.shared.promptUserForPushNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: '/splash',
      getPages: AppPages.pages,
      initialBinding: AuthBinding(),
      home: SplashPage(),
      theme: ThemeData(fontFamily: 'NotoSansKR Regular'),
    );
  }
}
