import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../shared/theme/colors.dart';

class HomeScreenLoader extends StatelessWidget {
  const HomeScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 5),
      itemCount: 3,
      itemBuilder: (context, categoryIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Shimmer.fromColors(
                baseColor: grey300,
                highlightColor: grey100,
                child: Container(
                  width: 100,
                  height: 20,
                  color: white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemCount: 5, // Number of skeleton movie cards
                  itemBuilder: (context, movieIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Shimmer.fromColors(
                        baseColor: grey300,
                        highlightColor: grey100,
                        child: Container(
                          width: 140,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
