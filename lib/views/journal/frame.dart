part of 'journal.dart';

class _Frame extends HookWidget {
  const _Frame({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final showLogoNotifier = useState(false);

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Journal'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Nunito',
          fontSize: 24,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      body: SizedBox(
        // width: double.maxFinite,
        height: size.height,
        child: Stack(
          children: [
            const _Body(key: ValueKey('JournalBody')),
            ValueListenableBuilder(
              builder: (context, showLogo, child) {
                if (!showLogo) return const SizedBox.shrink();
                return Positioned(
                  height: 25,
                  bottom: 20,
                  width: size.width,
                  child: const Center(
                    child: Text(
                      'Sundial',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF311B92),
                        fontSize: 20,
                        fontFamily: 'Nunito',
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              valueListenable: showLogoNotifier,
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Dashboard',
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 5,
        shape: const CircleBorder(),
        onPressed: () => context.go(Routes.dashboard),
        child: const Image(
          width: 24,
          height: 24,
          color: Colors.white,
          image: Svg('assets/icons/dashboard.svg'),
        ),
      ),
    );
  }
}
