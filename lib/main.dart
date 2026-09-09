import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami/core/models/hadeeth.dart';
import 'package:islami/core/models/sura.dart';
import 'package:islami/screens/home/home_screen.dart';
import 'package:islami/screens/home/tabs/hadeeth/hadeeth_screen.dart';
import 'package:islami/screens/home/tabs/quran/sura_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      FlutterNativeSplash.remove();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route: (_)=> HomeScreen(),
        SuraScreen.route: (context){
          var sura = ModalRoute.of(context)!.settings.arguments as Sura;
          return SuraScreen(sura: sura);
        },
        HadeethScreen.route :(context) {
          var hadeeth = ModalRoute.of(context)!.settings.arguments as Hadeeth;
          return HadeethScreen(hadeeth: hadeeth);
        }
        
      },
      initialRoute: HomeScreen.route,
    );
  }
}