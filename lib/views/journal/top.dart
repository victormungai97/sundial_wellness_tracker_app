part of 'journal.dart';

class _Top extends StatelessWidget {
  const _Top({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            'assets/logos/App Logo.png',
            width: size.width * (3 / 5),
          ),
          const SizedBox(height: 16),
          BlocBuilder<MotivationCubit, MotivationState>(
            builder: (context, state) {
              if (state is MotivationInitial) return const SizedBox.shrink();
              if (state is MotivationRandomRetrievalInProgress) {
                return const BlockQuoteWidget(
                  outerPadding: EdgeInsets.zero,
                  blockColor: Color(0xffa3a3a3),
                  blockWidth: 5,
                  child: Text(
                    'Getting motivational message...',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Color(0xffa3a3a3),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                );
              }
              if (state is MotivationRandomRetrievalFailure) {
                return BlockQuoteWidget(
                  outerPadding: EdgeInsets.zero,
                  blockColor: Colors.redAccent,
                  blockWidth: 5,
                  child: Text(
                    state.exception,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Color(0xFFCA080E),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                );
              }
              if (state is MotivationRandomRetrievalDone) {
                final motivation = state.motivation;
                return BlockQuoteWidget(
                  outerPadding: const EdgeInsets.symmetric(horizontal: 20),
                  blockColor: Colors.orangeAccent,
                  blockWidth: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        motivation.message,
                        style: const TextStyle(fontFamily: 'Nunito'),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '~\t${motivation.author}',
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.fromLTRB(20, 12, 16, 0),
            child: BlocBuilder<HealthMetricsCubit, HealthMetricsState>(
              builder: (context, state) {
                if (state is! HealthMetricsStepsCalculationState) {
                  return const SizedBox.shrink();
                }
                if (state is HealthMetricsStepsCalculationInProgress) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return ListTile(
                  leading: Icon(
                    Icons.directions_walk,
                    color: state.whenOrNull(
                      failure: (_) => const Color(0xFFCA080E),
                      success: (_) => const Color(0xFF14A44D),
                    ),
                    size: 36,
                  ),
                  title: state.whenOrNull(
                    failure: (_) => const Text('Error'),
                    success: (_) => const Text('Steps Taken'),
                  ),
                  titleTextStyle: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Color(0xFF424242),
                  ),
                  subtitle: state.whenOrNull(
                    failure: Text.new,
                    success: (steps) => Text('$steps'),
                  ),
                  subtitleTextStyle: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: state.whenOrNull(
                      failure: (_) => 20,
                      success: (_) => 24,
                    ),
                    color: const Color(0xFF212121),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed:
                          context.read<HealthMetricsCubit>().calculateSteps,
                      color: const Color(0xFF3B71CA),
                      iconSize: 28,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
