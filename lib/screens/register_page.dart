import 'package:flutter/material.dart';
import '../constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Constants.greenColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Create your new account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Constants.greyColor,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/hangover.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  buildTextField('Full Name', Icons.person),
                  const SizedBox(height: 15),
                  buildTextField('Email', Icons.email),
                  const SizedBox(height: 15),
                  buildTextField('Password', Icons.lock, isPassword: true),
                  const SizedBox(height: 15),
                  buildTextField('Confirm Password', Icons.lock, isPassword: true),
                  const SizedBox(height: 45),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Burada kayıt işlemleri yapılabilir
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.greenColor,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
              ),
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 18, color: Constants.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, IconData prefixIcon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.greenColor, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: TextStyle(color: Constants.greenColor), // Eklenen satır
      ),
    );
  }
}
