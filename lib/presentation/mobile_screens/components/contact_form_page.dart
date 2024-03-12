import 'package:flutter/material.dart';

import '../../../services/dio_service.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Me"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == "" || value == null) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              TextFormField(
                controller: _emailController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == "" || value == null) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@') ||
                      !value.contains('.') ||
                      value.length < 5) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              TextFormField(
                controller: _subjectController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == "" || value == null) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              TextFormField(
                controller: _messageController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == "" || value == null) {
                    return 'Please enter your message';
                  }
                  return null;
                },
                maxLines: 5,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    debugPrint('Name: ${_nameController.text}');
                    debugPrint('Email: ${_emailController.text}');
                    debugPrint('Subject: ${_subjectController.text}');
                    debugPrint('Message: ${_messageController.text}');
                    final data = {
                      'name': _nameController.text,
                      'email': _emailController.text,
                      'subject': _subjectController.text,
                      'message': _messageController.text,
                    };
                    DioService().post('https://formspree.io/f/xjvnopwd', data);
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
