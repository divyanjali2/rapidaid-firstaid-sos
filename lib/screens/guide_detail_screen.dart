import 'package:flutter/material.dart';
import '../models/guide.dart';

class GuideDetailScreen extends StatelessWidget {
  final Guide guide;

  const GuideDetailScreen({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(guide.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: guide.steps.length,
        itemBuilder: (context, index) {
          final step = guide.steps[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(step.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 6),
                  Text(step.content, style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}