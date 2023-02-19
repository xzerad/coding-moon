import 'package:flutter/material.dart';

import '../../components/custom_text_field.dart';
import '../../dictionary.dart';

class TranslateTextToSign extends StatelessWidget {
  const TranslateTextToSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TranslateTextToSignBody(),
    );
  }
}


class TranslateTextToSignBody extends StatefulWidget {
  const TranslateTextToSignBody({Key? key}) : super(key: key);

  @override
  State<TranslateTextToSignBody> createState() => _TranslateTextToSignBodyState();
}

class _TranslateTextToSignBodyState extends State<TranslateTextToSignBody> {
  Widget? image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,

      child: Stack(
        children: [
          if (image != null)
          Center(
            child: image,
          ),

          Positioned(
              bottom: 0,
              child: SizedBox(
                height: 60,
                width: size.width,
                child: Row(
                  children: [
                    Expanded(child: CustomTextField(hint: 'translate hi!', onChange: (value){
                      if(value.isEmpty){
                        setState(() {
                          image = null;
                        });
                        return;
                      }

                      String char = value[value.length -1].toUpperCase();
                      if(dict.containsKey(char)){
                        setState(() {
                          image = Image.asset( dict[char]!);
                        });
                      }else{
                        setState(() {
                          image = null;
                        });
                      }
                    },),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(Icons.front_hand, color: Colors.white,),
                    )

                  ],
                ),
              ))
        ],
      ),
    );
  }
}
