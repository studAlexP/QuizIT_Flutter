import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quiz_it_flutter/presentation/screens/home/home_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            )
          )
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30)
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30)
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 4),
            borderRadius: BorderRadius.circular(30)
          )
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            side: const BorderSide(color: Colors.green, width: 2)
          )  
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          displayLarge: TextStyle(fontSize: 25, color: Colors.black),
          displayMedium: TextStyle(fontSize: 20, color: Colors.black),
          displaySmall: TextStyle(fontSize: 15, color: Colors.black)
        ),

        cardTheme: CardTheme(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.green, width: 3)),
        ),

        appBarTheme: const AppBarTheme(
          elevation: 3,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)
        ),

        toggleButtonsTheme: ToggleButtonsThemeData(
          constraints: const BoxConstraints(
            minWidth: 350,
            minHeight: 60,
            //maxHeight: 60,
            maxWidth: 350
          ),
          borderRadius: BorderRadius.circular(30)
        )

      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            )
          )
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30)
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30)
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 4),
            borderRadius: BorderRadius.circular(30)
          )
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            side: const BorderSide(color: Colors.green, width: 2)
          )  
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          displayLarge: TextStyle(fontSize: 25, color: Colors.white),
          displayMedium: TextStyle(fontSize: 20, color: Colors.white),
          displaySmall: TextStyle(fontSize: 15, color: Colors.white)
        ),

        cardTheme: CardTheme(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.green, width: 3)),
        ),

        appBarTheme: const AppBarTheme(
          elevation: 3,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)
        ),

        toggleButtonsTheme: ToggleButtonsThemeData(
          constraints: const BoxConstraints(
            minWidth: 350,
            minHeight: 60,
            //maxHeight: 60,
            maxWidth: 350
          ),
          borderRadius: BorderRadius.circular(30),
          borderColor: Colors.white
        )

      ),
      themeMode: ThemeMode.system,
      home: const HomePage()
    );
  }
}