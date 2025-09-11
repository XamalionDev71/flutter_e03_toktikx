import 'package:flutter/material.dart';
import 'package:flutter_e03_toktik/domain/entities/video_post.dart';
import 'package:flutter_e03_toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:flutter_e03_toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //video+gradientes
            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption
              ),
            ),
            //Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost
            ))
          ],
        );
      },
    );
  }
}
