class Task {
  final String category;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> members;

  Task({
    required this.category,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.members,
  });
}
