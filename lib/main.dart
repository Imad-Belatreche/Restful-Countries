import 'package:countries_restful/views/home_view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Restful Countries",
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  );
}
