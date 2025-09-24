import 'package:flutter_e03_toktik/domain/datasource/videoposts_datasource.dart';
import 'package:flutter_e03_toktik/domain/entities/video_post.dart';
import 'package:flutter_e03_toktik/infrastructure/models/local_video_model.dart';
import 'package:flutter_e03_toktik/shared/data/local_video_post.dart';

class LocalvideoDatasourceImpl implements VideoPostsDataSource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideoByPage(int page) async{
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video)=> LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}