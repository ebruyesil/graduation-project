import 'package:flutter/material.dart';
import 'package:flutter_plantapplication/constants.dart';
import 'package:flutter_plantapplication/screens/first_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Constants.whiteColor,
        leading: currentIndex > 0
      ? IconButton(
          onPressed: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
          },
          icon: const Icon(Icons.arrow_back),
          color: Constants.greenColor,
        )
      : null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) =>  FirstPage()));
              }, 
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Constants.greenColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: const [
              createPage(
                image: 'assets/images/page1.jpeg',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              createPage(
                image: 'assets/images/page2.jpeg',
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.greenColor,
              ),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (currentIndex < 1) {
                        currentIndex++;
                        if (currentIndex < 2) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      } else {
                       
                        Navigator.pushReplacement(context,
                           MaterialPageRoute(builder: (_) => FirstPage()));
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Constants.whiteColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  //Extra Widgets
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.greenColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 2; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

// ignore: camel_case_types
class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const createPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Constants.greenColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Constants.greyColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}