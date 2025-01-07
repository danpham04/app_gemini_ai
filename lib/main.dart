import 'package:app_gemin_ai/pages/my_app.dart';
import 'package:app_gemin_ai/provider/provider_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProviderAuth(),)
  ], child: const MyApp()));
}
