import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/widgets/rounded_blue_button.dart';
import 'package:ezy_transport/onboarding/bloc/onboarding_bloc.dart';
import 'package:ezy_transport/onboarding/component/animated_dots.dart';
import 'package:ezy_transport/onboarding/component/onboarding_content.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<Map<String, dynamic>> demoData = [
    {
      "illustration": "images/book.jpg",
      "title": "Book Your Ride Effortlessly",
      "text":
          "Seamlessly book your bus tickets with a few taps on our app, making your travel plans easier and faster.",
    },
    {
      "illustration": "images/embrace.jpg",
      "title": "Embrace the Convenience",
      "text":
          "Dive into the future of travel with our mobile app, where booking your next bus journey is just at your fingertips.",
    },
    {
      "illustration": "images/bus.png",
      "title": "Explore Destinations",
      "text":
          "Discover new places and book your bus journey to a wide range of destinations all from the comfort of your mobile device.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),

            // Onboard Content
            SizedBox(
              height: 500,
              child: PageView.builder(
                itemCount: demoData.length,
                onPageChanged: (value) {
                  context
                      .read<OnboardingBloc>()
                      .add(OnboardingEvent.pageChanged(value));
                },
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    illustration: demoData[index]['illustration'],
                    title: demoData[index]['title'],
                    text: demoData[index]['text'],
                  );
                },
              ),
            ),

            // Animated Dots
            BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child:
                          AnimatedDot(isActive: state.selectedIndex == index),
                    ),
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 10, right: 16),
              child: RoundedBlueButton(
                onPressed: () {
                  context.replaceRoute(
                    const SignInRoute(),
                  );
                },
                label: 'Get Started',
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
