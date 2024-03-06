import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import '../services/storage_service.dart';

class FlashcardDetails extends StatefulWidget {
  final String topicId;
  final String topicTitle;

  const FlashcardDetails(
      {Key? key, required this.topicId, required this.topicTitle})
      : super(key: key);

  @override
  FlashcardDetailsState createState() => FlashcardDetailsState();
}

class FlashcardDetailsState extends State<FlashcardDetails> {
  late List<Flashcard> flashcards;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    flashcards = StorageService.getFlashcardsByTopicId(widget.topicId);
  }

  void goToPrevious() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void goToNext() {
    if (currentIndex < flashcards.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // topic title
        title: Text(widget.topicTitle),
        backgroundColor: const Color.fromARGB(255, 255, 232, 194),
      ),
      body: Center(
        child: flashcards.isEmpty
            ? const Text('No flashcards available')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlashcardView(
                    question: flashcards[currentIndex].question,
                    answer: flashcards[currentIndex].answer,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: goToPrevious,
                      ),
                      Text('${currentIndex + 1} / ${flashcards.length}'),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: goToNext,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class FlashcardView extends StatelessWidget {
  final String question;
  final String answer;

  const FlashcardView({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Text(
              question,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          elevation: 2,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
