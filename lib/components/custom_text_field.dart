import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint, this.onChange}) : super(key: key);
  final String hint;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value){
          onChange?.call(value);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 2.0)

          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)


          ),

          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),

          filled: true,
          fillColor: Colors.black
      ),
      style: TextStyle(color: Colors.white),
      ),
    )
    ;
  }
}
