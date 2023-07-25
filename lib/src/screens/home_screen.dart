import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Nome ou BI",
              hintStyle: TextStyle(color: Colors.white.withOpacity(.6)),
              filled: true,
              fillColor: const Color.fromARGB(255, 30, 30, 30),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 100,
            padding: const EdgeInsets.all(8),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 30, 30, 30),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Acivate the cashback function", style: TextStyle(color: Colors.blueAccent)),
                    const SizedBox(height: 10),
                    Text(
                      "Choose 2 categories forom\nthe list and recome to 3% cabac.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/document_art.png",
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
