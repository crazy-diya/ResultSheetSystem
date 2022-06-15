import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database{
  static final CollectionReference firestoreStudent = FirebaseFirestore.instance.collection("Student");
}

class AppUser{
   static User ?appUser;
}