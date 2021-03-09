import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

final kInputDecoration = InputDecoration(
  hintText: 'Enter your password',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
List<String> getMessageFromErrorCode(String errorCode, String cuurentPageId) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return ["Email already used. Go to login page.", LoginScreen.id];
      break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return ["Wrong email/password combination.", LoginScreen.id];
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return ["No user found with this email.", RegistrationScreen.id];
      break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return ["User disabled.", RegistrationScreen.id];
      break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return ["Too many requests to log into this account.", cuurentPageId];
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      return ["Server error, please try again later.", cuurentPageId];
      break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return ["Email address is invalid.", cuurentPageId];
      break;
    default:
      return ["Login failed. Please try again.", cuurentPageId];
      break;
  }
}
