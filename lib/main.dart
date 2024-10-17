import 'package:flutter/material.dart';
import 'package:outcode/app/app.dart';
import 'package:outcode/inject_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const App());
}
