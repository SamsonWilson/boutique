// import 'dart:convert';

// import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';

// class authService {
//   // static const _api = 'http://localhost:8000/accounts/login/';

//   static Future<bool> LoginScreen(String email, String password) async {
//     var response = await http.post(
//         Uri.parse('http://10.0.2.2:8000/accounts/login/'),
//         body: {'email': email, 'password': password},
//         headers: {'Accept': 'application/json'});

//     if (response.statusCode != 200) {
//       return Future.value(false);
//     }

//     var data = jsonDecode(response.body);
//     print(data['user']);
//     print(data['access_token']);
//     //final SharedPreferences preferences = await SharedPreferences.getInstance();

//     //preferences.setString('access_token', email);
//     return Future.value(true);
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

class authService {
  static const String _apiUrl = 'http://10.0.2.2:8000';

  static Future<bool> LoginScreen(String email, String password) async {
    // Première requête pour obtenir le jeton CSRF
    var csrfResponse = await http.get(Uri.parse('$_apiUrl/accounts/login/'));

    String? csrfToken;
    if (csrfResponse.headers['set-cookie'] != null) {
      var cookies = csrfResponse.headers['set-cookie']!.split(';');
      for (var cookie in cookies) {
        if (cookie.contains('csrftoken')) {
          csrfToken = cookie.split('=')[1];
          break;
        }
      }
    }

    if (csrfToken == null) {
      print('Impossible de récupérer le jeton CSRF.');
      return Future.value(false);
    }

    // Requête POST avec les champs attendus par Django Allauth
    var body = {
      'login': email,
      'password': password
    }; // Utilisation de 'login' au lieu de 'email'
    var response = await http.post(
      Uri.parse('$_apiUrl/accounts/login/'),
      body: body,
      headers: {
        'Accept': 'application/json',
        'X-CSRFToken': csrfToken,
        'Cookie': 'csrftoken=$csrfToken',
      },
    );

    print('Request body: $body');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      print('Erreur lors de la connexion: ${response.statusCode}');
      return Future.value(false);
    }

    var data = jsonDecode(response.body);
    print(data['user']);
    print(data['access_token']);
    return Future.value(true);
  }

  // c'est pour l'inscription

  static Future<bool> inscriptionScreen(
      {required String email,
      required String name,
      required String password,
      required String confPassword}) async {
    // Première requête pour obtenir le jeton CSRF
    var csrfResponse = await http.get(Uri.parse('$_apiUrl/accounts/signup/'));

    String? csrfToken;
    if (csrfResponse.headers['set-cookie'] != null) {
      var cookies = csrfResponse.headers['set-cookie']!.split(';');
      for (var cookie in cookies) {
        if (cookie.contains('csrftoken')) {
          csrfToken = cookie.split('=')[1];
          break;
        }
      }
    }

    if (csrfToken == null) {
      print('Impossible de récupérer le jeton CSRF.');
      return Future.value(false);
    }

    // Requête POST avec les champs attendus par Django Allauth
    var body = {
      'email': email, // Django Allauth attend un champ 'email'
      'username': name, // Django Allauth peut attendre un champ 'username'
      'password1':
          password, // Django Allauth attend 'password1' pour le mot de passe
      'password2':
          confPassword, // Django Allauth attend 'password2' pour la confirmation
    };

    var response = await http.post(
      Uri.parse('$_apiUrl/accounts/signup/'),
      body: body,
      headers: {
        'Accept': 'application/json',
        'X-CSRFToken': csrfToken,
        'Cookie': 'csrftoken=$csrfToken',
      },
    );

    print('Request body: $body');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      print('Erreur lors de la connexion: ${response.statusCode}');
      return Future.value(false);
    }

    var data = jsonDecode(response.body);
    print(data['user']);
    print(data['access_token']);
    return Future.value(true);
  }

  
}
