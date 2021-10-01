import 'package:amplify_flutter_social_signin/widgets/button.dart';
import 'package:amplify_flutter_social_signin/widgets/gaps.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({
    required this.username,
    required this.userId,
    required this.signOut,
  });

  final String username;
  final String userId;
  final Future<void> Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gaps(),
            Text('username: $username'),
            const Gaps(size: 16),
            Text('userId: $userId'),
            const Gaps(),
            Button(
              label: 'サインアウト',
              onPressed: signOut,
            ),
            const Gaps(),
          ],
        ),
      ),
    );
  }
}
