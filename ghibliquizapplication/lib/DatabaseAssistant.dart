import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseAssistant{
  static final String databaseName = "ghiblicharacters.sqlite";

  static Future<Database> databaseAccess() async{
    String databasePath = join (await getDatabasesPath(),databaseName);
    
    if(await databaseExists(databasePath)){
      print("database already exist. No need to copy it");
    }else{
      ByteData data = await rootBundle.load("database/ghiblicharacters.sqlite");
      
      List <int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      
      await File(databasePath).writeAsBytes(bytes,flush: true);
      
      print("database copied");
    }
    return openDatabase(databasePath);
  }

}