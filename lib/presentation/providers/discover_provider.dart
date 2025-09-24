import 'package:flutter/material.dart';
import 'package:flutter_e03_toktik/domain/entities/video_post.dart';
import 'package:flutter_e03_toktik/domain/repositories/videoposts_repository';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    // await Future.delayed(Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videosRepository.getTrendingVideoByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
