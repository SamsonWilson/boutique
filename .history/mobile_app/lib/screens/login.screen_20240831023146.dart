import 'package:flutter/material.dart';
import 'package:mobile_app/common/Logo.widget.dart';
import 'package:mobile_app/screens/homePage.screen.dart';
import 'package:mobile_app/screens/inscription.screen.dart';
import 'package:flutter/src/material/text_form_field.dart';
import 'package:mobile_app/services/auth.service.dart';
// import 'package:mobile_app/screens/inscription.screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  @override
  void initState() {
    _emailContoller.text = 'fifi';
    _passwordContoller.text = 'Ff@12345678';
    // kpat@0987
    // _emailContoller.text = 'fifi';
    // _passwordContoller.text = 'Ff@12345678';
    super.initState();
  }

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
                  controller: _emailContoller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'svp entrer votre Email';
                    }
                    return null;
                  },
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
                  controller: _passwordContoller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'svp entre votre Email';
                    }
                    return null;
                  },
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
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      authService.LoginScreen(
                        _emailContoller.text,
                        _passwordContoller.text,
                      ).then((value) {
                        if (value) {
                          Navigator.pushReplacementNamed(
                              context, MainScreen.routeName);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('invalid credentials'),
                            ),
                          );
                        }
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
