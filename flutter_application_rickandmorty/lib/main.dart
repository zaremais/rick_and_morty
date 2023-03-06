import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/internal/application.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');
  runApp(const MyApp());
}

