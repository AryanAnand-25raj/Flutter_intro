import 'dart:math';

import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final _random = Random();
  final _quotes = const [
    'Every day, take one small step toward your goals.',
    'Discipline beats motivation on the hard days.',
    'Small progress is still progress.',
    'Consistency compounds over time.',
    'Learn, build, reflect, and ship again.',
  ];
  var _currentIndex = 0;

  void _generateQuote() {
    setState(() {
      var nextIndex = _random.nextInt(_quotes.length);
      while (nextIndex == _currentIndex && _quotes.length > 1) {
        nextIndex = _random.nextInt(_quotes.length);
      }
      _currentIndex = nextIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF16112B),
              colors.surface,
              const Color(0xFF0E1B2E),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: colors.primaryContainer,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(Icons.code_rounded, color: colors.primary),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('QUOTE LAB', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.4)),
                              Text('Build focus, one thought at a time'),
                            ],
                          ),
                        ),
                        const Icon(Icons.bolt_rounded),
                      ],
                    ),
                    const Spacer(),
                    Text('DAILY PROMPT', style: TextStyle(color: colors.primary, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: colors.surface.withOpacity(.72),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: colors.outlineVariant.withOpacity(.5)),
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 260),
                        child: Column(
                          key: ValueKey(_currentIndex),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.format_quote_rounded, size: 44, color: colors.primary),
                            const SizedBox(height: 16),
                            Text(
                              _quotes[_currentIndex],
                              style: const TextStyle(fontSize: 28, height: 1.28, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 22),
                            Text('A reminder for your development journey', style: TextStyle(color: colors.onSurfaceVariant)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _generateQuote,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text('Generate another quote'),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        'Flutter fundamentals project  •  In development',
                        style: TextStyle(color: colors.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
