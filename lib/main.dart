import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String history='0';
  String expression;
  String result='0';

  void onButtonPress(String buttonVal){
    setState(() {
      if(buttonVal=='AC')
        {
          history='0';
          result='0';
        }
      else if(buttonVal=='C')
        {
          history=history.substring(0,(history.length)-1);
          if(history=='')
            {
              history='0';
            }
        }
      else if(buttonVal=='=')
        {
          expression=history;
          expression=expression.replaceAll('x', '*');

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm = ContextModel();
            result='${exp.evaluate(EvaluationType.REAL, cm)}';
          }
          catch (e){
            result='math error';
          }
        }
      else{
        if(history=='0')
          {
            history=buttonVal;
          }
        else{
          history=history+buttonVal;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.only(bottom: 30,right: 30),
            alignment: Alignment.bottomRight,
            child: Text(history,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600,color: Colors.white),),
          ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.only(bottom: 30,right: 30,top: 20),
            alignment: Alignment.topRight,
            child: Text(result,style: TextStyle(fontSize: 60,fontWeight: FontWeight.w600,color: Colors.white),),
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(text: 'AC',textSize: 25, textColor: Colors.purpleAccent,callBack: onButtonPress,),
              Button(text: 'C',textSize: 25, textColor: Colors.purpleAccent,callBack: onButtonPress,),
              Button(text: '%',textSize: 25, textColor: Colors.purpleAccent,callBack: onButtonPress,),
              Button(text: '/',textSize: 25, textColor: Colors.purpleAccent,callBack: onButtonPress,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(text: '7',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '8',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '9',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: 'x',textSize: 30, textColor: Colors.purpleAccent,callBack: onButtonPress,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(text: '4',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '5',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '6',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '-',textSize: 30, textColor: Colors.purpleAccent,callBack: onButtonPress,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(text: '1',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '2',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '3',textSize: 28, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '+',textSize: 30, textColor: Colors.purpleAccent,callBack: onButtonPress,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ZeroButton(text: '0',callBack: onButtonPress ),
              Button(text: '.',textSize: 30, textColor: Colors.indigoAccent,callBack: onButtonPress,),
              Button(text: '=',textSize: 28, textColor: Colors.purpleAccent,callBack: onButtonPress,),
            ],
          ),
        ],
      ),
    );
  }
}

