import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("/translateTextToSign");
                },
                child: Image.asset("lib/assets/images/tstt.png"),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                    Navigator.of(context).pushNamed("/translateSignToText");
                  },
                child: Image.asset("lib/assets/images/ttts.png"),
              ),
            )

          ],
        ),
      ),
    );
  }
}

