import 'package:doe_concrete_mix_desiger/features/doe/presentation/pages/calculate_page.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔷 Top action cards
            const Text(
              'Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReusableCard(
                  colour: Colors.teal,
                  cardIcon: const Icon(Icons.upload, color: Colors.white, size: 30),
                  cardText: 'Upload',

                ),
                ReusableCard(
                  colour: Colors.orange,
                  cardIcon: const Icon(Icons.analytics, color: Colors.white, size: 30),
                  cardText: 'Analyze',
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalculatePage(),
                      ),
                    );
                  },
                ),
                const ReusableCard(
                  colour: Colors.blue,
                  cardIcon: Icon(Icons.report, color: Colors.white, size: 30),
                  cardText: 'Report',
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🧾 FlatCard to show extra info or form
            const FlatCard(
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1. Tap on Upload to choose a file.\n'
                        '2. Click Analyze to process the input.\n'
                        '3. Check the report section for results.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📊 Results
            const Text(
              'Summary Results',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Resultcard(title: 'Status', value: 'Completed'),
            const Resultcard(title: 'Accuracy', value: '92.5%'),
            const Resultcard(title: 'Last Updated', value: 'May 21, 2025'),
          ],
        ),
      ),
    );
  }
}
