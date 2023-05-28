import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_with_provider/presentation/home/tasks/task_provider.dart';
import 'package:to_do_app_with_provider/theme/dark_theme.dart';
import 'package:to_do_app_with_provider/theme/light_theme.dart';
import 'presentation/home/home_page.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        // statusBarBrightness: Brightness.light,
        // statusBarIconBrightness: Brightness.dark
      ));
  runApp(ChangeNotifierProvider(
    create: (context) => TaskProvider(),
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}
