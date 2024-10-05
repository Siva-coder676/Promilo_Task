
class VideoModel {
  final String id;
  final String title;
  final List<VideoSuggestion> suggestions;

  VideoModel({required this.id, required this.title, required this.suggestions});
}

class VideoSuggestion {
  final String id;
  final String title;

  VideoSuggestion({required this.id, required this.title});
}
