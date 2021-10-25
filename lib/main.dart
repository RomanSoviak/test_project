import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_project/theme.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      dark: kDarktheme,
      light: kLightTheme,
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => MaterialApp(
        theme: light,
        darkTheme: dark,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _clickCount = 0;



  @override
  Widget build(BuildContext context) {
    BlocBuilder<Bloc, BlocAState>(
        builder: (context, state) {
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () { },
            child: const Text('TextButton'),
          );


        },// return widget here based on BlocA's state
    );
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            S.of(context).app_bar_title,
            style: const TextStyle(
                color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            _clickCount++;
          }),
          backgroundColor:Colors.white,
        ),
        body: Container(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  S.of(context).main_title,
                  style: const TextStyle(color: Colors.white),
                )),
          ),
        ));
  }
}

class BlocA {
}

class BlocAState {
}



