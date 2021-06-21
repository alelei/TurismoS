import 'package:flutter/material.dart';

class mainSite extends StatelessWidget {
  const mainSite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sangolqui", style: Theme.of(context).textTheme.headline3),
          Text("Iglesia", style: Theme.of(context).textTheme.headline5),
        ],

      )
      
      //child: null,
    );
  }
}