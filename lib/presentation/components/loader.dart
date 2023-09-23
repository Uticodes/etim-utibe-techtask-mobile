import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_task/presentation/components/progress_loader.dart';

class Loader {
  Loader(this.context, {this.allowBackButton = false});

  final bool allowBackButton;
  final BuildContext context;

  void show() {
    unawaited(
      Navigator.push(
        context,
        PageRouteBuilder(
          fullscreenDialog: true,
          opaque: false,
          barrierColor: Colors.transparent,
          pageBuilder: (_, __, ___) {
            return ProgressLoader(allowBackButton: allowBackButton);
          },
        ),
      ),
    );
  }

  void close() {
    Navigator.pop(context);
  }
}
