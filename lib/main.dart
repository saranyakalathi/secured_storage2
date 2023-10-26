import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Secure Storage Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Store a secure key-value pair
                  await storage.write(key: 'myKey', value: 'mySecretValue');
                  print('text stored');
                },
                child: Text('Store Secure Data'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Retrieve secure data
                  String? value = await storage.read(key: 'myKey');
                  print(value);
                },
                child: Text('Retrieve Secure Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}