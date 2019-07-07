import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudMethods{
  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser() != null){
      return true;
    }
    else{
      return false;
    }
  }
  Future<void> addData(carData) async{
    if(isLoggedIn()){
      Firestore.instance.collection('testcrud').add(carData).catchError((e){
        print(e);
      });
    }
    else
    {
      print("you need to logged In");
    }
  }
}