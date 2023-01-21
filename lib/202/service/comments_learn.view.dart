import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/comment_model.dart';
import 'package:flutter_application_1/202/service/post_service.dart';

class CommentslearnView extends StatefulWidget {
  const CommentslearnView({super.key, required this.postId});
  final int? postId;

  @override
  State<CommentslearnView> createState() => _CommentslearnViewState();
}

class _CommentslearnViewState extends State<CommentslearnView> {
  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentsItem;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithId(int postId) async {
    _changeLoading();
    _commentsItem = await postService.fetchRelatedCommentsWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _commentsItem?.length ?? 0,
          itemBuilder: ((context, index) {
            return Card(
              child: Text(_commentsItem?[index].email ?? ''),
            );
          })),
    );
  }
}
