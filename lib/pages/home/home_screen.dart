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
    return Row(
      children: [
        Expanded(child: Column(
          children: [
            Icon(Icons.volume_up_rounded, color: Colors.grey, size: 100,),
            Text("translate sign to text", style: Theme.of(context).textTheme.displaySmall,)
          ],
        )),
        Expanded(child: Column(
          children: [
            Icon(Icons.remove_red_eye, color: Colors.grey, size: 100,),
            Text("convert text to sign", style: Theme.of(context).textTheme.displaySmall,)
          ],
        ))
      ],
    );
  }
}

