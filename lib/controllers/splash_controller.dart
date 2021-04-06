import 'package:get/get.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

class SplashController extends GetxController {
  // String _debugLabelString = "";
  // String? _emailAddress;
  // String? _externalUserId;
  // bool _enableConsentButton = false;

  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  bool _requireConsent = true;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed('/home');
    });
    super.onInit();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   Remove this method to stop OneSignal Debugging
    // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    // OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);
    //
    // var settings = {
    //   OSiOSSettings.autoPrompt: false,
    //   OSiOSSettings.promptBeforeOpeningPushUrl: true
    // };

    // OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
    //   this.setState(() {
    //     _debugLabelString =
    //     "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    //   });
    // });
    //
    // OneSignal.shared.init(
    //     "YOUR_ONESIGNAL_APP_ID",
    //     iOSSettings: {
    //       OSiOSSettings.autoPrompt: false,
    //       OSiOSSettings.inAppLaunchUrl: false
    //     }
    // );
    // OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//     await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);
//   }
}
