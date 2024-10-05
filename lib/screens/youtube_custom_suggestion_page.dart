

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../providers/video_provider.dart';

class YouTubeCustomSuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Promilo - Task'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: videoProvider.controller,
            showVideoProgressIndicator: true,
          ),
          SizedBox(height: 20),
          if (videoProvider.showSuggestions) ...[
            Text(
              'Suggested Videos:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: videoProvider
                  .videos[videoProvider.currentIndex].suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = videoProvider
                    .videos[videoProvider.currentIndex].suggestions[index];
                return ListTile(
                  leading: Image.network(
                    YoutubePlayer.getThumbnail(videoId: suggestion.id),
                  ),
                  title: Text(suggestion.title),
                  trailing: Icon(Icons.play_arrow),
                  onTap: () {
                    videoProvider.playSuggestedVideo(suggestion.id);
                  },
                );
              },
            ),
          ] else ...[
            // Main video list when no suggestions are shown
            Expanded(
              child: ListView.builder(
                itemCount: videoProvider.videos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      YoutubePlayer.getThumbnail(
                          videoId: videoProvider.videos[index].id),
                    ),
                    title: Text(videoProvider.videos[index].title),
                    trailing: Icon(Icons.play_arrow),
                    onTap: () {
                      videoProvider.playVideo(index);
                    },
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
