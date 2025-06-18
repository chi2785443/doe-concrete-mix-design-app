import 'package:flutter/material.dart';
import '../widgets/components.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.standardDeviationResult,
    required this.defectiveResult,
    required this.targetMeanStrengthResult,
    required this.freeWaterRatioResult,
    required this.freeWaterContentResult,
    required this.cementContentResult,
    required this.wetdensityofConcretetResult,
    required this.totalAggregateContentResult,
    required this.fineAggregateContentResult,
    required this.percentageofFineAggregateResult,
    required this.coasreAggregateContentResult,
    required this.cementRatioResult,
    required this.fineAggRatioResult,
    required this.coasreAggRatioResult,
    required this.rawCementRatioResult,
    required this.rawFineAggRatioResult,
    required this.rawCoasreAggRatioResult,
  });

  final String standardDeviationResult;
  final String defectiveResult;
  final String targetMeanStrengthResult;
  final String freeWaterRatioResult;
  final String freeWaterContentResult;
  final String cementContentResult;
  final String wetdensityofConcretetResult;
  final String totalAggregateContentResult;
  final String percentageofFineAggregateResult;
  final String fineAggregateContentResult;
  final String coasreAggregateContentResult;
  final String cementRatioResult;
  final String fineAggRatioResult;
  final String coasreAggRatioResult;
  final String rawCementRatioResult;
  final String rawFineAggRatioResult;
  final String rawCoasreAggRatioResult;

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF424242);
    const Color primaryLight = Color(0xFFBDBDBD);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryDark,
        title: const Text('Mix Design Result'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Center(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryDark,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Concrete Mix Ratio',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$cementRatioResult:$fineAggRatioResult:$coasreAggRatioResult',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Actually ($rawCementRatioResult : $rawFineAggRatioResult : $rawCoasreAggRatioResult)',
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(height: 30, color: primaryDark),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Variables',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: primaryDark,
                        ),
                      ),
                      Text(
                        'Values',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: primaryDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...[
                    Resultcard(title: 'Standard Deviation(s)', value: standardDeviationResult),
                    Resultcard(title: 'Defective(k)', value: defectiveResult),
                    Resultcard(title: 'Target Mean Strength(fm)', value: '$targetMeanStrengthResult N/mm²'),
                    Resultcard(title: 'Free Water-Cement Ratio(Fw/c)', value: freeWaterRatioResult),
                    Resultcard(title: 'Free Water Content(Fwc)', value: '$freeWaterContentResult kg/m³'),
                    Resultcard(title: 'Cement Content(Cc)', value: '$cementContentResult kg/m³'),
                    Resultcard(title: 'Concrete Wet-Density(Wdcc)', value: '$wetdensityofConcretetResult kg/m³'),
                    Resultcard(title: 'Total Aggregate Content(Ac)', value: '$totalAggregateContentResult kg/m³'),
                    Resultcard(title: 'Percent of Fine Aggregate(Pfa)', value: '$percentageofFineAggregateResult %'),
                    Resultcard(title: 'Fine Aggregate Content(Fa)', value: '$fineAggregateContentResult kg/m³'),
                    Resultcard(title: 'Coarse Aggregate Content(Ca)', value: '$coasreAggregateContentResult kg/m³'),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryDark,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'RE-CALCULATE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
