import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Example'),
        ),
        body: FormScreen(),
      ),
    );
  }
}

// Form Screen
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _phoneController =
      TextEditingController();

  final TextEditingController _dateController =
      TextEditingController();

  // Gender
  String _selectedGender = 'Male';

  final List<String> _genders = [
    'Male',
    'Female',
    'Other',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  // Select Date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // Submit Form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Name: ${_nameController.text}");
      print("Email: ${_emailController.text}");
      print("Phone: ${_phoneController.text}");
      print("Date of Birth: ${_dateController.text}");
      print("Gender: $_selectedGender");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form Submitted Successfully!'),
        ),
      );
    }
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

            // Phone
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

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Date of Birth
            TextFormField(
              controller: _dateController,

              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),

              readOnly: true,

              onTap: () {
                _selectDate(context);
              },

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your date of birth';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            // Gender
            DropdownButtonFormField<String>(
              initialValue: _selectedGender,

              items: _genders.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),

              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },

              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

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