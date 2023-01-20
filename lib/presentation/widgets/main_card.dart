import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String apiImageUrl;

  const MainCard({
    Key? key,
    required this.apiImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(apiImageUrl),
          ),
        ),
      ),
    );
  }
}
