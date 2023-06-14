// @dart=2.9
import 'package:flutter/material.dart';
import 'meu_aplicativo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  await DotEnv.load(fileName: '.env');
  runApp(const Tempo());
}
