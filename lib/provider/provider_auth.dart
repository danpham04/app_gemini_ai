import 'package:flutter/material.dart';

class ProviderAuth extends ChangeNotifier {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  final TextEditingController emailSignUpController = TextEditingController();
  final TextEditingController passwordSignUpController = TextEditingController();
  final TextEditingController passwordComfirmController = TextEditingController();
  bool checkPassLogin = false;
  bool checkPassSignUp = false;
  bool checkPassComfirm = false;

  void displayPass() {
    checkPassLogin = !checkPassLogin;
    notifyListeners();
  }

  void displayPassSignUp() {
    checkPassSignUp = !checkPassSignUp;
    notifyListeners();
  }

  void displayPassComfirm() {
    checkPassComfirm = !checkPassComfirm;
    notifyListeners();
  }

  @override
  void dispose() {
    emailLoginController.dispose();
    passwordLoginController.dispose();
    emailSignUpController.dispose();
    passwordSignUpController.dispose();
    passwordComfirmController.dispose();
    super.dispose();
  }
}
