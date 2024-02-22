import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(
     const ProviderScope(
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Quiz(),
           ),
     ),
  );
}
