import 'package:hacker_news/model/comment.dart';

class CommentViewModel {
  final Comment _comment;

  CommentViewModel({required Comment comment}) : this._comment = comment;

  String get title {
    return this._comment.title ?? "";
  }

  String get commentId {
    return this._comment.id ?? "";
  }
}
