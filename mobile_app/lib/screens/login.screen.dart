import 'package:flutter/material.dart';
import 'package:mobile_app/common/Logo.widget.dart';
import 'package:mobile_app/screens/inscription.screen.dart';
// import 'package:mobile_app/screens/inscription.screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              const LogoWidget(),
              const SizedBox(height: 20),
              const Text(
                'welcome',
                style: TextStyle(
                  fontSize: 64,
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
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
                  const Text('J\'ai pas de compte'),
                  TextButton(
                    onPressed: () {
                      // Navigator.pop(context);

                      Navigator.pushNamed(context, InscriptionScreen.routeName);
                    },
                    child: const Text('Creer un comptes'),
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
