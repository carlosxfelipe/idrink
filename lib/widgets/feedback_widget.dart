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

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey[800]! : Colors.grey[100]!;
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "O que achou dessas recomendações?",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.thumb_up_outlined,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    debugPrint("Gostei");
                    _hideWidget();
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.thumb_down_outlined,
                    color: Colors.red.shade400,
                  ),
                  onPressed: () {
                    debugPrint("Não gostei");
                    _hideWidget();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close, color: textColor),
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
