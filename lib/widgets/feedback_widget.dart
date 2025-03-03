import 'package:flutter/material.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({super.key});

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  bool _isVisible = true;

  void _hideWidget() {
    setState(() {
      _isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "O que achou dessas recomendações?",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up_outlined),
                  onPressed: () {
                    debugPrint("Gostei");
                    _hideWidget();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.thumb_down_outlined),
                  onPressed: () {
                    debugPrint("Não gostei");
                    _hideWidget();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _hideWidget,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
