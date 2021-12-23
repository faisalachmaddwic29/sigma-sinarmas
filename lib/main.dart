import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sinarmas/di/serivce_locator.dart';
import 'package:sinarmas/presenter/ui/initial/initial_page.dart';

import 'bloc_observer.dart';

void main() {
  setupLocator();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: SinarmasColors.primary,
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     onPrimary: Colors.white,
        //     onSurface: SinarmasColors.primary,
        //     primary: SinarmasColors.primary,
        //   ),
        // ),
        primarySwatch: Colors.red,
      ),
      home: const InitialPage(),
    );
  }
}
