import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  const SquareTile({super.key, required this.ImagePath, this.onTap});
  final String ImagePath;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          ImagePath,
          height: 40,
        ),
      ),
    );
  }
}
