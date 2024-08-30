import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mobile_app/screens/onboarding.dart';

class SlashScreen extends StatefulWidget {
  static const routeName = 'slach';
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    super.initState();

// authService.check().then.((value){
//       if(value){
//         Navigator.pushReplacementName(context, HomeScreen.routeName);
//       }else{
//         Navigator.pushReplacementNamed(context, Onboarding.routeName);
//       }
//     });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Onboarding.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: const Center(
          child: LoadingIndicator(
            indicatorType: Indicator.ballClipRotatePulse,
            colors: const [Colors.deepOrange],
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
