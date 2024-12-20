
import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false; // Kontrol visibilitas password
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset('assets/images/img_login.png'),
                    const SizedBox(height: defaultPadding),
                    const Padding(
                      padding:  EdgeInsets.symmetric(vertical: defaultPadding),
                      child:  Text(
                        'Masuk',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: themeProvider.isDarkTheme ? white : black,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Alamat Email*',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                        floatingLabelStyle: TextStyle(color: themeProvider.isDarkTheme ? white : primaryColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(color: themeProvider.isDarkTheme ? white : primaryColor, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat email wajib diisi';
                        }
                        if (!value.contains('@')) {
                          return 'Masukkan alamat email yang valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      cursorColor: themeProvider.isDarkTheme ? white : black,
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Kata Sandi*',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                        floatingLabelStyle: TextStyle(color: themeProvider.isDarkTheme ? white : primaryColor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(color: themeProvider.isDarkTheme ? white : primaryColor, width: 2),
                        ),
                        suffixIcon: IconButton(
                          color: lightGrey,
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata sandi wajib diisi';
                        }
                        if (value.length < 8) {
                          return 'Kata sandi harus terdiri dari minimal 8 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size.fromHeight(42.0),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: lightGrey,
                        ),
                        onPressed: () {Navigator.pushNamed(context, '/register');}, 
                        child: const Text('Buat Akun Baru', style: TextStyle(fontSize: 16)),
                      ),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
