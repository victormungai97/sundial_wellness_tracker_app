import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:sundial_wellness_tracker/bloc/cubits/health_metrics/health_metrics_cubit.dart';
import 'package:sundial_wellness_tracker/navigation/navigation.dart';

void _reset(BuildContext context) {
  context.read<JournalEntryBloc>().reset();
  context.read<HealthMetricsCubit>().reset();
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 18,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            children: [
              FlutterLogo(size: 320),
              SizedBox(height: 12),
              Text('Dashboard', style: TextStyle(fontFamily: 'Nunito')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Journal',
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 5,
        shape: const CircleBorder(),
        onPressed: () => context.go(Routes.root),
        child: const Image(
          width: 24,
          height: 24,
          color: Colors.white,
          image: Svg('assets/icons/journal.svg'),
        ),
      ),
    );
  }
}
