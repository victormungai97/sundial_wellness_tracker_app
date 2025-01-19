import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sundial_wellness_tracker/bloc/blocs/blocs.dart';
import 'package:sundial_wellness_tracker/bloc/cubits/cubits.dart';
import 'package:sundial_wellness_tracker/constants/enums.dart';
import 'package:sundial_wellness_tracker/models/journal_entry_model/journal_entry_model.dart';
import 'package:sundial_wellness_tracker/navigation/navigation.dart';
import 'package:sundial_wellness_tracker/views/journal/components/mood_selector.dart';
import 'package:sundial_wellness_tracker/widgets/blockquote.dart';
import 'package:sundial_wellness_tracker/widgets/primary_pull_refresh.dart';
import 'package:sundial_wellness_tracker/widgets/stateful_wrapper.dart';
import 'package:uuid/uuid.dart';

part 'body.dart';
part 'form.dart';
part 'frame.dart';
part 'top.dart';

Future<void> _load(BuildContext context) async {
  await Future.wait([
    context.read<MotivationCubit>().retrieveRandom(),
    context.read<HealthMetricsCubit>().calculateSteps(),
  ]);
}

void _reset(BuildContext context) {
  context.read<JournalEntryCubit>().reset();
  context.read<MotivationCubit>().reset();
  context.read<HealthMetricsCubit>().reset();
}

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async {
        context.read<JournalEntryCubit>().updatedId((const Uuid()).v4());
        await _load(context);
      },
      onDispose: () => _reset(context),
      child: const _Frame(key: ValueKey('JournalFrame')),
    );
  }
}
