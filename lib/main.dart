import 'package:flutter/material.dart';
import 'package:flutter_e03_toktik/config/theme/app_theme.dart';
import 'package:flutter_e03_toktik/presentation/providers/discover_provider.dart';
import 'package:flutter_e03_toktik/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_)=> DiscoverProvider()..loadNextPage()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}

