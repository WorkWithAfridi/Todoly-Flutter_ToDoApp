import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todoly/app/controllers/authenticationModuleController.dart';
import 'package:todoly/app/data/models/taskModel.dart';
import 'package:uuid/uuid.dart';

class FirebaseFunctions {
  //Variables
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final AuthenticationModuleController authenticationModuleController =
      Get.find();

  //Adding a task to backend
  Future<String> addATask(
      {required String title,
      required String description,
      required DateTime eventDate,
      required String status}) async {
    try {
      String taskId = Uuid().v1();
      TaskModel taskModel = TaskModel.name(
        id: taskId,
        title: title,
        description: description,
        eventDate: eventDate,
        status: status,
      );
      firebaseFirestore
          .collection('users')
          .doc(authenticationModuleController.userModel.userId)
          .collection('tasks')
          .doc(taskId)
          .set(taskModel.toJson());
      return "Success";
    } on FirebaseException catch (e) {
      //TODO: add error handling
      print(e);
      return "Error";
    } catch (e) {
      //TODO: add error handling
      print(e);
      return "Error";
    }
  }

  //Change task status
  changeTaskStatus(String status, String taskId) {
    firebaseFirestore
        .collection('users')
        .doc(authenticationModuleController.userModel.userId)
        .collection('tasks')
        .doc(taskId)
        .update({'status': status});
  }

  //Function to delete todo task from firebase
  void deleteTodoTask(String taskId) {
    firebaseFirestore
        .collection('users')
        .doc(authenticationModuleController.userModel.userId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }
}
