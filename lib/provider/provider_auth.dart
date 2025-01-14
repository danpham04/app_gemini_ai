import 'package:app_gemin_ai/data/source/firebase/firebase_auththentication.dart';
import 'package:flutter/material.dart';

class ProviderAuth extends ChangeNotifier {
  final FirebaseAuththentication firebaseAuththentication = FirebaseAuththentication();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  final TextEditingController emailSignUpController = TextEditingController();
  final TextEditingController passwordSignUpController = TextEditingController();
  final TextEditingController passwordComfirmController = TextEditingController();
  
  bool checkPassLogin = false;
  bool checkPassSignUp = false;
  bool checkPassComfirm = false;
  bool isLoggedIn = false;
  bool isSignUp = false;

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

  Future<bool> login() async {
    String email = emailLoginController.text;
    String password = passwordLoginController.text;

    if (email.trim() == "" || password.trim() == "") {
      print("Email và mật khẩu không được để trống");
      return false;
    }
    try {
      final user = await firebaseAuththentication.loginWithEmail(
        email: emailLoginController.text.trim(),
        password: passwordLoginController.text.trim(),
      );
      if (user != null) {
        print("Đăng nhập thành công");
        isLoggedIn = true;
        return true;
      }
    } catch (e) {
      print('Đăng nhập thất bại');
    }
    return false;
  }

  Future<bool> signUp() async {
    String email = emailSignUpController.text;
    String password = passwordSignUpController.text;
    String passwordComfirm = passwordComfirmController.text;
    if (email.trim() == "" || password.trim() == "" || passwordComfirm.trim() == "") {
      print('Email và mật khẩu không được để trống');
      return false;
    }
    if (password.trim() != passwordComfirm.trim()) {
    
      print("Mật Khẩu không khớp");
      return false;
    }

    try {
      await firebaseAuththentication.signUpWithEmail(email: email, password: password);
      isSignUp = true;
    } catch (e) {
      rethrow;
    }
    return false;
  }

  void logout() async {
    await firebaseAuththentication.signOut();
    isLoggedIn = false;
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
