class Flashcard {
  String id;
  String topicId; // ID of the topic the flashcard belongs to
  String question;
  String answer;

  Flashcard({
    required this.id,
    required this.topicId,
    required this.question,
    required this.answer,
  });

  // Convert a Flashcard into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topicId': topicId,
      'question': question,
      'answer': answer,
    };
  }

  // Create a Flashcard from a Map.
  factory Flashcard.fromMap(Map<String, dynamic> map) {
    return Flashcard(
      id: map['id'],
      topicId: map['topicId'],
      question: map['question'],
      answer: map['answer'],
    );
  }
}
