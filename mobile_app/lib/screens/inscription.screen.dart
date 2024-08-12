import 'package:flutter/material.dart';
import 'package:mobile_app/screens/login.screen.dart';

class InscriptionScreen extends StatefulWidget {
  static const routeName = 'inscription';
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: SafeArea(
        child: SafeArea(
          child: ListView(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.amberAccent, shape: BoxShape.circle,
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/app_logo.png'),
                    // ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Créer un Compte ',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'SVP Entrer les identifiant et contituer',
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('Nom'),
                    hintText: 'Nom',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    hintText: 'Entrer le Mot de Passe',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('Confimation de Mot de Passe '),
                    hintText: 'Entrer le Mot de Passe',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 57),
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white),
                  child: const Text(
                    'Connexion',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('J\'ai un compte'),
                  TextButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: const Text('Connexion'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
