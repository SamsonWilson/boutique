/*import 'package:android_ios_app/core/routes/app_routes.dart';
import 'package:android_ios_app/core/routes/on_generate_route.dart';*/
<<<<<<< HEAD
import 'package:android_ios_app/screens/Produit.detail.dart';
=======
>>>>>>> 4cd1d19baf82a1b03fa244eb0d4b1e3913bdca20
import 'package:android_ios_app/screens/produit.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Recherche');
          },
          icon: const Icon(Icons.search),
        ),*/
        title: const Text("Accueil"),
        backgroundColor: Color.fromARGB(255, 136, 130, 151),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(103, 67, 82, 82),
                Color.fromARGB(255, 183, 66, 58),
              ]),
        ),
        child: Center(
          child: Column(
            children: [
              /*Text(
                "HOME",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),*/
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Recherche");
                },
                child: const Text(
                  "Recherche",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          /*child: Text(
            'accueil',
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepOrangeAccent,
            ),
          ),*/
        ),
      ),
    );
  }
}
*/
/*class RecherchePage extends StatelessWidget {
  const RecherchePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Recherche');
          },
          icon: const Icon(Icons.search),
        ),*/
        title: const Text("Profil"),
        backgroundColor: Color.fromARGB(255, 136, 130, 151),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(103, 67, 82, 82),
                Color.fromARGB(255, 183, 66, 58),
              ]),
        ),
        child: Center(
          child: Column(
            children: [
              /*Text(
                "HOME",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),*/
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Profil");
                },
                child: const Text(
                  "Profil",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          /*child: Text(
            'accueil',
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepOrangeAccent,
            ),
          ),*/
        ),
      ),
    );
  }
}
*/
/*class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Text("Profile", style: TextStyle(fontSize: 30, color: Colors.white));
  }
}*/

class _MyHomePageState extends State<MyHomePage> {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ma page API',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        ProduitScreen.routeName: (context) => const ProduitScreen(),
<<<<<<< HEAD
        ProduitDTScreen.routeName:(context)=> const ProduitDTScreen(),
=======
>>>>>>> 4cd1d19baf82a1b03fa244eb0d4b1e3913bdca20
      },
      initialRoute: ProduitScreen.routeName,
    );
    /* var _currentIndex = 0;
  final _pages = [
    const AccueilPage(),
    const RecherchePage(),
    const ProfilPage(), 
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }
*/
    /* return MaterialApp(
      title: 'navigation',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        '/home': (context) => const AccueilPage(),
        '/Recherche': (context) => const RecherchePage(),
        '/Profil': (context) => const ProfilPage(),
      },
      /*elevation: 0,*/
      home: Scaffold(
        /* bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            backgroundColor: Colors.deepPurpleAccent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(.5),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accuiel',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Recherche',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),*/
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(103, 67, 82, 82),
                  Color.fromARGB(255, 183, 66, 58),
                ]),
          ),
          child: Center(
            child: Builder(
              builder: (context) {
                return MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    "home",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );*/
  }
}
