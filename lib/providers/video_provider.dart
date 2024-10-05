


import 'package:flutter/foundation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/video_model.dart';

class VideoProvider extends ChangeNotifier {
  List<VideoModel> _videos = [
    VideoModel(
    id: '3AtDnEC4zak',
    title: 'Charlie Puth - We Don\'t Talk Anymore',
    suggestions: [
      VideoSuggestion(id: 'dQw4w9WgXcQ', title: 'Rick Astley - Never Gonna Give You Up'),
      VideoSuggestion(id: 'hY7m5jjJ9mM', title: 'Maru the Cat'),
    ],
  ),
  VideoModel(
    id: 'RgKAFK5djSk',
    title: 'Wiz Khalifa - See You Again ft. Charlie Puth',
    suggestions: [
      VideoSuggestion(id: 'kxopViU98Xo', title: 'Epic Sax Guy'),
      VideoSuggestion(id: 'l5-gja10qkw', title: 'Penguin Dance'),
    ],
  ),
  VideoModel(
    id: 'hY7m5jjJ9mM',
    title: 'Maru the Cat',
    suggestions: [
      VideoSuggestion(id: 'CevxZvSJLk8', title: 'Katy Perry - Roar'),
      VideoSuggestion(id: 'E8gmARGvPlI', title: 'Wham! - Last Christmas'),
    ],
  ),
  VideoModel(
    id: 'CevxZvSJLk8',
    title: 'Katy Perry - Roar',
    suggestions: [
      VideoSuggestion(id: '3JZ_D3ELwOQ', title: 'Adele - Rolling in the Deep'),
      VideoSuggestion(id: 'OPf0YbXqDm0', title: 'Mark Ronson - Uptown Funk ft. Bruno Mars'),
    ],
  ),
  VideoModel(
    id: 'dQw4w9WgXcQ',
    title: 'Rick Astley - Never Gonna Give You Up',
    suggestions: [
      VideoSuggestion(id: '9bZkp7q19f0', title: 'PSY - Gangnam Style'),
      VideoSuggestion(id: 'YQHsXMglC9A', title: 'Adele - Hello'),
    ],
  ),
  VideoModel(
    id: 'OPf0YbXqDm0',
    title: 'Mark Ronson - Uptown Funk ft. Bruno Mars',
    suggestions: [
      VideoSuggestion(id: 'ktvTqknDobU', title: 'Imagine Dragons - Radioactive'),
      VideoSuggestion(id: '9bZkp7q19f0', title: 'PSY - Gangnam Style'),
    ],
  ),
  VideoModel(
    id: 'ktvTqknDobU',
    title: 'Imagine Dragons - Radioactive',
    suggestions: [
      VideoSuggestion(id: '2vjPBrBU-TM', title: 'Sia - Chandelier'),
      VideoSuggestion(id: 'fRh_vgS2dFE', title: 'Justin Bieber - Sorry'),
    ],
  ),
  VideoModel(
    id: '2vjPBrBU-TM',
    title: 'Sia - Chandelier',
    suggestions: [
      VideoSuggestion(id: 'SlPhMPnQ58k', title: 'Dua Lipa - Don\'t Start Now'),
      VideoSuggestion(id: 'CevxZvSJLk8', title: 'Katy Perry - Roar'),
    ],
  ),
  VideoModel(
    id: 'YQHsXMglC9A',
    title: 'Adele - Hello',
    suggestions: [
      VideoSuggestion(id: 'hY7m5jjJ9mM', title: 'Maru the Cat'),
      VideoSuggestion(id: '3JZ_D3ELwOQ', title: 'Adele - Rolling in the Deep'),
    ],
  ),
    
  ];

  late YoutubePlayerController _controller;
  bool _showSuggestions = false;
  int _currentIndex = 0;

  List<VideoModel> get videos => _videos;
  bool get showSuggestions => _showSuggestions;
  YoutubePlayerController get controller => _controller;
  int get currentIndex => _currentIndex;

  VideoProvider() {
    _initializeController(_videos[_currentIndex].id);
  }

  void _initializeController(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    )..addListener(_videoListener);
  }

  void _videoListener() {
    if (_controller.value.playerState == PlayerState.ended) {
      _showSuggestions = true;
      notifyListeners();
    }
  }

  void playSuggestedVideo(String videoId) {
    _controller.load(videoId);
    _showSuggestions = false;
    notifyListeners();
  }

  void playVideo(int index) {
    _currentIndex = index;
    _controller.load(_videos[_currentIndex].id);
    _showSuggestions = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
