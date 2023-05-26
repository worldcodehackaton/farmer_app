import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/colors.dart';
import 'package:flutter_farmer_app/map/presentation/map_page.dart';
import 'package:flutter_farmer_app/reviews/presentation/widgets/review_card.dart';
import 'package:line_icons/line_icons.dart';

import '../../ui/expandable_page_view.dart';

class FarmerPage extends StatefulWidget {
  const FarmerPage({
    super.key,
  });

  @override
  State<FarmerPage> createState() => _FarmerPageState();
}

class _FarmerPageState extends State<FarmerPage> {
  late final PageController _pageController;

  List<Widget> _buildReviewCards() {
    final parts = <Widget>[];

    for (int index = 0; index < 5; index++) {
      parts.add(
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: ReviewCard(
            rating: 5,
            userName: 'Test User',
            reviewComment: 'Test Comment\nTest comment\n\nTest Comment\n\nfadsfadsfads',
          ),
        ),
      );
    }

    return parts;
  }

  Widget _buildReviews() => Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Оценки и отзывы",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        LineIcons.starAlt,
                        color: Colors.amber,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "4,9 / 5",
                          style: TextStyle(
                            fontSize: 24,
                            color: greenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            ExpandablePageView(
              controller: _pageController,
              children: _buildReviewCards(),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(greenColor),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Связаться с продавцом",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );

  PreferredSizeWidget _buildAppBar() => AppBar(
        leading: IconButton(
          onPressed: () {},
          splashRadius: 25,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 25,
            icon: const Icon(Icons.share),
          ),
        ],
      );

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.95);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle secondaryTextStyle = TextStyle(
      fontSize: 12,
      color: Colors.black54,
    );

    const TextStyle primaryBold = TextStyle(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Placeholder(),
                    Transform.translate(
                      offset: const Offset(0, 20),
                      child: const CircleAvatar(
                        radius: 40,
                        child: Text("fe"),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Название",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Love this plugin! Does exactly what it is supposed to do and so far without any real issues. (You might want to review some Dummy Text generation which contains words and even sentences with a meaning and that should not suppose to happen)",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Все описание",
                        style: TextStyle(
                          color: greenColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: const [
                          Icon(
                            LineIcons.stream,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Условия доставки и оплаты",
                            style: primaryBold,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "\nМинимальная сумма заказа - 1000 ₽",
                              style: secondaryTextStyle,
                            ),
                            SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                style: secondaryTextStyle,
                                children: [
                                  TextSpan(
                                    text: 'Доставка по всей России\n',
                                  ),
                                  TextSpan(
                                    text: '\nОплата: Наличными, Банковской картой',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: const [
                          Icon(
                            LineIcons.map,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Адрес доставки",
                            style: primaryBold,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "г.Урус-Мартан, Бруклинский район, дом 5",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const MapPage(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              _buildReviews(),
            ],
          ),
        ),
      ),
    );
  }
}
