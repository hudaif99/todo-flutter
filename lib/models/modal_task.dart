class ModalTask{
  String title;
  String? description;

  ModalTask({required this.title, this.description});

  @override
  String toString() {
    return 'Task: {Title: $title, Description: $description}';
  }
}