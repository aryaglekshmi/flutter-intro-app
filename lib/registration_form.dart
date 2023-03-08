import 'package:flutter/material.dart';
import 'database_helper.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    controller: _nameController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // will add 10 pixels
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // will add 10 pixels
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // will add 10 pixels
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final user = {
                          'name': _nameController.text,
                          'email': _emailController.text,
                          'password': _passwordController.text
                        };
                        await DatabaseHelper.insertUser(user);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('User registered successfully')),
                        );
                      }
                    },
                    child: const Text('Register'),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
