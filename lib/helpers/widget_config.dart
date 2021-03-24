import 'package:flutter/material.dart';

class WidgetConfig {
  static Widget contGradDropRect({
    height,
    width,
    double marLeft = 0.0,
    double marTop = 0.0,
    double marRight = 0.0,
    double marBottom = 0.0,
    double bordRadLT = 0.0,
    double bordRadLB = 0.0,
    double bordRadRB = 0.0,
    double bordRadRT = 0.0,
    double borderRad = 0.0,
    String gradColor1 = '#BF4407',
    String gradColor2 = '#232625',
    String opacity = '0xff',
    double offX = 0.0,
    double offY = 0.0,
    double blurRad = 0.0,
    BuildContext context,
    Widget child,
  }) {
    String colorOne = gradColor1.replaceAll('#', opacity);
    String colorTwo = gradColor2.replaceAll('#', opacity);
    var borderEqual = false;
    if (bordRadLT == 0.0 &&
        bordRadLB == 0.0 &&
        bordRadRT == 0.0 &&
        bordRadRB == 0.0) {
      borderEqual = true;
    }
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.fromLTRB(marLeft, marTop, marRight, marBottom),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Color.fromRGBO(0, 128, 128, 0.75),
        borderRadius: borderEqual
            ? BorderRadius.circular(borderRad)
            : BorderRadius.only(
                bottomLeft: Radius.circular(bordRadLB),
                topLeft: Radius.circular(bordRadLT),
                bottomRight: Radius.circular(bordRadRB),
                topRight: Radius.circular(bordRadRT),
              ),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(int.parse(colorOne)),
              Color(int.parse(colorTwo)),
            ]),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(offX, offY), 
            blurRadius: blurRad,
          ),
        ],
      ),
      child: child,
    );
  }

  static Widget contTrans({
    height,
    width,
    double marLeft = 0.0,
    double marTop = 0.0,
    double marRight = 0.0,
    double marBottom = 0.0,
    double bordRadLT = 0.0,
    double bordRadLB = 0.0,
    double bordRadRB = 0.0,
    double bordRadRT = 0.0,
    double borderRad = 0.0,
    String gradColor1 = '#BF4407',
    String gradColor2 = '#232625',
    String opacity = '0xff',
    BuildContext context,
    Widget child,
  }) {
    String colorOne = gradColor1.replaceAll('#', opacity);
    String colorTwo = gradColor2.replaceAll('#', opacity);
    var borderEqual = false;
    if (bordRadLT == 0.0 &&
        bordRadLB == 0.0 &&
        bordRadRT == 0.0 &&
        bordRadRB == 0.0) {
      borderEqual = true;
    }
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.fromLTRB(marLeft, marTop, marRight, marBottom),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Color.fromRGBO(0, 128, 128, 0.75),
        borderRadius: borderEqual
            ? BorderRadius.circular(borderRad)
            : BorderRadius.only(
                bottomLeft: Radius.circular(bordRadLB),
                topLeft: Radius.circular(bordRadLT),
                bottomRight: Radius.circular(bordRadRB),
                topRight: Radius.circular(bordRadRT),
              ),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(int.parse(colorOne)),
              Color(int.parse(colorTwo)),
            ]),
      ),
      child: child,
    );
  }

  static Widget contTransNoGrad({
    height,
    width,
    double marLeft = 0.0,
    double marTop = 0.0,
    double marRight = 0.0,
    double marBottom = 0.0,
    double bordRadLT = 0.0,
    double bordRadLB = 0.0,
    double bordRadRB = 0.0,
    double bordRadRT = 0.0,
    double borderRad = 0.0,
    String color = '#BF4407',
    String opacity = '0xff',
    BuildContext context,
    Widget child,
  }) {
    String colorOne = color.replaceAll('#', opacity);
    var borderEqual = false;
    if (bordRadLT == 0.0 &&
        bordRadLB == 0.0 &&
        bordRadRT == 0.0 &&
        bordRadRB == 0.0) {
      borderEqual = true;
    }
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.fromLTRB(marLeft, marTop, marRight, marBottom),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(int.parse(colorOne)),
        borderRadius: borderEqual
            ? BorderRadius.circular(borderRad)
            : BorderRadius.only(
                bottomLeft: Radius.circular(bordRadLB),
                topLeft: Radius.circular(bordRadLT),
                bottomRight: Radius.circular(bordRadRB),
                topRight: Radius.circular(bordRadRT),
              ),
      ),
      child: child,
    );
  }

  static Widget contGrad({
    height,
    width,
    String gradColor1 = '#BF4407',
    String gradColor2 = '#232625',
    BuildContext context,
    Widget child,
  }) {
    String colorOne = gradColor1.replaceAll('#', '0xff');
    String colorTwo = gradColor2.replaceAll('#', '0xff');

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(int.parse(colorOne)),
              Color(int.parse(colorTwo)),
            ]),
      ),
      child: child,
    );
  }

  static Widget contImage({
    backImage,
    BuildContext context,
    Widget child,
  }) {
    // print(backImage);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background/$backImage"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
