import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Row(
                children: [
                  SizedBox(width: 30),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://picsum.photos/200/300',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -25,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -10,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
