import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/202/service/comment_model.dart';
import 'package:flutter_application_1/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(PostModel postModel, int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_PostServicePaths.posts.name, data: postModel);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioerror(error, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioerror(error, this);
    }
    return null;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id', data: postModel);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioerror(error, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.delete('${_PostServicePaths.posts.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioerror(error, this);
    }
    return false;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response =
          await _dio.get(_PostServicePaths.comments.name, queryParameters: {_PostQueryPaths.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioerror(error, this);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }

enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioerror<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}






//dio latesiz aktif etme


//  if (response.statusCode == HttpStatus.ok) {
//         final datas = response.data;
//         if (datas is List) {
//           return datas.map((e) => PostModel.fromJson(e)).toList();
//         }

//bu kod da gelen datay?? datas ald??m. datas. yazarsam normal
//list ??zelliklerini g??remezsin.if yaz??p datas is List yazarsan
//art??k ifin i??inde listin t??m ??zelliklerini kullanabilirsin
//bu sayede datan??n generic olarak ne oldu??unu anlam???? olurum
//datas list ya ??imdi biz bunu mapleriz
//maplemek ne demek maplemek asl??nda yeni bir obje listesi olu??turmak demek