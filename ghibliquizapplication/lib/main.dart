import 'package:flutter/material.dart';
import 'package:ghibliquizapplication/QuizPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Welcome!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Welcome to Studio Ghibli Quiz",style: TextStyle(fontSize: 25),),
            SizedBox( width: 250, height: 50,
              child: ElevatedButton(
                child: Text("Start"),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => QuizPage()));

                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
