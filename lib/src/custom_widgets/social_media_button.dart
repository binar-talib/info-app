import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    this.onTap,
    required this.title,
    required this.color,
    required this.icon,
  }) : super(key: key);
  final Function()? onTap;
  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 20),
              blurRadius: 21,
              spreadRadius: -17,
            ),
          ],
        ),
        child: ListTile(
          leading: FaIcon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 15.0),
            textAlign: TextAlign.center,
          ),
          trailing: const SizedBox(
            width: 19,
            height: 19,
          ),
        ),
      ),
    );
  }
}
