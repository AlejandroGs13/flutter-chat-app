import 'package:flutter/material.dart';

class BlueButtom extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;

  const BlueButtom(
      {Key? key, required this.textButton, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.blue, shape: const StadiumBorder()),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
