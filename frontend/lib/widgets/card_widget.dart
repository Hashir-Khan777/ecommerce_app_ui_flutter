import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';

Widget customCard(
  BuildContext context, {
  required String image,
  required String name,
  required String price,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * .46,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(
        color: Color(ColorConstants.primaryGrey),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 120,
          margin: const EdgeInsets.only(bottom: 10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "\$$price",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color(
              ColorConstants.primaryBlue,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: const [
            Icon(Icons.star_border, size: 16),
            Icon(Icons.star_border, size: 16),
            Icon(Icons.star_border, size: 16),
            Icon(Icons.star_border, size: 16),
            Icon(Icons.star_border, size: 16),
          ],
        ),
        Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(top: 10),
          child: SizedBox(
            width: 105,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(ColorConstants.primaryBlue),
                shadowColor: Color(ColorConstants.primaryBlue),
              ),
              onPressed: () {},
              child: Row(
                children: const [
                  Icon(
                    Icons.add_shopping_cart_outlined,
                    size: 15,
                  ),
                  Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
