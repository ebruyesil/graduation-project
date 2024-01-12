import 'package:flutter/material.dart';

class Constants {
  // Primary color
  static const Color primaryColor = Color(0xff296e48);
  static const Color blackColor = Colors.black54;
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color greenColor = Color.fromARGB(206, 16, 67, 47);

  // Onboarding texts
  static const String titleOne = "Learn more about plants";
  static const String descriptionOne =
      "Thanks to our app you will take better care of your plants!";
  static const String titleTwo = "Detect the disease!";
  static const String descriptionTwo =
      "You can detect the disease in your plant with the photo you upload!";

  // Label design
  static Widget buildTextField(String labelText, IconData prefixIcon, {bool isPassword = false}) {
  return TextField(
    cursorColor: Constants.greenColor, // İmleç rengi
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Constants.greenColor, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      labelStyle: const TextStyle(color: Constants.greenColor),
    ),
  );
}
   
}
