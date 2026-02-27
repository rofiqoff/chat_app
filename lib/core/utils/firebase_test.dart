import 'package:firebase_core/firebase_core.dart';

Future<bool> testFirebaseInitialization() async {
  try {
    final app = Firebase.app();
    print('Firebase initialized successfully: ${app.name}');
    print('App Name: ${app.name}');
    print('Project ID: ${app.options.projectId}');
    return true;
  } catch (e) {
    print('Error initializing Firebase: $e');
    return false;
  }
}
