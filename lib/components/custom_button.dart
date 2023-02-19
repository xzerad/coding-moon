import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.backgroundColor, required this.foregroundColor}) : super(key: key);
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey)
        )

    ), child: Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500),),
    ),);
  }
}
