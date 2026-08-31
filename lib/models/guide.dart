class GuideStep {
  final String title;
  final String content;

  GuideStep({required this.title, required this.content});
}

class Guide {
  final String id;
  final String title;
  final List<GuideStep> steps;

  Guide({required this.id, required this.title, required this.steps});
}