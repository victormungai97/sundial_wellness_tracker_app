part of 'journal.dart';

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryPullRefresh(
      onRefresh: () async => _load(context),
      child: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            children: [
              _Top(key: ValueKey('JournalTop')),
              SizedBox(height: 12),
              _Form(key: ValueKey('JournalForm')),
            ],
          ),
        ),
      ),
    );
  }
}
