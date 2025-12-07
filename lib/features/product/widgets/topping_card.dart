import 'package:flutter/material.dart';

class ToppingCard extends StatelessWidget {
  const ToppingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
  });
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 85,
            width: 110,
            color: Color(0xff3C2F2F),
            child: Column(children: [

              ],
            ),
          ),
        ),
        //image section
        Positioned(
          top: -40,
          right: -5,
          left: -5,
          child: SizedBox(
            height: 80,
            width: 70,
            child: Card(
              color: Colors.white,
              child: Image.asset(imageUrl, fit: BoxFit.contain),
            ),
          ),
        ),
        //bottom widget
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: onAdd,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
