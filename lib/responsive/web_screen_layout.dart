import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
   // User user = Provider.of<UserProvider>(context).getUser;
    return const Scaffold(
      body: Center(
        child: Text("user.username"),
      ),
    );
  }
}
