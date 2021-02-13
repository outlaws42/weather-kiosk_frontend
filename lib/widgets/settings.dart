import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class Settings extends StatefulWidget {
  static const routeName = 'settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Consumer<SettingProvider>(
        builder: (ctx, payload, ch) => payload.settings.length < 5
            ? ch
            : SingleChildScrollView(
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
                        initialValue: payload.settings[0].setting,
                        onFieldSubmitted: (value) {
                          saveEach(1, value);
                        },
                        style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.teal,
                        ),
                        decoration: InputDecoration(
                          labelText: "Base URL",
                          labelStyle: TextStyle(color: Colors.white60),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.teal, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      //port
                      TextFormField(
                        initialValue: payload.settings[1].setting,
                        onFieldSubmitted: (value) {
                          saveEach(2, value);
                        },
                        style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.teal, //Font color change
                        ),
                        decoration: InputDecoration(
                          labelText: "Port",
                          labelStyle: TextStyle(color: Colors.white60),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.teal, width: 2.0),
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
                        initialValue: payload.settings[2].setting,
                        onFieldSubmitted: (value) {
                          saveEach(3, value);
                        },
                        style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.teal, //Font color change
                        ),
                        decoration: InputDecoration(
                          labelText: "Current URL",
                          labelStyle: TextStyle(color: Colors.white60),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.teal, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      //forecast
                      TextFormField(
                        initialValue: payload.settings[3].setting,
                        onFieldSubmitted: (value) {
                          saveEach(4, value);
                        },
                        style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.teal, //Font color change
                        ),
                        decoration: InputDecoration(
                          labelText: "Forecast URL",
                          labelStyle: TextStyle(color: Colors.white60),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.teal, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      // past
                      TextFormField(
                        initialValue: payload.settings[4].setting,
                        onFieldSubmitted: (value) {
                          saveEach(5, value);
                        },
                        style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.teal, //Font color change
                        ),
                        decoration: InputDecoration(
                          labelText: "Past URL",
                          labelStyle: TextStyle(color: Colors.white60),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.teal, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      //Indoor
                      TextFormField(
                        initialValue: payload.settings[5].setting,
                        onFieldSubmitted: (value) {
                          saveEach(6, value);
                        },
                        style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.teal, //Font color change
                        ),
                        decoration: InputDecoration(
                          labelText: "Indoor URL",
                          labelStyle: TextStyle(color: Colors.white60),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.teal, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      // ),
    );
  }
}
