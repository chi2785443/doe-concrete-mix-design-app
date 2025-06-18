import 'package:flutter/material.dart';
import '../../../doe/presentation/pages/input_page.dart';

class ManualPage extends StatelessWidget {
  const ManualPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6D6E71); // Cement Gray
    const backgroundColor = Color(0xFFF2F2F2); // Light Concrete Gray
    const containerColor = Color(0xFFD1D1D1); // Warm Gray
    const titleColor = Color(0xFF2E2E2E); // Charcoal
    const accentColor = Color(0xFF4B6F44); // Earth Green

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('User Manual'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('The Mix Design Process', titleColor),
              const SizedBox(height: 8),
              _sectionBody(
                'This application simplifies and automates the DOE concrete mix design process. It uses Python algorithms to convert graphical data into equations, enabling accurate computation and decision-making.',
              ),
              const SizedBox(height: 16),
              _sectionTitle('Input Parameters Required', titleColor),
              _parameterBox(containerColor, [
                'Select a characteristic strength of concrete (Fc).',
                'Set concrete slump value using the slider (mm).',
                'Choose the type of aggregate: crushed or uncrushed.',
                'Enter the specific gravity of the aggregate.',
                'Select the percentage defective — the constant k is derived from the normal distribution.',
                'Enter the percentage passing of the fine aggregate through the 600µm sieve.',
                'Choose the maximum aggregate size (10mm, 20mm, or 40mm).',
                'Click "Calculate" to generate the concrete mix design.',
              ]),
              const SizedBox(height: 16),
              _sectionTitle('Output Values Obtained', titleColor),
              _parameterBox(containerColor, [
                'Target mean strength (Fm).',
                'Free water-cement ratio based on aggregate and slump.',
                'Cement content (Cc).',
                'Wet density of the concrete.',
                'Total volume of aggregate.',
                'Volume of fine aggregate based on size, grading zone, and water-cement ratio.',
                'Coarse aggregate content.',
                'Concrete mix ratio.',
              ]),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InputPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'I have read the user manual',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text, Color titleColor) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: titleColor,
      ),
    );
  }

  Widget _sectionBody(String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black87,
      ),
    );
  }

  Widget _parameterBox(Color bgColor, List<String> points) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: points
            .map(
              (point) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("• ",
                    style: TextStyle(fontSize: 16, color: Colors.black87)),
                Expanded(
                  child: Text(
                    point,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
