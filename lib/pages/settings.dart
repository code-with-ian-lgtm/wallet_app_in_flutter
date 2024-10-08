import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),

      body: ListView(
        children: [
          //settings
          ListTile(
            title: Text('Dark Mode'),
            leading: const Icon(Icons.dark_mode),
            trailing: Consumer<ThemeProvider>(builder: (context, ThemeProvider, value){
              return CupertinoSwitch(value: ThemeProvider.isDakMode, onChanged: (bool value){
                ThemeProvider.toggleTheme();
              });
            }),

          )
        ],
      ),
    );
  }
}