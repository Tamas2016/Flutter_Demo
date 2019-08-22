import 'package:flutter/material.dart';

class SignaturePainter extends CustomPainter {

  final List<Offset> points;

  SignaturePainter(this.points);

  void paint (Canvas canvas,Size size){
    var paint = new Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5.0;
    
    for(int i =0; i<points.length -1;i++){
      if(points[i] != null && points[i+1] !=null){
        canvas.drawLine(points[i],  points[i+1], paint);
      }
    }

    bool shouldRepaint(SignaturePainter other) => other.points != points;

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }


}
