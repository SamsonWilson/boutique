import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/screens/inscription.screen.dart';
import 'package:mobile_app/screens/login.screen.dart';

class Onboarding extends StatefulWidget {
  static const routeName = 'onboarding';

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;
  int _currentPage = 0;
  final _pagesContents = [
    (
      ' A shop in pbdvbfvbvn v sv nsdv n sdvn snv ',
      'hjkbchbehkfbkejbfbdfbfdbkjdfj',
      "app_logo.png"
    ),
    (
      ' A shop in pb ',
      'hjkbchbehkfbkejbfbdfbfdbkjdfj',
      "profile_page_background.png"
    ),
    (
      ' A shop in pbdvbfvbvn v sv nsdv n sdvn snv ',
      'hjkbchbehkfbkejbfbdfbfdbkjdfj',
      "sans.jpeg"
    ),
  ];

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: PageView(
                  controller: _pageController,
                  children: List.generate(_pagesContents.length, (index) {
                    var (title, description, imagecolore) =
                        _pagesContents[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 500,
                            width: double.infinity,
                            child: Image.asset(
                              "assets/images/$imagecolore",
                              fit: BoxFit.contain,
                            )),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.deepPurple),
                        ),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.black),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            Pageindication(
              currentPage: _currentPage,
              totalPages: _pagesContents.length,
            ),
            const BoutonAuthentification(),
          ],
        ),
      ),
    );
  }
}

/** bouton de l'authentification */
class BoutonAuthentification extends StatelessWidget {
  const BoutonAuthentification({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // color: Colors.white,
        height: 150,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: const Text("Connexion", style: TextStyle(fontSize: 15)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40),
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepOrange,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, InscriptionScreen.routeName);
              },
              child: const Text("Inscription", style: TextStyle(fontSize: 15)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40),
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),

              /*Child: const Text("Inscription", style: TextStyle(fontSize: 20)),*/
            )
          ],
        ));
  }
}

/** indication de la page */
class Pageindication extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  const Pageindication(
      {super.key, required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < totalPages; i++)
            Container(
              width: i == currentPage ? 30 : 10,
              height: 10,
              decoration: BoxDecoration(
                  color: i == currentPage ? Colors.deepOrange : Colors.grey,
                  borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.all(5),
            ),
        ],
      ),
    );
  }
}
