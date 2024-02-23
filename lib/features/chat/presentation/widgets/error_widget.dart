import 'package:flutter/material.dart';
import 'package:sendbird_chat_app/core/application/theme/colors/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const CustomErrorWidget({Key? key, required this.error, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.error_outline, size: 68),
          const SizedBox(height: 20),
          Text(
            error,
            style: const TextStyle(fontSize: 16, color: AppColors.failAlert2),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: onRetry,
            child: const Text(
              'Retry',
              style: TextStyle(color: AppColors.othersWhite, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
