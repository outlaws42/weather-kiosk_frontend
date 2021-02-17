import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/dt_provider.dart';
import '../helpers/widget_config.dart';

class DT extends StatefulWidget {
  @override
  _DTState createState() => _DTState();
}

class _DTState extends State<DT> {
  Timer clock;

  @override
  void initState() {
    super.initState();
    clock = Timer.periodic(Duration(seconds: 1), (Timer t) => _getDateTime());
  }

  @override
  void dispose() {
    clock?.cancel();
    super.dispose();
  }

  void _getDateTime() {
    // 12 hour clock with Date
    Provider.of<DTProvider>(context, listen: false).getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetConfig.contTrans(
      width: ScreenUtil().setWidth(137.5), //137.5,
      height: ScreenUtil().setHeight(150.0), //115.0,
      gradColor1: '#232625',
      gradColor2: '#404241',
      opacity: '0xB3',
      marRight: 20,
      marTop: 10,
      bordRadRB: 20.0,
      bordRadRT: 20.0,
      context: context,
      child: Consumer<DTProvider>(
        child: CircularProgressIndicator(),
        builder: (ctx, payload, ch) => payload.time.length == 0
            ? ch
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment.center,
                    child: Text(
                      payload.time[0].time.toString(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    alignment: Alignment.center,
                    child: Text(
                      payload.time[0].date,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
