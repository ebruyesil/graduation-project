import 'package:flutter/material.dart';
import '../constants.dart';
import 'register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/background1.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 150,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/hangover.png',
                      width: 100,
                      height: 100,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Constants.greenColor,
                          ),
                        ),
                        Text(
                          'Login to your account',
                          style: TextStyle(
                            fontSize: 15,
                            color: Constants.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Constants.buildTextField('Email', Icons.email),
                      const SizedBox(height: 15),
                      Constants.buildTextField('Password', Icons.lock,
                          isPassword: true),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                const SizedBox(height: 120),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Login işlemleri
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.greenColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 150),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Constants.whiteColor),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Constants.greyColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Register sayfasına geçiş
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 15,
                          color: Constants.greyColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 5, size.height - 60, size.width / 2, size.height - 30);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) => false;
}
