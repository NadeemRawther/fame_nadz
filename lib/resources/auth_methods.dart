import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fame_nadz/resources/storage_methods.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  //signup user
Future<String> signUpUser({

    required String email,
    required String password,
  required String username,
  required String bio,
  required Uint8List file,
})async{
  String res ="Some errror ";
  try{
    if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty ||bio.isNotEmpty||file!= null){
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);
     await _firebaseFirestore.collection('users').doc(credential.user!.uid).set({
        'username':username,
        'uid':credential.user!.uid,
        'email':email,
        'bio':bio,
        'follower':[],
        'following':[],
        'photoUrl':photoUrl
      });


     res="success";

    }
  }catch(err){
    res = err.toString();
  }
  return res;
}



}


