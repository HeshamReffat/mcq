import 'package:flutter/material.dart';
import 'package:mcqtask/modules/questions_screen.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  TextEditingController nameCon = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MCQ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'MCQ Exam',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Enter your name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.0)),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: nameCon,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter your name...';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionsScreen()),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Start',
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
