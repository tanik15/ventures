import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:persist_ventures/screeens/home_page.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key, required this.saved});
  final List saved;

  @override
  Widget build(BuildContext context) {
    int isTrue = 0;
    debugPrint(saved.toString());
    for (int i = 0; i < saved.length; i++) {
      if (saved[i] == true) {
        isTrue++;
      }
    }
    if (isTrue == 0) {
      return  const SliverToBoxAdapter(
        child: SizedBox(
          height: 400,
          child: Center(
            child: Text("Opps no saved content",style: TextStyle(color: Colors.white),),
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: GridView.custom(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 6,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            // repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: const [
              // QuiltedGridTile(3, 3),
              QuiltedGridTile(4, 3),
              QuiltedGridTile(4, 3),
              // QuiltedGridTile(3, 2),
              // QuiltedGridTile(2, 3),
              // QuiltedGridTile(1, 1),
              // QuiltedGridTile(1, 2),
              // QuiltedGridTile(1, 3),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Stack(children: [
              if (saved[index] == true) CardWidget(index: index),
              // Positioned(
              //     right: 5,
              //     top: 5,
              //     child: InkWell(
              //       onTap: () {
              //         // print("pressed");
              //         setState(() {
              //           isLiked[index] = !isLiked[index];
              //           // isFavoutive = !isFavoutive;
              //         });
              //       },
              //       child: Material(
              //         elevation: 2,
              //         color: Colors.transparent,
              //         child: (!isLiked[index])
              //             ? const Icon(
              //                 Icons.favorite_outline,
              //                 color: Colors.white,
              //               )
              //             : const Icon(
              //                 Icons.favorite_rounded,
              //                 color: Colors.red,
              //               ),
              //       ),
              //     ))
            ]),
            childCount: saved.length,
          ),
        ),
      );
    }
  }
}
