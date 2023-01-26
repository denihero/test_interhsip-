import 'package:flutter/material.dart';
import 'package:test_project_intership/service_locator.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}


