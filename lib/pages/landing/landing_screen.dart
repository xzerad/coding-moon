import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';

import '../../components/custom_button.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin{
  int index = 0;
  late AnimationController animationController;
  late Tween<double> opacityAnimation;
  Duration animationDuration = const Duration(milliseconds: 300);

  List content = [
    {
      "text":   const Text.rich(TextSpan(
                  text: "Convert Word in Sign Language\n",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, height: 6),
                  children: [
                  TextSpan(text:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: Colors.grey, height: 1))
                  ]
                  ), textAlign: TextAlign.center,),
      "image": "lib/assets/images/img.png"
    },
    {
      "text":  const Text.rich(TextSpan(
          text: "Translate Sign Language\n",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, height: 6),
          children: [
            TextSpan(text:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: Colors.grey, height: 1))
          ]
      ), textAlign: TextAlign.center,),
      "image": "lib/assets/images/img_1.png"
    },
    {
      "text":  const Text.rich(TextSpan(
          text: "Press Play and Phone will speak\n",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, height: 6),
          children: [
            TextSpan(text:"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: Colors.grey, height: 1))
          ]
      ), textAlign: TextAlign.center,),
      "image": "lib/assets/images/img_2.png"
    }
  ];

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: animationDuration);
    opacityAnimation = Tween(begin: 0, end: 1)..animate(animationController);
    animationController.addListener(() {
      setState(() {

      });
    });
    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            if(index < 2){
              animationController.reverse(from: 0);
              Future.delayed(animationDuration).then((value){
                setState(() {
                  index += 1;
                });
               animationController.forward(from: 0);
              });

            }else{
              Navigator.of(context).pushReplacementNamed("/home");
            }
          },
          child: Stack(
            children:[
              Positioned(
                top: 0,
                right: 10,
                child: Row(
                  children: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pushReplacementNamed("/home");

                    }, child: const Text("Skip"))
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                child: SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: animationController.value,
                          duration: animationDuration,
                          child: Column(
                            children: [
                              Image.asset(content[index]["image"], height: size.height/2,),
                              content[index]["text"]
                            ],
                          ),
                        ),
                        DotIndicator(length: 3, index: index,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(child: CustomButton(text: "Sign In", backgroundColor: Colors.black, foregroundColor: Colors.white, onPress: (){
                                Navigator.of(context).pushNamed("/signIn");
                              },)),
                              const SizedBox(width: 15,),
                              Expanded(child: CustomButton(text: "Register", backgroundColor: Colors.white, foregroundColor: Colors.black, onPress: (){
                                Navigator.of(context).pushNamed("/signUp");
                              })),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              ),
            ] ,
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.index=0, required this.length}) : super(key: key);
  final int index;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(length, (e)=>null).mapIndexed((i, e)=> Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: (i == index)? Colors.grey[50]:Colors.grey[700],
          borderRadius: BorderRadius.circular(5)
        ),
      )).toList(),
    );
  }
}


