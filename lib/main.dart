import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:testapp/notification_service.dart';
import 'package:testapp/push_notification.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
 // await registerFCMService();
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseMessaging _firebaseMessaging;

  // Future<void> registerNotification() async {
  //   // // 1. Initialize the Firebase app
  //   // await Firebase.initializeApp();
  //
  //   // 2. Instantiate Firebase Messaging
  //   _firebaseMessaging = FirebaseMessaging.instance;
  //
  //   // 3. On iOS, this helps to take the user permissions
  //   NotificationSettings settings = await _firebaseMessaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );
  //
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print('User granted permission');
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       print('Got a message whilst in the foreground!');
  //
  //       if (message.notification != null) {
  //         print('Message also contained a notification with title: ${message.notification?.title}');
  //         print('Message also contained a notification with body: ${message.notification?.body}');
  //       }
  //     });
  //   } else {
  //     print('User declined or has not accepted permission');
  //   }
  // }

  @override
  void initState() {
    //_firebaseMessaging = FirebaseMessaging.instance;
   // registerNotification();
    NotificationServices().firebaseInit(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () async {
              FirebaseMessaging.instance.getToken().then((value) => print(value));

            }, child: Text('Listen Notification'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
