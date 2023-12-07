import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  late int numberoftrue;

  ResultPage({required this.numberoftrue});


  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Result Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("${widget.numberoftrue} True ${40-widget.numberoftrue} False",style: TextStyle(fontSize: 30,color: Colors.yellow[100]),),
            Text("% ${(widget.numberoftrue*100/40).toInt()} Success ",style: TextStyle(fontSize: 30,color: Colors.yellow[100]),),
            SizedBox( width: 250, height: 50,
              child: ElevatedButton(
                child: Text("Try again"),
                onPressed: (){
                  Navigator.pop(context);

                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
