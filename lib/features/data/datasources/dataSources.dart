import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database{
  static final CollectionReference firestoreStudent = FirebaseFirestore.instance.collection("Student");
  static final CollectionReference firestoreAdmin = FirebaseFirestore.instance.collection("Admin");
  static final CollectionReference firestoreUser = FirebaseFirestore.instance.collection("Users");
}

class AppUser{
   static User ?appUser;
}