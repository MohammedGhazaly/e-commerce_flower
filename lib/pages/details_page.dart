import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/widgets/custom_app_bar.dart';
import 'package:e_commerce_flower/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool showMore = true;
  int maxLines = 3;
  String textButtonText = "Show more";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/img/1.jpg"),
              SizedBox(
                height: 16,
              ),
              Text(
                "\$12.99",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "New",
                        style: TextStyle(fontSize: 16),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 129, 129),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 191, 0),
                          size: 28,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 191, 0),
                          size: 28,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 191, 0),
                          size: 28,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 191, 0),
                          size: 28,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 191, 0),
                          size: 28,
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.edit_location,
                          size: 28,
                          color: Color.fromARGB(168, 3, 65, 27),
                        ),
                        Text(
                          "Flower Shop",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(168, 3, 65, 27)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      "Details:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  overflow: TextOverflow.fade,
                  maxLines: showMore == true ? 3 : null,
                  "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers produce gametophytes, which in flowering plants consist of a few haploid cells which produce gametes.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              TextButton(
                  onPressed: () {
                    // if (showMore == true) {
                    //   showMore = false;
                    //   // textButtonText = "Show less";
                    // } else {
                    //   showMore = true;
                    //   // textButtonText = "Show more";
                    // }
                    // A shortcut
                    showMore = !showMore;
                    setState(() {});
                  },
                  child: Text(
                    showMore == true ? "Show more" : "Show less",
                    // textButtonText,
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
