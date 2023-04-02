import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateCourse extends StatefulWidget {
  const CreateCourse({super.key});

  @override
  State<CreateCourse> createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  final TextEditingController _controller = TextEditingController();
  String selected = 'BEGINNER';
  bool inPromotion = false;
  bool isValid = false;
  int validHelper = 0;
  Course? course;
  String? courseTitle;
  String? courseLevel;
  String? courseDescription;
  String? courseUrl;
  bool promoted = false;
  String? promoStartsAt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textFieldHeader(label: 'Course title'),
            textField(
                label: 'Course tittle',
                onChanged: (value) {
                  courseTitle = value;
                  validHelper += courseTitle!.isNotEmpty ? 1 : 0;
                },
                controller: _controller),
            textFieldHeader(label: 'Course thumbnail'),
            dropdownButton(
              onChanged: (value) {
                setState(() {
                  selected = value!;
                });
              },
            ),
            textField(
                label: 'Course url',
                onChanged: (value) {},
                controller: _controller),
            textField(
                label: 'Course description',
                onChanged: (value) {},
                controller: _controller),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SwitchListTile(
                value: inPromotion,
                onChanged: (value) {
                  setState(() {
                    inPromotion = value;
                  });
                },
                title: const Text(
                  'Course in promotion?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 50,
                  color: isValid ? Colors.red : Colors.grey,
                  child: const Center(
                    child: Text(
                      'Add Course',
                      style: kTexFieldHeaderStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding dropdownButton({required Function(String? value) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DropdownButton<String>(
        dropdownColor: Colors.blueGrey,
        hint: const Text('Choose course'),
        value: selected,
        items: const [
          DropdownMenuItem<String>(
              value: 'BEGINNER',
              child: Text(
                'BEGINNER',
                style: kDropdownTextStyle,
              )),
          DropdownMenuItem<String>(
              value: 'ADVANCED',
              child: Text(
                'ADVANCED',
                style: kDropdownTextStyle,
              )),
        ],
        onChanged: onChanged,
      ),
    );
  }

  Padding textFieldHeader({required String? label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        label!,
        style: kTexFieldHeaderStyle,
      ),
    );
  }

  Center textField({
    required String label,
    required Function(String input)? onChanged,
    required TextEditingController? controller,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            constraints: const BoxConstraints(
              maxHeight: 50,
              minHeight: 45,
              maxWidth: 350,
              minWidth: 200,
            ),
          ),
        ),
      ),
    );
  }
}

const TextStyle kTexFieldHeaderStyle =
    TextStyle(fontSize: 23, color: Colors.white);
const TextStyle kDropdownTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600);

class Course {
  final String title;
  final String level;
  final String courseUrl;
  final String description;
  final bool promoted;
  final Timestamp? promoStartsAt;

  const Course({
    required this.title,
    required this.level,
    required this.courseUrl,
    required this.description,
    this.promoted = false,
    this.promoStartsAt,
  });
}
