import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  final IconData iconTile;
  final String titleTile;
  final String subtitleTile;
  final Function onPressed;
  const TileButton({super.key, required this.iconTile, required this.titleTile, required this.subtitleTile, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(8),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 30, 30),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(iconTile, color: Colors.blueAccent, size: 28),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titleTile,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitleTile,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
