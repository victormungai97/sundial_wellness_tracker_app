import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sundial_wellness_tracker/bloc/cubits/journal_entry/journal_entry_cubit.dart';
import 'package:sundial_wellness_tracker/constants/enums.dart';
import 'package:sundial_wellness_tracker/extensions/extensions.dart';

/// Widget to enable a user to choose a preferred mood
class MoodSelector extends StatelessWidget {
  const MoodSelector({required this.mood, super.key});

  final Mood mood;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<JournalEntryCubit>();

    return GestureDetector(
      onTap: () => cubit.updatedMood(mood),
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 2.8, 16, 8),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        height: 130,
        decoration: cubit.state.mood == mood
            ? BoxDecoration(
                border: Border.all(
                  color: switch (mood) {
                    Mood.fantastic => Colors.orange,
                    Mood.great => Colors.green,
                    Mood.happy => Colors.yellow,
                    Mood.relieved => Colors.lime,
                    Mood.okay => Colors.grey,
                    Mood.sad => Colors.blue,
                    Mood.anxious => Colors.purple,
                    Mood.angry => Colors.red,
                    Mood.depressed => Colors.black,
                  },
                ),
                borderRadius: BorderRadius.circular(4),
              )
            : null,
        child: Column(
          children: [
            AnimatedEmoji(
              switch (mood) {
                Mood.fantastic => AnimatedEmojis.starStruck,
                Mood.great => AnimatedEmojis.partyingFace,
                Mood.happy => AnimatedEmojis.smile,
                Mood.relieved => AnimatedEmojis.relieved,
                Mood.okay => AnimatedEmojis.diagonalMouth,
                Mood.sad => AnimatedEmojis.sad,
                Mood.anxious => AnimatedEmojis.anxiousWithSweat,
                Mood.angry => AnimatedEmojis.angry,
                Mood.depressed => AnimatedEmojis.distraught,
              },
              size: 80,
            ),
            Text(
              mood.name.capitalize(),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
