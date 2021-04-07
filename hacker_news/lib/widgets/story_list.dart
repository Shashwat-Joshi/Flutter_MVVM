import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

class StoryList extends StatelessWidget {
  final List<StoryViewModel> stories;
  final Function onSelected;

  StoryList({required this.stories, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.stories.length,
      itemBuilder: (context, index) {
        final story = this.stories[index];
        return Column(
          children: [
            ListTile(
              onTap: () {
                this.onSelected(story);
              },
              title: Text(story.title),
              trailing: Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green,
                ),
                child: Text(
                  story.commentNumbers.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
