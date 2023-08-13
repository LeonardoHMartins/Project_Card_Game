import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HandCards extends StatefulWidget {
  const HandCards({super.key});

  @override
  State<HandCards> createState() => _HandCardsState();
}

class _HandCardsState extends State<HandCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: 100,
              height: 200,
            ),
            const Gap(10),
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              width: 100,
              height: 200,
            ),
          ],
        ),
      ],
    );
  }
}
