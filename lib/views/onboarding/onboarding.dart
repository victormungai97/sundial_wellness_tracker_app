import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:sundial_wellness_tracker/bloc/cubits/motivation/motivation_cubit.dart';
import 'package:sundial_wellness_tracker/bloc/cubits/onboarding/onboarding_cubit.dart';
import 'package:sundial_wellness_tracker/navigation/navigation.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({super.key});

  static const _pageColor = Color(0xFFF3E5F5);

  static const _pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 28,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
    ),
    bodyTextStyle: TextStyle(fontFamily: 'Nunito', fontSize: 19),
    bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    pageColor: _pageColor,
    imagePadding: EdgeInsets.only(top: 50),
    titlePadding: EdgeInsets.zero,
    contentMargin: EdgeInsets.only(top: 50),
    imageAlignment: Alignment.bottomLeft,
    bodyFlex: 2,
    imageFlex: 3,
    safeArea: 100,
    pageMargin: EdgeInsets.only(top: 6),
  );

  @override
  Widget build(BuildContext context) {
    final motivationCubit = context.watch<MotivationCubit>();

    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Journal',
            body: 'Note down all your thoughts and emotions',
            image: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(
                child: Lottie.asset(
                  'assets/animations/journaling_animation.json',
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            decoration: _pageDecoration,
          ),
          PageViewModel(
            title: 'Dashboard',
            body: 'View your mood and health metrics',
            image: Lottie.asset(
              'assets/animations/dashboard_animation.json',
              height: double.infinity,
              width: double.infinity,
            ),
            decoration: _pageDecoration,
          ),
          PageViewModel(
            titleWidget: BlocBuilder<MotivationCubit, MotivationState>(
              builder: (context, state) {
                final text = state is MotivationRandomRetrievalState
                    ? state.whenOrNull(
                        success: (motivation) => motivation.message,
                      )
                    : null;
                return Text(
                  text != null ? '"$text"' : "Let's get you started",
                  style: text == null
                      ? _pageDecoration.titleTextStyle
                      : _pageDecoration.bodyTextStyle,
                  textAlign: TextAlign.center,
                );
              },
            ),
            bodyWidget: BlocBuilder<MotivationCubit, MotivationState>(
              builder: (context, state) {
                final text = state is MotivationRandomRetrievalState
                    ? state.whenOrNull(
                        success: (motivation) => motivation.author,
                      )
                    : null;
                final messageAvailable = text == null;
                return Column(
                  children: [
                    Text(
                      text ?? "You're doing great!\nKeep it up!",
                      style: !messageAvailable
                          ? _pageDecoration.titleTextStyle
                          : _pageDecoration.bodyTextStyle,
                      textAlign:
                          messageAvailable ? TextAlign.center : TextAlign.end,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<OnboardingCubit>().onBoardingDone();
                          context.go(Routes.journal);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.purple,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          textStyle: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                          ),
                        ),
                        child: const Text('Start Journaling'),
                      ),
                    ),
                  ],
                );
              },
            ),
            image: Lottie.asset(
              'assets/animations/get_started_animation.json',
              height: double.infinity,
              width: double.infinity,
            ),
            decoration: _pageDecoration,
          ),
        ],
        onChange: (value) async {
          if (value == 2) {
            await motivationCubit.retrieveRandom();
          } else {
            motivationCubit.reset();
          }
        },
        showDoneButton: false,
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        next: const Icon(Icons.arrow_forward, color: Colors.purple, size: 24),
      ),
    );
  }
}
