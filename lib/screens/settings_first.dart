import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class SettingsFirst extends StatefulWidget {
  @override
  _SettingsFirstState createState() => _SettingsFirstState();
}

class _SettingsFirstState extends State<SettingsFirst> {
  final _baseurlController = TextEditingController();
  final _portController = TextEditingController();
  final _currentController = TextEditingController(text: 'current');
  final _forecastController = TextEditingController(text: 'forecast');
  final _pastController = TextEditingController(text: 'past');
  final _indoorController = TextEditingController(text: 'indoor');

  void saveEach(int id, String setting) {
    // Save for each field save
    if (setting.isEmpty) {
      return;
    }
    Provider.of<SettingProvider>(context, listen: false)
        .addSettings(id, setting);
    print(setting);
  }

  @override
  void dispose() {
    _baseurlController.dispose();
    _portController.dispose();
    _currentController.dispose();
    _forecastController.dispose();
    _pastController.dispose();
    _indoorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ver = Provider.of<SettingProvider>(context).version;
    return Scaffold(
      appBar: AppBar(
        title: Text('First Run Setup'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Weather Kiosk $ver'),
          ),
        ],
      ),
      body: Consumer<SettingProvider>(
        builder: (ctx, payload, _) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'API Base URL',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                // BaseUrl
                TextFormField(
                  controller: _baseurlController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.teal,
                  ),
                  decoration: InputDecoration(
                    labelText: "Base URL",
                    labelStyle: TextStyle(color: Colors.white60),
                    hintText: 'ip of computer running the backend',
                    hintStyle: TextStyle(color: Colors.white30),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                //port
                TextFormField(
                  controller: _portController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.teal, //Font color change
                  ),
                  decoration: InputDecoration(
                    labelText: "Port",
                    labelStyle: TextStyle(color: Colors.white60),
                    hintText: 'port of the server. common: 5000',
                    hintStyle: TextStyle(color: Colors.white30),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Category\'s URL',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                //current
                TextFormField(
                  controller: _currentController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.teal, //Font color change
                  ),
                  decoration: InputDecoration(
                    labelText: "Current URL",
                    labelStyle: TextStyle(color: Colors.white60),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                //forecast
                TextFormField(
                  controller: _forecastController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.teal, //Font color change
                  ),
                  decoration: InputDecoration(
                    labelText: "Forecast URL",
                    labelStyle: TextStyle(color: Colors.white60),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                // past
                TextFormField(
                  controller: _pastController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.teal, //Font color change
                  ),
                  decoration: InputDecoration(
                    labelText: "Past URL",
                    labelStyle: TextStyle(color: Colors.white60),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                //Indoor
                TextFormField(
                  controller: _indoorController,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.teal, //Font color change
                  ),
                  decoration: InputDecoration(
                    labelText: "Indoor URL",
                    labelStyle: TextStyle(color: Colors.white60),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.teal, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {
                    saveEach(1, _baseurlController.text);
                    saveEach(2, _portController.text);
                    saveEach(3, _currentController.text);
                    saveEach(4, _forecastController.text);
                    saveEach(5, _pastController.text);
                    saveEach(6, _indoorController.text);
                  },
                  textColor: Colors.white54,
                  color: Colors.teal,
                  icon: Icon(Icons.save),
                  label: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
