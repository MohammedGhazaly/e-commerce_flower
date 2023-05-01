import 'package:e_commerce_flower/constants.dart';
import 'package:e_commerce_flower/models/item_model.dart';
import 'package:e_commerce_flower/widgets/custom_app_bar.dart';
import 'package:e_commerce_flower/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.product});
  final Item product;

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
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(
              pageTitle: "Item detail",
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.product.imgPath),
              const SizedBox(
                height: 16,
              ),
              Text(
                "\$${widget.product.price}",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 129, 129),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "New",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Row(
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
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.edit_location,
                          size: 28,
                          color: Color.fromARGB(168, 3, 65, 27),
                        ),
                        Text(
                          widget.product.location,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(168, 3, 65, 27)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
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
              const SizedBox(
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
              const SizedBox(
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
                    style: const TextStyle(fontSize: 18),
                  )),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
