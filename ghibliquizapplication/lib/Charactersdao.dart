import 'package:ghibliquizapplication/Characters.dart';
import 'package:ghibliquizapplication/DatabaseAssistant.dart';

class Charactersdao{

  Future<List<Characterss>> bringrandom40() async{
    var db = await DatabaseAssistant.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM characters ORDER BY RANDOM() LIMIT 40 ");

    return List.generate(maps.length, (i) {
      var line = maps[i];
      return Characterss(line["character_id"], line["character_name"], line["character_pic"]);

    });
  }

  Future<List<Characterss>> bringrandom3false(int character_id) async{
    var db = await DatabaseAssistant.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM characters WHERE character_id != $character_id ORDER BY RANDOM() LIMIT 3 ");

    return List.generate(maps.length, (i) {
      var line = maps[i];
      return Characterss(line["character_id"], line["character_name"], line["character_pic"]);

    });
  }



}