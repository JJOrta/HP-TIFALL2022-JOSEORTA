import 'package:flutter/material.dart';
import 'package:llunkei_test_app/common/widgets/bottom_bar.dart';
import 'package:llunkei_test_app/constants/global_variables.dart';
import 'package:llunkei_test_app/features/auth/services/auth_service.dart';
//import 'package:llunkei_test_app/features/home/screens/home_screen.dart';
import 'package:llunkei_test_app/providers/user_provider.dart';
import 'package:llunkei_test_app/router.dart';
import 'package:llunkei_test_app/features/auth/screens/auth_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Llunkei TestApp',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(
          settings), //The tool that allow us to transition between pages, will feed off router.dart file in lib folder.
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar() // ? const HomeScreen()
          : const AuthScreen(),
    );
  }
}
