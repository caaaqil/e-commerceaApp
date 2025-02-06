import 'package:flutter/material.dart';

class SignUpController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers for the input fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController _signupController = TextEditingController();
  final TextEditingController _signinController = TextEditingController();
  final TextEditingController _signoutController = TextEditingController();
  final TextEditingController _Donthaveanaccount = TextEditingController();
  final TextEditingController _SignUp = TextEditingController();

  // Form validation functions
  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Function to handle form submission
  bool submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      // Process the signup (e.g., API call)
      return true;
    }
    return false;
  }
}
