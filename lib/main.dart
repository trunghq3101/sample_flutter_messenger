import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_flutter_messenger/di/module_container.dart';
import 'package:sample_flutter_messenger/routes/home_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("app_settings");
  runApp(MyApp());
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ModuleContainer().initialize();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.spaceMonoTextTheme(textTheme).copyWith(
            headline1: GoogleFonts.spaceMono(
                fontWeight: FontWeight.normal,
                fontSize: 36,
                color: Colors.black),
            headline2: GoogleFonts.spaceMono(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
            headline3: GoogleFonts.spaceMono(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black)),
        primaryColorBrightness: Brightness.light,
        primaryColor: Colors.black,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 0.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeRoute(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}
