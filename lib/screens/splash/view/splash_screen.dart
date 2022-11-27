import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 70,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Jobspot",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Spacer(),
              Image.asset('assets/images/onb.png'),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline1,
                    children: const [
                      TextSpan(text: 'Find Your\n'),
                      TextSpan(
                        text: 'Dream Job\n',
                        style: TextStyle(
                          color: Colors.orange,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: 'Here'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Explore all the most exciting job roles based on your interest and study major.',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false),
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
