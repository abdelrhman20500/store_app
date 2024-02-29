import 'package:flutter/material.dart';
import 'package:store_app/ui/screen/home/home_screen.dart';
import 'package:store_app/ui/screen/update/update_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        UpdateScreen.routeName :(_)=>UpdateScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

