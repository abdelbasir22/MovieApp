import 'package:flutter/material.dart';

import '../../../../../const.dart';
import '../../../data/models/movie_model.dart';

Widget buildMovieItem(Results model) => Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blue,
        ),
        child: Column(
          children: [
            Image.network(
              model.backdropPath,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              model.title,
              style: TextStyle(fontSize: 18, color: AppColors.white),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
