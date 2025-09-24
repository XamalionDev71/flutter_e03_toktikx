import 'package:flutter/material.dart';
import 'package:flutter_e03_toktik/config/theme/app_theme.dart';
import 'package:flutter_e03_toktik/infrastructure/datasource/localvideo_datasource_impl.dart';
import 'package:flutter_e03_toktik/infrastructure/repositories/videopost_repository_impl.dart';
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
    final videoPostRepository = VideopostRepositoryImpl(
      videoPostsDataSource: LocalvideoDatasourceImpl()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          //create: (_) => DiscoverProvider()..loadNextPage(),
          create: (_) => DiscoverProvider(
            videosRepository: videoPostRepository)..loadNextPage(),
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
