import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todoly/app/controllers/authenticationModuleController.dart';

import '../widgets/snackbar.dart';
import '../data/models/userModel.dart';

class AuthenticationFunctions {
  //Variables
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //Functions
  Future<UserModel> getUserData() async {
    User currentUser = firebaseAuth.currentUser!;
    DocumentSnapshot userDocumentSnapshot =
        await firebaseFirestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(userDocumentSnapshot);
  }

  Future<String> signUpUser({
    required String userName,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel.name(
        email: email,
        userName: userName,
        userId: userCredential.user!.uid,
        phone: phone,
      );
      await firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
            userModel.toJson(),
          );
      return "Success";
    } on FirebaseAuthException catch (e) {
      //TODO: add error handling
      print(e);
      showCustomSnackBar(
        title: "Error signing up!!",
        message: e.code,
      );
      return "Error";
    } catch (e) {
      //TODO: add error handling
      print(e);
      return "Error";
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final AuthenticationModuleController authenticationModuleController =
          Get.find();
      authenticationModuleController.userModel = await getUserData();
      return "Success";
    } on FirebaseAuthException catch (e) {
      //TODO: add error handling
      print(e);
      return "Error";
    } catch (e) {
      //TODO: add error handling
      print(e);
      return "Error";
    }
  }

  Future<String> deleteUser() async {
    try {
      final AuthenticationModuleController authenticationModuleController =
          Get.find();

      await firebaseFirestore
          .collection('users')
          .doc(authenticationModuleController.userModel.userId)
          .delete();
      await firebaseAuth.currentUser!.delete();
      return "Success";
    } on FirebaseAuthException catch (e) {
      //TODO: add error handling
      print(e);
      return "Error";
    } catch (e) {
      //TODO: add error handling
      print(e);
      return "Error";
    }
  }
}
