import 'package:flutter/material.dart';
import 'package:persist_ventures/screeens/home_page.dart';
import 'package:persist_ventures/widget/list_view_widget.dart';

class DiscoverWidget extends StatelessWidget {
   DiscoverWidget({super.key});

  final List groups = ["Fashion","Mens","Female","Child"];

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "New Fashion",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for(int i =0;i<12;i++)
                 CardWidget(index: i)
              ],),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Explore New Groups",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            for(int i =0; i< groups.length;i++)
            ListTileWidget(title: groups[i],)

          ],
        ),
      ),
    );
  }
}
