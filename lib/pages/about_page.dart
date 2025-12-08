import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Aplikasi contoh: Dark mode, Auth, Bottom Nav, Drawer.', textAlign: TextAlign.center,)
      )),
    );
  }
}
