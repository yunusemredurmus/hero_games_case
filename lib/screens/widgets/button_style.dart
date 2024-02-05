import 'package:flutter/material.dart';

class ButtonforSplash extends StatelessWidget {
  const ButtonforSplash({super.key, this.text, this.onPressed, this.color});

  final String? text;
  final Function? onPressed;
  final String? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        ),
        backgroundColor:
            MaterialStateProperty.all(Colors.deepPurpleAccent[200]),
      ),
      child: Text(
        text!,
        style: TextStyle(color: Colors.white),
        
      ),
    );
  }
}
