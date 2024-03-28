import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kasmaal/model/question_model.dart';
import 'package:kasmaal/provider/game_provider.dart';
import 'package:kasmaal/router/app_route.dart';
import 'package:kasmaal/services/api_service.dart';
import 'package:kasmaal/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameProvider(),
        )
      ],
      child: MaterialApp(
        onGenerateRoute: onGenerateRoute,
        title: 'Flutter Demo',
        theme: AppTheme.themeData(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
