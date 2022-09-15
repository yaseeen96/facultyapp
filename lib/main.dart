//pre-defined imports
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiredash/wiredash.dart';

//user-defined imports
import './views/login/login_page.dart';
import './views/signup/signup_page.dart';
import './views/user/user_page.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(),
    primaryColor: const Color(0xFF141877),
    highlightColor: Colors.white,
    canvasColor: Colors.black,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(),
    primaryColor: Color(0xFFbdc1c6),
    highlightColor: Color(0xFF000000),
    canvasColor: Colors.black,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");

  print(token);

  runApp(
    MyApp(token: token),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.token});
  final String? token;
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'bluechip-student-51yhw6u',
      secret: 'kgRbDoRimkxxOGA5ZFpKi8hloqlrFWT7',
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          themeMode: ThemeMode.system,
          home: token == null ? LoginPage() : UserPage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeClass.lightTheme,
          darkTheme: ThemeClass.darkTheme,
          // home: HomePage(),
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            // '/': (context) => const HomePage(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/login': (context) => const LoginPage(),
            '/signup': (context) => SignupPage(),
            '/user': (context) => UserPage(),
          },
        ),
      ),
    );
  }
}
