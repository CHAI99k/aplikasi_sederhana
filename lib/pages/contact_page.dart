import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: Center(child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Kontak: contoh@domain.com', textAlign: TextAlign.center,)
      )),
    );
  }
}
