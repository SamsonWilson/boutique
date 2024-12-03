import 'package:flutter/material.dart';
import 'package:mobile_app/common/Logo.widget.dart';
import 'package:mobile_app/screens/login.screen.dart';
import 'package:mobile_app/services/auth.service.dart';

class InscriptionScreen extends StatefulWidget {
  static const routeName = 'inscription';
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  final _formkey = GlobalKey<FormState>();

  final _EmailController = TextEditingController();
  final _NameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: SafeArea(
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                const LogoWidget(),
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
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer votre address mail';
                      }
                      return null;
                    },
                    controller: _EmailController,
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
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer votre Nom';
                      }
                      return null;
                    },
                    controller: _NameController,
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
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mot de passe est incorrect';
                      }
                      return null;
                    },
                    controller: _passwordController,
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
                  child: TextFormField(
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'la confirmation de mode passe est incorrecte';
                      }
                      return null;
                    },
                    controller: _confpasswordController,
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
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        authService
                            .inscriptionScreen(
                                name: _NameController.text,
                                email: _EmailController.text,
                                password: _passwordController.text,
                                confPassword: _confpasswordController.text)
                            .then((value) {
                          if (value) {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('erreur de connexion'),
                            ),
                          );
                        });
                      }
                    },
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
      ),
    );
  }
}
