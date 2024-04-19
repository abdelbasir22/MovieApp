import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/const.dart';
import 'package:movie_app/features/home/presentation/manger/movie_cubit/movie_cubit.dart';
import 'package:movie_app/features/home/presentation/manger/movie_cubit/movie_stats.dart';
import 'package:movie_app/features/home/presentation/view/widgets/movie_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMovie(),
      child: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                'Movie App',
                style: TextStyle(color: AppColors.pink),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.removePage();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('${cubit.page}'),
                ),
                IconButton(
                  onPressed: () {
                    cubit.addPage();
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            body:
                BlocBuilder<MovieCubit, MovieStates>(builder: (context, state) {
              if (state is MovieLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieFailureState) {
                return const Center(child: Text('Error'));
              }
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return buildMovieItem(
                            context.read<MovieCubit>().allMovies[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: cubit.allMovies.length,
                      ),
                    ),
                  )
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
