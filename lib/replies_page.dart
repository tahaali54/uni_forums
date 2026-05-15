import 'package:flutter/material.dart';
import 'package:uni_forums/data.dart';
import 'package:uni_forums/utility.dart';

class RepliesPage extends StatelessWidget {
  const RepliesPage({super.key, required this.title, required this.topic});

  final String title;
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: _buildList()),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> list = [
      SizedBox(height: 16),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topic.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 8),
              Divider(),
              Text(
                'By ${topic.originalPoster},',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                formatDate(topic.creationDate),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.deepOrange),
                ),
                onPressed: () {},
                child: Text(
                  'Reply to this topic',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      ...topic.replies.map((reply) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade200,
                    child: ClipOval(
                      child: Image.network(
                        reply.avatarUrl,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.person, size: 24, color: Colors.grey),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                  ),
                  title: Text(
                    reply.replier,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Posted ${formatDate(reply.replyDate)}',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    reply.content,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        label: Text('Quote'),
                        icon: Icon(Icons.add),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () {},
                        icon: Badge(
                          child: Icon(Icons.favorite),
                          isLabelVisible: true,
                          label: Text(reply.likes.toString()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      SizedBox(height: 16),
    ];

    return list;
  }
}
