import 'package:amplify_flutter_social_signin/widgets/button.dart';
import 'package:amplify_flutter_social_signin/widgets/gaps.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    required this.signIn,
  });

  final Future<void> Function() signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('サインイン')),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gaps(),
            Button(
              label: 'サインインする',
              onPressed: signIn,
            ),
            const Gaps(),
          ],
        ),
      ),
    );
  }
}
