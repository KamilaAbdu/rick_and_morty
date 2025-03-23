import 'dart:ui';
import 'package:flutter/material.dart';

Widget characterBackgroundImage(String? imageUrl, BuildContext context) {
  final mq = MediaQuery.of(context).size;

  return Stack(
    children: [
      ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          height: mq.height / 4,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),

      Container(
        height: mq.height / 4,
        width: double.infinity,
        color: Colors.black.withOpacity(0.3),
      ),
    ],
  );
}
