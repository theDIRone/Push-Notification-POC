
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Handling a background message: ${message.messageId}");
}

Future<void> registerFCMService() async {
  // 1. Initializing application
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase messaging
  final firebaseMessaging = FirebaseMessaging.instance;

  // 3. On iOS, this helps to take the user permissions
  NotificationSettings settings = await firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );
  // 4. Handling notification on background
  //FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // 5. Handling notification on foreground
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');

      if (message.notification != null) {
        print('Message also contained a notification with title: ${message.notification?.title}');
        print('Message also contained a notification with body: ${message.notification?.body}');
      }
    });
  } else {
    print('User declined or has not accepted permission');
  }
}