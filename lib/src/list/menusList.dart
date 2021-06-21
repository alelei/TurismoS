import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/MenuPri_models.dart';

import 'package:turismosangolqui/src/services/patient_service.dart';


class menusList extends StatefulWidget {
  const menusList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<menusList> {
  MenuPriService _service = MenuPriService();
  List<MenuPri> _MenusPri = [];
  
  @override
  void initState() {
    super.initState();
   
    _loadMenusPri();
  }

  @override
  void dispose() {
    super.dispose();   
  }

  @override
  Widget build(BuildContext context) {
    return _MenusPri.length == 0? Container(
            child: Center(child: Text('Descargando Items')),
          )
                 
           : Center(
             
                   
                child: Column(
                  
               
              children:                                  
                  _MenusPri.map((e) =>ListTile(
                  leading:

                  Image.network((e.photo??""),height: 800,width: 500, fit: BoxFit.fill))).toList()));
        
  }
  /*
   Widget build(BuildContext context) {
    return Card(      
      child: ListTile(
          minVerticalPadding : 50.0 ,        
          title: Text("Terapia #"),
          subtitle: Text("Esguinse de tobillo grado 2"),
          trailing: Image.asset("images/" + img + ".jpg")),
    );
  }*/

  _loadMenusPri() {
    _service.getMenuPri().then((value)  {
       _MenusPri = value;
       setState(() {});
     });
  }
}
