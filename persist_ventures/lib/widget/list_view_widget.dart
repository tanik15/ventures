import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Colors.transparent,
        child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/profile.png',
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 70),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )
                ])),
      ),
    );
  }
}
