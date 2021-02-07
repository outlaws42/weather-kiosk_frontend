import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void intSetup() {
    // This will populate the database with default setup options
    Provider.of<SettingProvider>(context, listen: false)
        .addSettings(1, '192.168.1.3');
    Provider.of<SettingProvider>(context, listen: false).addSettings(2, '5000');
    Provider.of<SettingProvider>(context, listen: false)
        .addSettings(3, 'current');
    Provider.of<SettingProvider>(context, listen: false)
        .addSettings(4, 'forecast');
    Provider.of<SettingProvider>(context, listen: false).addSettings(5, 'past');
    Provider.of<SettingProvider>(context, listen: false)
        .addSettings(6, 'indoor');
  }

  void saveEach(int id, String setting) {
    // Save for each field save
    if (setting.isEmpty) {
      return;
    }
    Provider.of<SettingProvider>(context, listen: false)
        .addSettings(id, setting);
    print(setting);
  }

  // String baseUrl;
  // String port;
  // String currentUrl;
  // String forecastUrl;
  // String pastUrl;
  // String indoorUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: FutureBuilder(
        future: Provider.of<SettingProvider>(context, listen: false)
            .fetchSettings(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<SettingProvider>(
                child: Center(
                  // This is shown if the settings has no length
                  child: RaisedButton.icon(
                      onPressed: intSetup,
                      textColor: Colors.white54,
                      color: Colors.teal,
                      icon: Icon(Icons.save_rounded),
                      label: Text('Setup Default Settings')),
                ),
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
                                  // baseUrl = value;
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
                                  // port = value;
                                  saveEach(2, value);
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                  decorationColor:
                                      Colors.teal, //Font color change
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
                                  // currentUrl = value;
                                  saveEach(3, value);
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                  decorationColor:
                                      Colors.teal, //Font color change
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
                                  // forecastUrl = value;
                                  saveEach(4, value);
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                  decorationColor:
                                      Colors.teal, //Font color change
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
                                  // pastUrl = value;
                                  saveEach(5, value);
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                  decorationColor:
                                      Colors.teal, //Font color change
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
                                  // indoorUrl = value;
                                  saveEach(6, value);
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                  decorationColor:
                                      Colors.teal, //Font color change
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
      ),
    );
  }
}
