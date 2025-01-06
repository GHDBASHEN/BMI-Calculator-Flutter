import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  const BMICalculator({super.key}); // Fix applied here
  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 1.75; // default height in meters
  double weight = 70; // default weight in kilograms
  String result = "";

  void calculateBMI() {
    final double bmi = weight / (height * height);
    setState(() {
      result = "Your BMI is ${bmi.toStringAsFixed(2)}";
      if (bmi < 18.5) {
        result += " (Underweight)";
      } else if (bmi < 24.9) {
        result += " (Normal weight)";
      } else if (bmi < 29.9) {
        result += " (Overweight)";
      } else {
        result += " (Obesity)";
      }
    });
  }

  void incrementWeight() => setState(() => weight += 1);
  void decrementWeight() =>
      setState(() => weight = weight > 0 ? weight - 1 : 0);

  void incrementHeight() => setState(() => height += 0.01);
  void decrementHeight() =>
      setState(() => height = height > 0 ? height - 0.01 : 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('background.jpg'), // Add image to assets folder
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BMI Calculator',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 180, 25, 25)),
              ),
              Image.asset('bmi_chart.png',
                  height: 150), // Add this image to assets
              const SizedBox(height: 20),
              const Text('Height (meters)',
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    onPressed: decrementHeight,
                    child:
                        const Icon(Icons.remove, color: Colors.red, size: 30),
                  ),
                  const SizedBox(width: 12),
                  Text(height.toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 153, 33, 33))),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    onPressed: incrementHeight,
                    child: const Icon(Icons.add, color: Colors.green, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text('Weight (kg)',
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    onPressed: decrementWeight,
                    child:
                        const Icon(Icons.remove, color: Colors.red, size: 30),
                  ),
                  const SizedBox(width: 12),
                  Text(weight.toStringAsFixed(1),
                      style:
                          const TextStyle(fontSize: 24, color: Colors.white)),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    onPressed: incrementWeight,
                    child: const Icon(Icons.add, color: Colors.green, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: calculateBMI,
                child: const Text('Calculate BMI',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16.0),
              Text(
                result,
                style: const TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(255, 177, 8, 8)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
