import 'package:doe_concrete_mix_desiger/features/doe/presentation/pages/result_page.dart';
import 'package:flutter/material.dart';

import '../widgets/components.dart';
import '../../../../core/constants.dart';
import '../../domain/doe_calculation_brain.dart';


const activeColour = Color(0xFF424242);  // Bright Blue – trust, attention
const inActiveColour = Color(0xFFB0BEC5); // Blue Grey – cool and soft



enum StoneType { crushed, natural }

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  Color naturalColour = inActiveColour;
  Color crushedColour = inActiveColour;

  Color tenAggSizeColour = inActiveColour;
  Color twentyAggSizeColour = inActiveColour;
  Color thirtyAggSizeColour = inActiveColour;

  StoneType? selectedStoneType;
  int slump = 0;
  int percentagePassing = 0;
  double fc = 0;
  int selectedAggType = 0;
  late int selectedAggSize;
  List<double> specificgravity = [2.4, 2.5, 2.6, 2.7, 2.8, 2.9];
  List<double> defective = [1, 2.5, 5, 10];
  double? _selectedSpecificGravity;
  double? _selectedDefective;

  void updateColour(int size) {
    if (size == 10) {
      if (tenAggSizeColour == inActiveColour) {
        tenAggSizeColour = activeColour;
        twentyAggSizeColour = inActiveColour;
        thirtyAggSizeColour = inActiveColour;
      } else {
        tenAggSizeColour = inActiveColour;
      }
    }
    if (size == 20) {
      if (twentyAggSizeColour == inActiveColour) {
        twentyAggSizeColour = activeColour;
        tenAggSizeColour = inActiveColour;
        thirtyAggSizeColour = inActiveColour;
      } else {
        twentyAggSizeColour = inActiveColour;
      }
    }
    if (size == 40) {
      if (thirtyAggSizeColour == inActiveColour) {
        thirtyAggSizeColour = activeColour;
        tenAggSizeColour = inActiveColour;
        twentyAggSizeColour = inActiveColour;
      } else {
        thirtyAggSizeColour = inActiveColour;
      }
    }
  }

  final TextEditingController _controller = TextEditingController();
  late double charateristicStrength;

  void _getIntvaluen() {
    try {
      charateristicStrength = double.parse(_controller.text);
    } catch (e) {
      charateristicStrength = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF212121),
        elevation: 20,
        title: const Text(
          'Mix design (DOE)',
          style: TextStyle(color: Color(0xFFF5F5F5)),
        ),
      ),
      body: ListView(
        children: [
          FlatCard(
            cardChild: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Concrete Strength',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    enabled: true,

                    controller: _controller,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _getIntvaluen(),
                    style: const TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 14,
                      color: Colors.black,

                    ),
                    textAlign: TextAlign.center,
                    decoration: kDecorationTextField.copyWith(
                      hintText: 'Enter strength (N/mm²)',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                                        ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF424242),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Slump Value',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        slump.toString(),
                        style: kTextStyleBold.copyWith(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'mm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: slump.toDouble(),
                    min: 0.0,
                    max: 180.0,
                    divisions: 18,
                    label: '$slump mm',
                    activeColor: const Color(0xFF424242),
                    inactiveColor: const Color(0xFFBDBDBD),
                    onChanged: (double newValue) {
                      setState(() {
                        slump = newValue.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),


          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Type of Aggregate',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectedAggType = 1;
                        setState(() {
                          selectedStoneType = StoneType.natural;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedStoneType == StoneType.natural
                            ? activeColour
                            : inActiveColour,
                        cardIcon: const Icon(
                          Icons.landscape,
                          color: Color(0xFF2979FF),
                          size: 30,
                        ),
                        cardText: 'NATURAL',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedAggType = 2;
                        setState(() {
                          selectedStoneType = StoneType.crushed;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedStoneType == StoneType.crushed
                            ? activeColour
                            : inActiveColour,
                        cardIcon: const Icon(
                          Icons.construction,
                          color: Color(0xFF2979FF),
                          size: 30,
                        ),
                        cardText: 'CRUSHED',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


          //
          FlatCard(
            cardChild: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'SPECIFIC GRAVITY (u)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.redAccent),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text('Select specific gravity'),
                        isExpanded: true,
                        value: _selectedSpecificGravity,
                        items: specificgravity.map((option) {
                          return DropdownMenuItem(
                            value: option,
                            child: Text(option.toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSpecificGravity = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 1, color: Color(0xFFBDBDBD)),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'DEFECTIVE PERCENTAGE (%)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.redAccent),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text('Select defective percentage'),
                        isExpanded: true,
                        value: _selectedDefective,
                        items: defective.map((option) {
                          return DropdownMenuItem(
                            value: option,
                            child: Text(option.toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedDefective = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          FlatCard(
            cardChild: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'PERCENTAGE PASSING (600µm)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF424242),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        percentagePassing.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424242),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '%',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: percentagePassing.toDouble(),
                    min: 0.0,
                    max: 100.0,
                    activeColor: const Color(0xFF424242),
                    inactiveColor: const Color(0xFFBDBDBD),
                    divisions: 100,
                    label: '$percentagePassing%',
                    onChanged: (double newValue) {
                      setState(() {
                        percentagePassing = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),


          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFBDBDBD),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'SELECT AGGREGATE SIZE',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableCard(
                      colour: tenAggSizeColour,
                      cardIcon: const Icon(Icons.landscape, color: Color(0xFF2979FF)),
                      cardText: '10mm',
                      onTap: () {
                        setState(() {
                          updateColour(10);
                          selectedAggSize = 10;
                        });
                      },
                    ),
                    ReusableCard(
                      colour: twentyAggSizeColour,
                      cardIcon: const Icon(Icons.landscape, color: Color(0xFF2979FF)),
                      cardText: '20mm',
                      onTap: () {
                        setState(() {
                          updateColour(20);
                          selectedAggSize = 20;
                        });
                      },
                    ),
                    ReusableCard(
                      colour: thirtyAggSizeColour,
                      cardIcon: const Icon(Icons.landscape, color: Color(0xFF2979FF)),
                      cardText: '40mm',
                      onTap: () {
                        setState(() {
                          updateColour(40);
                          selectedAggSize = 40;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),


          GestureDetector(
            onTap: () {
              DoeCalculationBrain calc = DoeCalculationBrain(
                fc: charateristicStrength,
                slump: slump,
                aggtype: selectedAggType,
                sg: _selectedSpecificGravity,
                defective: _selectedDefective,
                agg_size: selectedAggSize,
                Pp: percentagePassing,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    standardDeviationResult:
                    calc.getStandardDeviation().toStringAsFixed(1),
                    defectiveResult: calc.getDefective().toString(),
                    targetMeanStrengthResult:
                    calc.getTargetMeanStrength().toStringAsFixed(1),
                    freeWaterRatioResult:
                    calc.getFreeWaterRatio().toStringAsFixed(2),
                    freeWaterContentResult:
                    calc.getFreeWaterContent().toStringAsFixed(0),
                    cementContentResult:
                    calc.getCementContent().toStringAsFixed(1),
                    wetdensityofConcretetResult:
                    calc.getWetdensityofConcrete().toStringAsFixed(1),
                    totalAggregateContentResult:
                    calc.getTotalAggregateContent().toStringAsFixed(1),
                    percentageofFineAggregateResult:
                    calc.getPercentageofFineAggregate().toStringAsFixed(1),
                    fineAggregateContentResult:
                    calc.getFineAggregateContent().toStringAsFixed(1),
                    coasreAggregateContentResult:
                    calc.getCoarseAggregateContent().toStringAsFixed(1),
                    cementRatioResult: calc.getCementRatio().toStringAsFixed(0),
                    fineAggRatioResult:
                    calc.getFineAggRatio().toStringAsFixed(0),
                    coasreAggRatioResult:
                    calc.getCoarseAggRatio().toStringAsFixed(0),
                    rawCementRatioResult:
                    calc.getCementRatio().toStringAsFixed(1),
                    rawFineAggRatioResult:
                    calc.getFineAggRatio().toStringAsFixed(1),
                    rawCoasreAggRatioResult:
                    calc.getCoarseAggRatio().toStringAsFixed(1),
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              color: const Color(0xFF424242),
              width: double.infinity,
              height: 50,
              child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}


