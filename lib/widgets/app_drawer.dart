import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final themeProv = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(auth.userEmail ?? 'Guest'),
              accountEmail: Text(auth.userEmail ?? 'Belum login'),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () {
                Navigator.of(context).pushNamed('/contact');
              },
            ),
            Divider(),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: themeProv.isDark,
              onChanged: (v) => themeProv.toggleTheme(v),
              secondary: Icon(themeProv.isDark ? Icons.dark_mode : Icons.light_mode),
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text(auth.isLoggedIn ? 'Logout' : 'Login / Register'),
              onTap: () async {
                if (auth.isLoggedIn) {
                  Navigator.of(context).pushReplacementNamed('/login');
                } else {
                  Navigator.of(context).pushReplacementNamed('/login');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
