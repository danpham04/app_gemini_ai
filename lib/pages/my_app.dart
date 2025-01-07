import 'package:app_gemin_ai/global/app_router.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Gemini AI',
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}