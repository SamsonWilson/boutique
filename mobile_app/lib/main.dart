import 'package:flutter/material.dart';
import 'package:mobile_app/screens/inscription.screen.dart';
import 'package:mobile_app/screens/login.screen.dart';
import 'package:mobile_app/screens/onboarding.dart';
import 'package:mobile_app/screens/slash_screen.dart';

void main() {
  runApp(const MyApp());
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
      routes: {
        SlashScreen.routeName: (context) => const SlashScreen(),
        Onboarding.routeName: (context) => const Onboarding(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        InscriptionScreen.routeName: (context) => const InscriptionScreen(),
      },
      initialRoute: SlashScreen.routeName,
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
     
      body: Center(
       
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
           
          ],
        ),
      ),
    );
  }
}*/

