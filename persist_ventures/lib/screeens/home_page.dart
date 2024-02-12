import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persist_ventures/screeens/discover.dart';
import 'package:persist_ventures/screeens/group.dart';
import 'package:persist_ventures/screeens/saved_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavoutive = false;
  int currentPageIndex = 0;
  File? _image;
  List isLiked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 22, 39),
            Color.fromARGB(255, 3, 90, 167),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leadingWidth: 90,
              backgroundColor: const Color.fromARGB(255, 2, 31, 56),
              pinned: true,
              scrolledUnderElevation: 3,
              forceMaterialTransparency: false,
              collapsedHeight: 65,
              leading: SizedBox(
                  // width: 30,
                  child: Center(
                      child: InkWell(
                onTap: () async {
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
                child: (_image != null)
                    ? Center(
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              // width: 2.0,
                            ),
                          ),
                          child: ClipOval(
                              child: Image(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          )),
                        ),
                      )
                    : const CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/profile.png',
                        ),
                        radius: 25,
                      ),
              ))),
              floating: false,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text((currentPageIndex == 0)
                    ? ' My Closet'
                    : (currentPageIndex == 1)
                        ? "Group"
                        : (currentPageIndex == 2)
                            ? "Discover"
                            : (currentPageIndex == 3)
                                ? "Saved"
                                : (currentPageIndex == 4)
                                    ? "Chat"
                                    : ""),
                background: Container(
                  color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 50.0, left: 100),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hii Tanik',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'Good Morning!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (currentPageIndex == 0)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                        CardWidget(index: index),
                        Positioned(
                            right: 5,
                            top: 5,
                            child: InkWell(
                              onTap: () {
                                // print("pressed");
                                setState(() {
                                  isLiked[index] = !isLiked[index];
                                  // isFavoutive = !isFavoutive;
                                });
                              },
                              child: Material(
                                elevation: 2,
                                color: Colors.transparent,
                                child: (!isLiked[index])
                                    ? const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.red,
                                      ),
                              ),
                            ))
                      ]),
                      childCount: 12,
                    ),
                  ),
                ),
              ),
              if(currentPageIndex==3)
                SavedScreen(saved: isLiked),
              if(currentPageIndex==1)
                 const GroupWidget(),
                 if(currentPageIndex==2)
                 DiscoverWidget()
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 65,
        backgroundColor: const Color.fromARGB(255, 3, 90, 167),
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.blueGrey,
              ),
              label: 'My Closet',
            ),
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.group),
            icon: Icon(
              Icons.group_outlined,
              color: Colors.blueGrey,
            ),
            label: 'Group',
          ),
          NavigationDestination(
            selectedIcon: Badge(child: Icon(Icons.home)),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.blueGrey,
            ),
            label: 'Discover',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(
              Icons.favorite_border,
              color: Colors.blueGrey,
            ),
            label: 'Saved',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp, color: Colors.blueGrey),
            ),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Stack(children: [
                Image.network(
                  (index % 4 == 0)
                      ? 'https://rukminim2.flixcart.com/image/850/1000/xif0q/jean/x/f/r/32-sp1017-sparky-original-imagq4355zjum4h3.jpeg?q=90&crop=false'
                      : (index % 4 == 1)
                          ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKdMr7Nrww0dLUvxYsDRSjiBUR2f4iEg5DqA&usqp=CAU'
                          : (index % 4 == 2)
                              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV363p1ArGin7VVxYhyQGevD7rvphQ7hFKAg&usqp=CAU"
                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIrMVWWXBdPwYSeYYHlQtbKGcpgRVaZDjwqQ&usqp=CAU",
                  height: 157,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            // const Text(
            //   "detail",
            //   style: TextStyle(
            //       color: Colors.white70, fontSize: 18),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (index % 4 == 0)
                        ? "Jeans"
                        : (index % 4 == 1)
                            ? "Shirt"
                            : (index % 4 == 2)
                                ? "Dress"
                                : (index % 4 == 3)
                                    ? "Hoodie"
                                    : "",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    (index % 4 == 0)
                        ? "\u{20B9}900"
                        : (index % 4 == 1)
                            ? "\u{20B9}500"
                            : (index % 4 == 2)
                                ? "\u{20B9}1250"
                                : (index % 4 == 3)
                                    ? "\u{20B9}750"
                                    : "",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
