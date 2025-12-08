import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/custom_button.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  bool _loading = false, _obscure = true;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Silakan login', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 12),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (v) => _email = v?.trim() ?? '',
                        validator: (v) => v != null && v.contains('@')
                            ? null
                            : 'Masukkan email valid',
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () =>
                                setState(() => _obscure = !_obscure),
                          ),
                        ),
                        obscureText: _obscure,
                        onSaved: (v) => _password = v ?? '',
                        validator: (v) => (v != null && v.length >= 4)
                            ? null
                            : 'Password min 4 karakter',
                      ),
                      SizedBox(height: 16),
                      _loading
                          ? CircularProgressIndicator()
                          : CustomButton(
                              text: 'Login',
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) return;
                                _formKey.currentState!.save();
                                setState(() => _loading = true);
                                setState(() => _loading = true);
                                final ok = await auth.register( _email,_password, );
                                setState(() => _loading = false);
                                if (ok) {
                                  // register sukses     {
                                  Navigator.of(
                                    context,
                                  ).pushReplacementNamed('/home');
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text('Gagal'),
                                      content: Text(
                                        'Email atau password salah / belum terdaftar.',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                      SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => RegisterPage()),
                          );
                        },
                        child: Text('Belum punya akun? Daftar di sini'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
