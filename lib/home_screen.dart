import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double bmi = 0;
  String result = "";

  void calculateBMI() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    double heightInMeter = height / 100;

    double calculatedBMI = weight / (heightInMeter * heightInMeter);

    setState(() {
      bmi = calculatedBMI;

      if (bmi < 18.5) {
        result = "Underweight";
      }
      else if (bmi < 25) {
        result = "Normal";
      }
      else {
        result = "Overweight";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: "Height (in cm)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: "Weight (kg)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: calculateBMI,
                child: const Text(
                  "Calculate BMI",
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "BMI: ${bmi.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              result,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),)

          ],
        ),
      ),
    );
  }
}