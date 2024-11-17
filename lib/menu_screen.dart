import 'package:flutter/material.dart';
import 'grid_view_screen.dart';
import 'grid_view_data_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Grid View'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridViewScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Grid View Data'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridViewDataScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
