import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Icon(Icons.hourglass_empty, size: 48, color: Colors.grey),
            ),
          ),
          Container(
            color: const Color(0xFFF1F2F3),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  children: const [
                    Chip(
                      label: Text('Ý tưởng\nnhững kế hoạch chuyến đi', textAlign: TextAlign.center),
                    ),
                    Chip(
                      label: Text('Địa điểm\nđẹp ở Hà Nội', textAlign: TextAlign.center),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.language), onPressed: () {}),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Tin nhắn",
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.mic), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.send), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
