// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
      debugShowCheckedModeBanner: false,
    ); 
  } 
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

StoryBrain storyBrain = StoryBrain();

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
            )
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex:12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    ),
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                
                  },
                  
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    )
                  ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                
                    },
                    
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                      )
                    ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}