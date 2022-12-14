import 'package:flutter/material.dart';
import 'months.dart';
import "message.dart";
import 'overlays.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var overlays = Overlays(context);
    bool isMessageOptionsOpen = false;

    void displayOverlay() {
      if (isMessageOptionsOpen) {
        overlays.showMessageOptions(false);
        isMessageOptionsOpen = false;
      }
    }

    return SafeArea(
        child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => displayOverlay(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.archive_outlined)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.delete_outline)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mail_outline),
            ),
            IconButton(
                onPressed: () {
                  overlays.showMessageOptions(true);
                  isMessageOptionsOpen = true;
                },
                icon: const Icon(Icons.more_vert_outlined))
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              width: width,
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.black),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      message.getSubject,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.star_border_outlined)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.black),
            )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: message.getColor,
                    maxRadius: 27,
                    child: Text(
                      message.getName[0],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                message.getName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${months[message.getMonth]} ${message.getDay}",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "To me",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down)),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.reply)),
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(Icons.more_vert_outlined)),
                                ],
                              )
                            ],
                          )
                        ]),
                  ),
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                Text(
                  message.getMessage,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
