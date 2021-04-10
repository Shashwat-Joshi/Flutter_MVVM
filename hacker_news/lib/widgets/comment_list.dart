import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/comment_view_model.dart';
import 'package:html_unescape/html_unescape.dart';

class CommentList extends StatelessWidget {
  final List<CommentViewModel> comments;
  final unescape = HtmlUnescape();

  CommentList({required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Column(
          children: [
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  "${index + 1}",
                ),
              ),
              title: Text(unescape.convert(comment.title)),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
