import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fame_nadz/resources/storage_methods.dart';
import 'package:fame_nadz/models/user.dart' as model;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthMethods{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot = await _firebaseFirestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

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

      model.User user = model.User(
        username: username,
        uid: credential.user!.uid,
        photoUrl: photoUrl,
        email: email,
        bio: bio,
        followers: [],
        following: [],
      );
      await _firebaseFirestore
          .collection("users")
          .doc(credential.user!.uid)
          .set(user.toJson());


     res="success";

    }else {
      res = "Please enter all the fields";
    }
  }catch(err){
    res = err.toString();
  }
  return res;
}

  Future<String> loginUser({
    required String email,
    required String password,
  })async{
    String res =  "Some error occured";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
          await _auth.signInWithEmailAndPassword(email: email, password: password);
           res = "Success";
      }
      else {
        res = "enter valid email and password";
      }
    }
    catch(err){
      res = err.toString();

    }
    return res;
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
}


