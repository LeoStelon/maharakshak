import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './routers.dart';
import './providers/user.dart';
import './providers/symptoms.dart';
import './providers/hospitals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SymptomsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HospitalsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xff151a53),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff151a53),
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.grey[100],
          ),
          textTheme: TextTheme(
            //Aplied in Drawer Text's
            bodyText1: TextStyle(
              color: Color(0xff151a53),
              fontWeight: FontWeight.bold,
            ),
            //Applied on Hospital card and on Profile section
            bodyText2: TextStyle(
              color: Color(0xff151a53),
              fontWeight: FontWeight.bold,
            ),
          ),
          fontFamily: 'Monteserrat',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'mainscreen',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
