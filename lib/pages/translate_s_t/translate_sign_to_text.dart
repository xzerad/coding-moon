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

  @override
  void initState() {
    availableCameras().then((cameras){
      controller = CameraController(cameras[0], ResolutionPreset.max);
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
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double minValue= min(size.height/1.5, size.width/1.5);
    if(controller == null || !controller!.value.isInitialized){
      return const SizedBox();
    }else{
      return Center(
        child: SizedBox(
          height: minValue,
          width: minValue,
          child: CameraPreview(controller!),
        ),
      );
    }
    
    

  }
}

class CameraDecoration extends StatelessWidget {
  const CameraDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

      ],
    );
  }
}
