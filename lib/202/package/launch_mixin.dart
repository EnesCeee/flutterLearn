
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../package_learn_view.dart';

mixin LaunchMixin on State<PackageLearnView>{

  Future<void> launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}

//on diyerek bunu sınırlandırıyoruz sadece bu durumdan türetsin şeklinde