import 'package:flutter/material.dart';

//Normally only one widget per class so thats why i added this
class Question extends StatelessWidget {
  //Making sure the value never changes after the initialization
  //Final normally accompanies StatelessWidget
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    //Putting in container to make text take up more spcae then needed
    //Container has (margin, border, padding, child) in order
    return Container(
      width: double.infinity,
      //Setting space between title and navbar
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
