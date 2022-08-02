import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    Key? key,
    this.onTap,
    required this.image,
  }) : super(key: key);
  final Function()? onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF5F5F5),
        ),
        child: Image.asset(
          image,
          height: 37,
          width: 37,
        ),
      ),
    );
  }
}
