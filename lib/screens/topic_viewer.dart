import 'package:flutter/material.dart';
import 'flashcard_details.dart';
import '../models/topic.dart';

class TopicViewer extends StatefulWidget {
  const TopicViewer({Key? key}) : super(key: key);

  @override
  State<TopicViewer> createState() => _TopicViewerState();
}

class _TopicViewerState extends State<TopicViewer> {
  // Dummy data for topics.
  // TODO: Replace with real data from local storage
  final List<Topic> topics = [
    Topic(
        id: '1',
        title: 'Philosophy',
        description: 'Plato, Socrates, and Aristotle'),
    Topic(
        id: '2',
        title: 'Computer Sci.',
        description: 'Algorithms, data structures, and programming'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        backgroundColor: const Color.fromARGB(255, 255, 232, 194),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: const Color.fromARGB(255, 251, 251, 251)!,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlashcardDetails(
                        topicId: topic.id, topicTitle: topic.title),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      topic.description,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
