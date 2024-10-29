import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });
  static const String id = 'loadingscreen';
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: Container(
            color: Colors.transparent,
            child: const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
