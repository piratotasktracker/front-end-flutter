import 'package:flutter/material.dart';

class TaskDataCell extends StatelessWidget {

  final String data;
  final double width;

  const TaskDataCell({
    required this.data,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 178,
      child: Text(
        data,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

}