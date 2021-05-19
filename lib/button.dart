import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final Function callBack;

  const Button({Key key, this.text,this.textColor,this.textSize,this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextButton(
        onPressed: (){
          callBack(text);
        },
        style: TextButton.styleFrom(backgroundColor: Colors.grey[900],minimumSize: Size(80, 80),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),),
        child: Text(text,style: TextStyle(fontSize: textSize,fontWeight: FontWeight.bold,color: textColor),),
      ),
    );
  }
}

class ZeroButton extends StatelessWidget {
  final Function callBack;
  final String text;

  const ZeroButton({Key key, this.callBack,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextButton(
        onPressed: (){
          callBack(text);
        },
        style: TextButton.styleFrom(backgroundColor: Colors.grey[900],minimumSize: Size(180, 80),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),),
        child: Text(text,style: TextStyle(fontSize: 28 ,fontWeight: FontWeight.bold,color: Colors.indigoAccent),),
      ),
    );
  }
}

