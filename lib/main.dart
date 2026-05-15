import 'package:flutter/material.dart';
import 'package:uni_forums/data.dart';
import 'package:uni_forums/replies_page.dart';
import 'package:uni_forums/utility.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepOrange)),
      home: const ForumsHome(title: 'FAST NUCES Forums'),
    );
  }
}

class ForumsHome extends StatelessWidget {
  const ForumsHome({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.deepOrange,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Start new topic',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Topics',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.only(top: 12.0)
                          : EdgeInsets.zero,
                      child: ListTile(
                        leading: topics[index].isNew
                            ? CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.deepOrange,
                              )
                            : Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.deepOrange.shade100,
                              ),
                        trailing: Column(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.grey.shade200,
                              child: ClipOval(
                                child: Image.network(
                                  topics[index].replies.last.avatarUrl,
                                  width: 26,
                                  height: 26,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.person, size: 16, color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              formatDaysPassed(
                                topics[index].replies.last.replyDate,
                              ),
                              style: TextStyle(fontSize: 9, color: Colors.grey),
                            ),
                          ],
                        ),
                        title: Text(
                          topics[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "By ${topics[index].originalPoster}, ${formatDate(topics[index].creationDate)} \n${topics[index].replies.length - 1} REPLIES",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RepliesPage(
                                title: title,
                                topic: topics[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Prepared as sample for assignment 2')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
