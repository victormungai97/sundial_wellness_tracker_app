import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sundial_wellness_tracker/bloc/cubits/cubits.dart';
import 'package:sundial_wellness_tracker/constants/enums.dart';
import 'package:sundial_wellness_tracker/models/journal_entry_model/journal_entry_model.dart';
import 'package:sundial_wellness_tracker/navigation/navigation.dart';
import 'package:sundial_wellness_tracker/services/storage/storage.dart'
    show JournalEntryService;
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

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final journalEntryCubit = context.watch<JournalEntryCubit>();
    return StatefulWrapper(
      onInit: () async {
        /*final entryService = context.read<JournalEntryService>();
        final entries =
            (entryService.get('entries', defValue: [])) as List<Object?>?;
        print(entries);
        print(entries.runtimeType);*/
        journalEntryCubit.updatedId((const Uuid()).v4());
        await _load(context);
      },
      onDispose: journalEntryCubit.reset,
      child: const _Frame(key: ValueKey('JournalFrame')),
    );
  }
}
