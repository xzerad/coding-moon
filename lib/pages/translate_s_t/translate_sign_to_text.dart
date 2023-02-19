import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TranslateSignToText extends StatelessWidget {
  const TranslateSignToText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TranslateSignToTextBody(),
    );
  }
}

class TranslateSignToTextBody extends StatefulWidget {
  const TranslateSignToTextBody({Key? key}) : super(key: key);

  @override
  State<TranslateSignToTextBody> createState() => _TranslateSignToTextBodyState();
}

class _TranslateSignToTextBodyState extends State<TranslateSignToTextBody> {

  CameraController? controller;
  bool frontCamera = false;
  void setCamera(){
    availableCameras().then((cameras){
      controller = CameraController(cameras[frontCamera?1:0], ResolutionPreset.max);
      controller?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
            // Handle access errors here.
              break;
            default:
            // Handle other errors here.
              break;
          }
        }
      });
    });

  }
  @override
  void initState() {
    setCamera();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double minValue= min(size.height/1.4, size.width/1.4);
    if(controller == null || !controller!.value.isInitialized){
      return const SizedBox();
    }else{
      return Stack(
        children: [
          Center(
            child: CameraDecoration(child:  Center(
              child: SizedBox(
                height: minValue,
                width: minValue,
                child: CameraPreview(controller!),
              ),
            ),

                ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed("/home");
                        },
                        child:const SizedBox(child: Text("Cancel", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),))),
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const CircleAvatar(backgroundColor: Colors.white, radius: 20,),
                    ),
                    GestureDetector(
                        onTap: (){

                          setState(() {
                            controller?.dispose();
                            frontCamera = false;
                          });
                          setCamera();
                        },
                        child: const Icon(Icons.cameraswitch, color: Colors.white, size: 30,))
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }
    
    

  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class CameraDecoration extends StatelessWidget {
  const CameraDecoration({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CameraDecorationRow(),
          child,
          Transform.rotate(angle: 3.14,child: const CameraDecorationRow()),

        ],
      ),
    );
  }
}

class CameraDecorationRow extends StatelessWidget {
  const CameraDecorationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("lib/assets/images/corner.png"),
        Transform.rotate(angle: 3.14/2,
            child: Image.asset("lib/assets/images/corner.png"))

      ],
    );
  }
}

