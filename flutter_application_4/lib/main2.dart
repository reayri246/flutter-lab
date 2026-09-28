import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Validation Example',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Validation'),
        ),
        body: RegistrationForm(),
      ),
    );
  }
}

// Registration Form
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() =>
      _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _phoneController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  // Submit Form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form Submitted Successfully!'),
        ),
      );

      print("Name: ${_nameController.text}");
      print("Email: ${_emailController.text}");
      print("Phone: ${_phoneController.text}");
      print("Password: ${_passwordController.text}");
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: Form(
        key: _formKey,

        child: ListView(
          children: [

            // Name
            TextFormField(
              controller: _nameController,

              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Email
            TextFormField(
              controller: _emailController,

              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),

              keyboardType: TextInputType.emailAddress,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }

                if (!RegExp(
                  r'^[^@]+@[^@]+\.[^@]+',
                ).hasMatch(value)) {
                  return 'Please enter a valid email';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Phone Number
            TextFormField(
              controller: _phoneController,

              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),

              keyboardType: TextInputType.phone,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }

                if (!RegExp(
                  r'^\d{10}$',
                ).hasMatch(value)) {
                  return 'Enter a valid 10-digit phone number';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Password
            TextFormField(
              controller: _passwordController,

              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),

              obscureText: true,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _submitForm,

              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}