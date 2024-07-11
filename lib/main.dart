import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'application/providers.dart';
import 'application/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: setupProviders(context),
      child: MaterialApp(
        title: 'BKC SUPER BRANCH',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          final routes = setupRoutes(context);
          WidgetBuilder? builder = routes[settings.name];
          return MaterialPageRoute(
            builder: (ctx) => builder!(ctx),
            settings: settings,
          );
        },
      ),
    );
  }
}
