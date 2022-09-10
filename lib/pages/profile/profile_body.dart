import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        autofocus: false,
        style: TextButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey[850],
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 33,
              color: color,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white),)),
            Icon(Icons.arrow_forward_ios, size: 30,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}