part of 'journal.dart';

class _Form extends HookWidget {
  const _Form({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final journalEntryCubit = context.watch<JournalEntryCubit>();

    FormGroup buildForm() => fb.group(
          <String, Object>{
            'content': FormControl<String>(validators: [Validators.required]),
            'mood': FormControl<Mood>(
              validators: [Validators.required],
              value: journalEntryCubit.state.mood,
            ),
          },
        );

    return ReactiveFormBuilder(
      form: buildForm,
      builder: (context, form, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: SizedBox(
                height: 220,
                child: ReactiveTextField<String>(
                  formControlName: 'content',
                  validationMessages: {
                    ValidationMessage.required: (_) => 'Please write something',
                  },
                  focusNode: focusNode,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                  textInputAction: TextInputAction.newline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Color(0xffEAECF0)),
                    ),
                    contentPadding: EdgeInsets.all(16),
                    errorStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFCA080E),
                      fontFamily: 'Nunito',
                    ),
                    hintText: "What's on your mind?",
                    hintStyle: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  expands: true,
                  onChanged: (control) {
                    context
                        .read<JournalEntryCubit>()
                        .updatedContent(control.value ?? '');
                  },
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 2, 0, 2.2),
              child: Text(
                'Please select your current mood',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 2.5),
              child: ReactiveValueListenableBuilder<Mood>(
                formControlName: 'mood',
                builder: (context, control, child) {
                  final invalid = control.invalid;
                  return StreamBuilder(
                    stream: control.touchChanges,
                    builder: (context, snapshot) {
                      final errored = (snapshot.data ?? false) && invalid;
                      final error = control.errors.entries.firstOrNull;

                      return SizedBox(
                        height: errored ? 180 : 152,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: BlocListener<JournalEntryCubit,
                                    JournalEntryModel>(
                                  listener: (context, state) {
                                    form
                                        .control('mood')
                                        .updateValue(state.mood);
                                    form.markAsTouched();
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ...Mood.values.map(
                                        (mood) => MoodSelector(mood: mood),
                                      ),
                                    ],
                                  ),
                                  listenWhen: (previous, current) {
                                    return previous.mood != current.mood;
                                  },
                                ),
                              ),
                            ),
                            if (errored)
                              Text(
                                error != null
                                    ? switch (error.key) {
                                        ValidationMessage.required =>
                                          'Please select a mood',
                                        _ => '${error.key}\t${error.value}',
                                      }
                                    : 'Mood is invalid',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFCA080E),
                                  fontFamily: 'Nunito',
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (focusNode.hasFocus) focusNode.unfocus();
                  if (!form.valid) {
                    form.markAllAsTouched();
                    return;
                  }
                  //final values = Map<String, Object?>.from(form.value);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  iconSize: 24,
                  iconColor: Colors.white,
                  textStyle: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 17,
                  ),
                  elevation: 5,
                ),
                label: const Text('Save'),
                icon: const Icon(Icons.save),
              ),
            ),
          ],
        );
      },
    );
  }
}
