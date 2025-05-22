import 'package:flutter/material.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/logo.png', height: 40),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("SỞ DU LỊCH",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("THÀNH PHỐ HÀ NỘI"),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.menu),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/ho_guom.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 600,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: const [
                  TextLeagueSpartan(
                    title: "Ăn gì",
                    size: 20,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildArticleItem(
                  image: 'assets/images/che.jpg',
                  title: 'Ngọt thơm chè kho Đại Đồng ngày Tết',
                  time: '15:28 - 08/12/2023',
                ),
                _buildArticleItem(
                  image: 'assets/images/che.jpg',
                  title: 'Hết hồn đặc sản thịt chuột của người Hà Nội',
                  time: '15:18 - 08/12/2023',
                ),
                _buildArticleItem(
                  image: 'assets/images/che.jpg',
                  title: '24 món ngon Hà Nội vừa nghe tên đã thèm',
                  time: '15:19 - 08/12/2023',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleItem({
    required String image,
    required String title,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 4),
                Text(time,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
