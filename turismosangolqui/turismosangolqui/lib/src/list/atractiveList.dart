import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';

import 'package:turismosangolqui/src/pages/main_site.dart';
import 'package:turismosangolqui/src/services/atractives_service.dart';


class atractiveList extends StatefulWidget {
  const atractiveList({Key? key}) : super(key: key);

  @override
  _AtractiveListState createState() => _AtractiveListState();
}

class _AtractiveListState extends State<atractiveList> {
  AtractiveService _service = AtractiveService();
  List<Atractive> _Atractive = [];
  
  @override
  void initState() {
    super.initState();
   
    _loadAtractive()();
  }

  @override
  void dispose() {
    super.dispose();   
  }

  @override
  Widget build(BuildContext context) {
    return _Atractive.length == 0? Container(
            child: Center(child: Text('Descargando Items')),
          ): 
          
          Container(
            child: GestureDetector( //tocar
             onTap: (){
               
              Navigator.push(context, MaterialPageRoute(builder: (context)=> mainSite(),
        ));
             },
          child: Column(
            // mainAxisAlignment : MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
              children:
                  _Atractive.map((e) =>ListTile(title :Text(e.name, style: Theme.of(context).textTheme.headline3) ,
                  
                  leading:Image.network((e.photo??""), width: 200, height: 200, fit: BoxFit.cover))).toList()),
        ));
  }
 

  _loadAtractive() {
    _service.getAtractive().then((value)  {
       _Atractive = value;
       setState(() {});
     });
  }
}
