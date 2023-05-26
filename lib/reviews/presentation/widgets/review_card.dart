import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    required this.userName,
    required this.reviewComment,
    required this.rating,
    super.key,
  });

  final String userName;

  final String reviewComment;

  final int rating;

  @override
  Widget build(BuildContext context) {
    const TextStyle secondaryTextStyle = TextStyle(
      fontSize: 12,
      color: Colors.black54,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              RatingBar.builder(
                itemSize: 24,
                minRating: 1,
                itemCount: 5,
                initialRating: 3,
                allowHalfRating: true,
                direction: Axis.horizontal,
                itemBuilder: (context, _) => const Icon(
                  Icons.star_border_rounded,
                  color: Colors.amber,
                  size: 7,
                ),
                onRatingUpdate: (rating) {
                  if (kDebugMode) {
                    print(rating);
                  }
                },
              )
            ],
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                reviewComment,
                maxLines: 2,
                style: secondaryTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
