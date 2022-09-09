import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

bool isConnected;

/*
 * gravity: TOP || BOTTOM || CENTER || TOP_LEFT || TOP_RIGHT || BOTTOM_LEFT || BOTTOM_RIGHT || CENTER_LEFT || CENTER_RIGHT || SNACKBAR
 
 * toastLength: LENGTH_SHORT || LENGTH_LONG
 */
void showToast(String message, String length, String gravity, backgroundColor,
    textColor, fontSize) {
  Fluttertoast.showToast(
      msg: message,
      toastLength:
          length == 'LENGTH_SHORT' ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: gravity == 'TOP'
          ? ToastGravity.TOP
          : gravity == 'BOTTOM'
              ? ToastGravity.BOTTOM
              : gravity == 'CENTER'
                  ? ToastGravity.CENTER
                  : gravity == 'TOP_LEFT'
                      ? ToastGravity.TOP_LEFT
                      : gravity == 'TOP_RIGHT'
                          ? ToastGravity.TOP_RIGHT
                          : gravity == 'BOTTOM_LEFT'
                              ? ToastGravity.BOTTOM_LEFT
                              : gravity == 'BOTTOM_RIGHT'
                                  ? ToastGravity.BOTTOM_RIGHT
                                  : gravity == 'CENTER_LEFT'
                                      ? ToastGravity.CENTER_LEFT
                                      : gravity == 'CENTER_RIGHT'
                                          ? ToastGravity.CENTER_RIGHT
                                          : ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize);
}

nameValidation(String fieldName) {
  return MultiValidator([
    RequiredValidator(errorText: "$fieldName is required!"),
    MinLengthValidator(3,
        errorText: "$fieldName should be atleast 3 characters!")
  ]);
}

emailValidation(String fieldName) {
  return MultiValidator([
    RequiredValidator(errorText: "$fieldName is required!"),
    EmailValidator(errorText: "Enter a valid $fieldName!")
  ]);
}

mobileValidation(String fieldName) {
  return MultiValidator([
    RequiredValidator(errorText: "$fieldName is required!"),
    MinLengthValidator(10, errorText: "Enter valid $fieldName!")
  ]);
}

onlyRequireValidation(String fieldName) {
  return RequiredValidator(errorText: "$fieldName is required!");
}

passwordValidation(String fieldName) {
  MultiValidator([
    RequiredValidator(errorText: "$fieldName is required!"),
    MinLengthValidator(6,
        errorText: "$fieldName should be atleast 6 characters!"),
    MaxLengthValidator(20,
        errorText: "$fieldName should not be greater than 20 characters!")
  ]);
}

receivedFirebaseNotofications() {
  FirebaseMessaging.onMessage.listen((event) {
    RemoteNotification notification = event.notification;
    print(notification.toString());
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    RemoteNotification notification = event.notification;
    print(notification.toString());
  });
}
