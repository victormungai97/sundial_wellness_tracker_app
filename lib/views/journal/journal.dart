import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Journal'),
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
              Text('Journal', style: TextStyle(fontFamily: 'Nunito')),
            ],
          ),
        ),
      ),
    );
  }
}
