import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var _url = false;
  var _port = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
          // child: Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Form(
          //     child: SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           Container(
          //             padding: EdgeInsets.all(8),
          //             child: Text(
          //               'API Base URL',
          //               style: Theme.of(context).textTheme.headline4,
          //             ),
          //           ),
          //           Row(
          //             children: [
          //               Container(
          //                 width: 100,
          //                 child: Checkbox(
          //                     value: _url,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _url = !_url;
          //                       });
          //                     }),
          //               ),
          //               Container(
          //                 width: 300,
          //                 child: TextFormField(
          //                   decoration: InputDecoration(labelText: 'Base URL'),
          //                   // Assigns the button on the popup keyboard
          //                   textInputAction: TextInputAction.next,
          //                   keyboardType: TextInputType.text,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Container(
          //                 width: 100,
          //                 child: Checkbox(
          //                     value: _port,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _port = !_port;
          //                       });
          //                     }),
          //               ),
          //               Container(
          //                 width: 300,
          //                 child: TextFormField(
          //                   decoration: InputDecoration(labelText: 'Port'),
          //                   // Assigns the button on the popup keyboard
          //                   textInputAction: TextInputAction.next,
          //                   // Tells what type of keyboard you want
          //                   keyboardType: TextInputType.number,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Container(
          //             margin: EdgeInsets.only(top: 10),
          //             padding: EdgeInsets.all(8),
          //             child: Text(
          //               'API Locations',
          //               style: Theme.of(context).textTheme.headline4,
          //             ),
          //           ),
          //           Row(
          //             children: [
          //               Container(
          //                 width: 100,
          //                 child: Checkbox(
          //                     value: _port,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _port = !_port;
          //                       });
          //                     }),
          //               ),
          //               Container(
          //                 width: 300,
          //                 child: TextFormField(
          //                   decoration: InputDecoration(labelText: 'Current'),
          //                   // Assigns the button on the popup keyboard
          //                   textInputAction: TextInputAction.next,
          //                   // Tells what type of keyboard you want
          //                   keyboardType: TextInputType.number,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Container(
          //                 width: 100,
          //                 child: Checkbox(
          //                     value: _port,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _port = !_port;
          //                       });
          //                     }),
          //               ),
          //               Container(
          //                 width: 300,
          //                 child: TextFormField(
          //                   decoration: InputDecoration(labelText: 'Forecast'),
          //                   // Assigns the button on the popup keyboard
          //                   textInputAction: TextInputAction.next,
          //                   // Tells what type of keyboard you want
          //                   keyboardType: TextInputType.number,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Container(
          //                 width: 100,
          //                 child: Checkbox(
          //                     value: _port,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _port = !_port;
          //                       });
          //                     }),
          //               ),
          //               Container(
          //                 width: 300,
          //                 child: TextFormField(
          //                   decoration: InputDecoration(labelText: 'Past'),
          //                   // Assigns the button on the popup keyboard
          //                   textInputAction: TextInputAction.next,
          //                   // Tells what type of keyboard you want
          //                   keyboardType: TextInputType.number,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Container(
          //                 width: 100,
          //                 child: Checkbox(
          //                     value: _port,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _port = !_port;
          //                       });
          //                     }),
          //               ),
          //               Container(
          //                 width: 300,
          //                 child: TextFormField(
          //                   decoration: InputDecoration(labelText: 'Indoor'),
          //                   // Assigns the button on the popup keyboard
          //                   textInputAction: TextInputAction.next,
          //                   // Tells what type of keyboard you want
          //                   keyboardType: TextInputType.number,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
