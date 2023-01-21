import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/post_model.dart';
import 'package:flutter_application_1/202/service/post_service.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  //late final Dio _dio;
  final _basUrl = 'https://jsonplaceholder.typicode.com/';
  late final IPostService postService;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    //_dio = Dio(BaseOptions(baseUrl: _basUrl));
    postService = PostService();
  }

  Future<void> addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await postService.addItemToService(postModel);
    if (response == true) {
      name = 'Basarili';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: Column(children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: 'Title'),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        TextField(
          controller: _bodyController,
          decoration: const InputDecoration(labelText: 'Body'),
        ),
        TextField(
          controller: _userIdController,
          keyboardType: TextInputType.number,
          inputFormatters: const [],
          autofillHints: const [AutofillHints.creditCardNumber],
          decoration: const InputDecoration(labelText: 'UserId'),
        ),
        TextButton(
            onPressed: _isLoading
                ? null
                : (() {
                    if (_titleController.text.isNotEmpty &&
                        _bodyController.text.isNotEmpty &&
                        _userIdController.text.isNotEmpty) {
                      final model = PostModel(
                          body: _bodyController.text,
                          title: _titleController.text,
                          userId: int.tryParse(_userIdController.text));
                      addItemToService(model);
                    }
                  }),
            child: const Text('Send'))
      ]),
    );
  }
}




//eski yapımız

  // Future<void> _addItemToService(PostModel postModel) async {
  //   _changeLoading();
  //   final response = await _dio.post('post', data: postModel);

  //   if (response.statusCode == HttpStatus.created) {
  //     name = 'Basarili';
  //   }
  //   _changeLoading();
  // }


//yeni yapımız

  //   Future<void> addItemToService(PostModel postModel) async {
  //   _changeLoading();
  //   final response = await postService.addItemToService(postModel);
  //   if (response == true) {
  //     name = 'Basarili';
  //   }
  //   _changeLoading();
  // }