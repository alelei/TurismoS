import 'dart:convert';
import 'package:http/http.dart' as http;


class AtractiveService {
  AtractiveService();

  //Future, indica que es una llama asíncrona
  Future<List<Atractives>> getAtractives() async {
    List<Atractives> items = [];
    try {
      
      var uri = Uri.https(
          "us-central1-espe-track-medical.cloudfunctions.net", "/api/api/atractive/1/10");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final menu = new Atractives.fromJson(item);
        items.add(menu);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
