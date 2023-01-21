import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/comments_learn.view.dart';
import 'package:flutter_application_1/202/service/post_model.dart';
import 'package:flutter_application_1/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  //late final Dio _dio;
  //final _basUrl = 'https://jsonplaceholder.typicode.com/';

  //TEST EDILEBILIR KOD BASLADI
  late final IPostService _postService;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    //_dio = Dio(BaseOptions(baseUrl: _basUrl));
    _postService = PostService();
    fetchPostItemsAdvance();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentslearnView(postId: _model?.id),
          ));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}



//late final Dio _dio;
//final _basUrl = 'https://jsonplaceholder.typicode.com/';
//_dio = Dio(BaseOptions(baseUrl: _basUrl));

//bunları artık neden kullanmıyoruz çünkü baba biz post service 
//yazdık artık orada tek kullanımda alıyoruz.