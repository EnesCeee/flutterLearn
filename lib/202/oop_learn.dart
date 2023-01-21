import 'dart:io';
import 'package:flutter_application_1/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(Uri path) async {
    await launchUrl(path);
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');
    return true;
  }
  
  @override
  void toShare(Uri path) {
    // TODO: implement toShare
  }

   void smsShare(){

  }
}

class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');
    return true;
  }
  
  @override
  Future<void> toShare(Uri path) async {
    await launchUrl(path);
  }

  
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

class VeliDownload extends IFileDownload with ShareMixin{
  @override
  bool? downloadItem(FileItem? fileItem) {
    // TODO: implement downloadItem
    throw UnimplementedError();
  }

}

mixin ShareMixin on IFileDownload{
  void toShowFile() {
   
  }
}




//toShare şunu bekler der ki kardeşim sen kendi classına kendi özellikleri 
//yeniden yazacaksın

//Polymorphism