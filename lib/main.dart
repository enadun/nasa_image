import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './state/app_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Provider.of<AppData>(context).isLogin
            ? const HomeScreen()
            : const LoginScreen(),
      ),
    );
  }
}
