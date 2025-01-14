import 'package:app_gemin_ai/global/router/app_router.dart';
import 'package:app_gemin_ai/singleton/theme/theme.dart';
import 'package:app_gemin_ai/singleton/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'App Gemini AI',
      theme: lightMode,
      darkTheme: darkMode,
      // themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}