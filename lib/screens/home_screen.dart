import 'package:flutter/material.dart';
import '../data/sample_guides.dart';
import 'guide_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RapidAid')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sampleGuides.length,
              itemBuilder: (context, index) {
                final guide = sampleGuides[index];
                return Card(
                  child: ListTile(
                    title: Text(guide.title),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GuideDetailScreen(guide: guide),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          // Placeholder SOS button — logic comes in the next step
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('SOS logic comes next!')),
                );
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'SOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}