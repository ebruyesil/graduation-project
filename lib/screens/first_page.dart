import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    
    // wait 1 second then go to WelcomePage
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
         // background image
          Image.asset(
            'assets/images/background.jpg', 
            fit: BoxFit.cover,
          ),
          
          const Positioned(
            top: 270,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'botanic buddy',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),  
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
