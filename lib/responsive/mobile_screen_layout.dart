import 'dart:js_interop';

import 'package:fame_nadz/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

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
