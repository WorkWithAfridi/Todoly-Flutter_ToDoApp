import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/routes/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const TodolyApp());
}

class TodolyApp extends StatelessWidget {
  const TodolyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.deepPurple,
        fontFamily: "Poppins-Regular",
      ),
      title: "Todoly",
      initialRoute: ROUTES.getSplashScreenRoute,
      getPages: ROUTES.routes,
    );
  }
}
