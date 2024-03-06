import '../models/flashcard.dart';

class StorageService {
  // static final Map<String, List<Flashcard>> _flashcardsByTopicId = {};
  // Dummy data start
  static final Map<String, List<Flashcard>> _flashcardsByTopicId = {
    '1': [
      Flashcard(
        id: '1-1',
        topicId: '1',
        question: 'Who is known as the father of Western philosophy?',
        answer:
            'Socrates is often credited as one of the founders of Western philosophy.',
      ),
      Flashcard(
        id: '1-2',
        topicId: '1',
        question: 'What is Plato\'s most famous work?',
        answer:
            'The Republic is Plato\'s best-known work, which details a philosophically governed society.',
      ),
    ],
    '2': [
      Flashcard(
        id: '2-1',
        topicId: '2',
        question: 'What is an algorithm?',
        answer:
            'An algorithm is a set of instructions designed to perform a specific task.',
      ),
      Flashcard(
        id: '2-2',
        topicId: '2',
        question: 'What is polymorphism in programming?',
        answer:
            'Polymorphism is the ability of an object to take on many forms, typically by means of inheritance and interfaces.',
      ),
    ],
  };
  // Dummy data end

  // Loads flashcards for a given topic ID
  static List<Flashcard> getFlashcardsByTopicId(String topicId) {
    return _flashcardsByTopicId[topicId] ?? [];
  }

  // Adds a flashcard to a topic
  static void addFlashcard(String topicId, Flashcard flashcard) {
    if (!_flashcardsByTopicId.containsKey(topicId)) {
      _flashcardsByTopicId[topicId] = [];
    }
    _flashcardsByTopicId[topicId]!.add(flashcard);
  }

  // Removes a flashcard by ID
  static void removeFlashcard(String topicId, String flashcardId) {
    _flashcardsByTopicId[topicId]
        ?.removeWhere((flashcard) => flashcard.id == flashcardId);
  }

  // Updates a flashcard
  static void updateFlashcard(String topicId, Flashcard updatedFlashcard) {
    if (_flashcardsByTopicId.containsKey(topicId)) {
      final index = _flashcardsByTopicId[topicId]!
          .indexWhere((flashcard) => flashcard.id == updatedFlashcard.id);
      if (index != -1) {
        _flashcardsByTopicId[topicId]![index] = updatedFlashcard;
      }
    }
  }
}
