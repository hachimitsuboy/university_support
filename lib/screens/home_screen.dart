import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.95, keepPage: true);
  final messageList = [
    "ようこそ！ユニサポへ",
    "大学の実験・アンケートに参加し、報酬をもらいましょう",
    "また、自身の実験・アンケートを募集することもユニサポでは可能です",
    "手軽に実験・アンケートの募集・参加ができるユニサポを始めよう！",
  ];
  final lottieList = [
    "assets/animation/welcome.json",
    "assets/animation/reward.json",
    "assets/animation/recruiting.json",
    "assets/animation/start.json",
  ];

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        4,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.lightBlueAccent,
              ),
              margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        messageList[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Lottie.asset(lottieList[index]),
                  ],
                ),
              ),
            ));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 550,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              SizedBox(height: 25),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  type: WormType.thin,
                  // strokeWidth: 5,
                ),
              ),
              const SizedBox(height: 32.0),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    print("押されたよ");
                  },
                  child: const Text(
                    "はじめる",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
