import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';


void main () => runApp(MaterialApp(
  home : MainPage(),
));

class MainPage extends StatefulWidget{
  HomePage createState() => HomePage();
}

class HomePage extends State<MainPage> {
  int leftdice = 1;
  int rightdice =2;
  AudioCache player = AudioCache();

  rolldice(){
    setState((){
      leftdice = Random().nextInt(6)+1;
      rightdice = Random().nextInt(6)+1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('My Dice App'),
          centerTitle: true,
          backgroundColor: Colors.red[600]
      ),
      body: Center (
        child :Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children : <Widget> [
            Image.asset('assets/diceeLogo.png'),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/dice/dice$leftdice.png'),
            Image.asset('assets/dice/dice$rightdice.png'),
          ]
          ),
         RaisedButton (
           color: Colors.red,
           onPressed: (){
             rolldice();
             player.play('roll.mp3');
             },
           child: Text('Roll dice'),
         ),]
        ),
      ),
    );
  }
}



