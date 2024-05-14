import 'package:flutter/material.dart';
import 'package:project_praq/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color.fromARGB(255, 236, 162, 36),
              selectedItemColor: Colors.white,
              unselectedItemColor: Color.fromARGB(255, 90, 6, 104)),
          useMaterial3: true,
          scaffoldBackgroundColor: Color.fromARGB(255, 90, 6, 104),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 236, 162, 36)),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 236, 162, 36)),
          dividerTheme: DividerThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
          listTileTheme: ListTileThemeData(
              iconColor: Colors.white, textColor: Colors.white)),
      home: HomePage(),
    );
  }
}
