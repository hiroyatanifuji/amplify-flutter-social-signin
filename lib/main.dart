import 'package:flutter/material.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'package:amplify_flutter_social_signin/pages/loading_page.dart';
import 'package:amplify_flutter_social_signin/pages/mypage.dart';
import 'package:amplify_flutter_social_signin/pages/sign_in_page.dart';

import 'amplifyconfiguration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInitialized = false;
  AuthUser? _user;

  @override
  initState() {
    super.initState();
    _initAmplifyFlutter();
  }

  void _initAmplifyFlutter() async {
    AmplifyAuthCognito auth = AmplifyAuthCognito();
    Amplify.addPlugins([auth]);

    try {
      await Amplify.configure(amplifyconfig);

      final user = await Amplify.Auth.getCurrentUser();

      setState(() {
        _user = user;
      });
    } on AmplifyAlreadyConfiguredException catch (e) {
      print(e.message);
    } on SignedOutException catch (e) {
      print(e.message);
    }

    setState(() {
      _isInitialized = true;
    });
  }

  Widget _display() {
    if (!_isInitialized) {
      return const LoadingPage();
    } else {
      return _user != null
          ? MyPage(
              username: _user!.username,
              userId: _user!.userId,
              signOut: _signOut,
            )
          : SignIn(
              signIn: _signIn,
            );
    }
  }

  Future<void> _signOut() async {
    try {
      await Amplify.Auth.signOut();
      setState(() {
        _user = null;
      });
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> _signIn() async {
    try {
      final res = await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
      if (res.isSignedIn) {
        try {
          final user = await Amplify.Auth.getCurrentUser();

          setState(() {
            _user = user;
          });
        } on SignedOutException catch (e) {
          print(e.message);
        }
      }
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amplify Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _display(),
    );
  }
}
