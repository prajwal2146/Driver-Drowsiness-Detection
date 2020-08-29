import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:vivify/Map/app_state.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppState(),)
  ],
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivify',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
