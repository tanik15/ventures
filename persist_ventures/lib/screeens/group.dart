import 'package:flutter/material.dart';
import 'package:persist_ventures/widget/list_view_widget.dart';

class GroupWidget extends StatefulWidget {
  const GroupWidget({super.key});

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  List tileList = ["Family", "College", "Society", "Fashion", "Comittee"];
  TextEditingController titlecontroller = TextEditingController();
  List isFound = [];

  @override
  void initState() {
    // isFound = tileList;
    super.initState();
  }

  void runFilter(String enteredValue) {
    List result = [];
    if (enteredValue.isEmpty) {
      result = [];
    } else {
      result = tileList
          .where((element) =>
              element.toString().toLowerCase().contains(enteredValue))
          .toList();
    }
    setState(() {
      isFound = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Card(
              elevation: 1,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.transparent,
              child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 250,
                            child: TextField(
                              cursorColor: Colors.white,
                              onChanged: (value) => runFilter(value),
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(

                                  // helperMaxLines: 0,
                                  label: Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                            )),
                        const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  )),
            ),
            if (isFound.isNotEmpty)
              const SizedBox(
                height: 30,
              ),
            for (int i = 0; i < isFound.length; i++)
              ListTileWidget(title: isFound[i]),
            const SizedBox(
              height: 30,
            ),
            if (isFound.isNotEmpty)
              const Divider(
                color: Colors.white,
              ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        elevation: 10,
                        actions: [
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: titlecontroller,
                            decoration:
                                const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "title"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 5, 54, 97)),
                              onPressed: () {
                                setState(() {
                                  tileList.add(titlecontroller.text);
                                });
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Create",
                                style: TextStyle(color: Colors.white),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    });
              },
              child: const Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: Colors.transparent,
                child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25,
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Existing Group",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            for (int i = 0; i < tileList.length; i++)
              ListTileWidget(title: tileList[i]),
          ],
        ),
      ),
    );
  }
}

void alertDialog(context, List abc) {
  showDialog(
      context: context,
      builder: (context) {
        return Alertbox(
          list: abc,
        );
      });
}

class Alertbox extends StatefulWidget {
  const Alertbox({
    super.key,
    required this.list,
  });
  final List list;

  @override
  State<Alertbox> createState() => _AlertboxState();
}

class _AlertboxState extends State<Alertbox> {
  TextEditingController titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 10,
      actions: [
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: titlecontroller,
          decoration: const InputDecoration(hintText: "title"),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 5, 54, 97)),
            onPressed: () {
              widget.list.add(titlecontroller.text);
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text(
              "Create",
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
