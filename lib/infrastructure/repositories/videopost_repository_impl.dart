import 'package:flutter_e03_toktik/domain/datasource/videoposts_datasource.dart';
import 'package:flutter_e03_toktik/domain/entities/video_post.dart';
import 'package:flutter_e03_toktik/domain/repositories/videoposts_repository';

class VideopostRepositoryImpl implements VideoPostsRepository {
  final VideoPostsDataSource videoPostsDataSource;

  VideopostRepositoryImpl({required this.videoPostsDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideoByPage(int page) {
    return videoPostsDataSource.getTrendingVideoByPage(page);
  }
}
