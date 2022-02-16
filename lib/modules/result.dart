import 'package:flutter/material.dart';
import 'package:mcqtask/modules/landing_screen.dart';

class ResultScreen extends StatelessWidget {
  int result;

  ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your score is $result/5',
                style: const TextStyle(color: Colors.black, fontSize: 36,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0,),
              Container(
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LandingScreen()),
                        (route) => false);
                  },
                  child: const Text(
                    'Start Over',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
