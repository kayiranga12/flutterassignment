


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      home: MyHomePage(title: 'Home Page'),
    );
  }
}


Future<void> initFirebase() async {
  await Firebase.initializeApp(
    name: 'quizzle-demo',
    options: FirebaseOptions(
      apiKey: 'your_api_key',
      authDomain: 'your_auth_domain',
      projectId: 'your_project_id',
      storageBucket: 'your_storage_bucket',
      messagingSenderId: 'your_messaging_sender_id',
      appId: 'your_app_id',
    ),
  );
}

