import 'package:flutter/material.dart';
import 'package:fivegen/home.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _emailFocused = false;
  bool _passwordFocused = false;

  void _loginUser() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email != 'gencare@example.com') {
      // ignore: use_build_context_synchronously
      _formKey.currentState!.validate();
    } else if (password != 'password') {
      _formKey.currentState!.validate();
    } else if (email == 'gencare@example.com' && password == 'password') {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    } else if (value != 'gencare@example.com') {
      return 'Please enter a valid username';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }
    if (value != 'password') {
      return 'Incorrect Password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500, // Set initial width
          height: 500,
          child: Card(
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20.0), // Set border radius here
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _emailFocused
                                      ? Colors.blue
                                      : const Color.fromARGB(255, 211, 190, 6)),
                            ),
                            suffixIcon:
                                const Icon(Icons.person), // Add icon here
                          ),
                          validator: _validateEmail,
                          onChanged: (_) {
                            setState(() {
                              _emailFocused = true;
                              _passwordFocused = false;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _passwordFocused
                                      ? const Color.fromARGB(255, 211, 190, 6)
                                      : const Color.fromARGB(255, 211, 190, 6)),
                            ),
                            suffixIcon: const Icon(Icons.lock), // Add icon here
                          ),
                          validator: _validatePassword,
                          onChanged: (_) {
                            setState(() {
                              _passwordFocused = true;
                              _emailFocused = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loginUser,
                    child: const Text('Login'),
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
