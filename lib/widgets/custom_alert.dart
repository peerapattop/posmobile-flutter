import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomAlert({
    Key? key,
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
      content: Text(
        content,
        style: const TextStyle(fontSize: 18),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text(
            'ยกเลิก',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0)),
          child: const Text(
            'ยืนยัน',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
