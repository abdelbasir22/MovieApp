import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/manger/movie_cubit/movie_stats.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitState());

  static MovieCubit get(context) => BlocProvider.of(context);

  int page = 1;
  List allMovies = [];

  void getMovie() async {
    emit(MovieLoadingState());
    try {
      final response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$page',
      );
      var model = MovieModel.fromJson(response.data);
      allMovies = model.results;
      emit(MovieSuccessState());
    } catch (e) {
      emit(
        MovieFailureState(),
      );
    }
  }

  void addPage() async {
    emit(MovieLoadingState());
    try {
      page++;
      final response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$page',
      );
      var model = MovieModel.fromJson(response.data);
      allMovies = model.results;
      emit(MovieSuccessState());
    } catch (e) {
      emit(
        MovieFailureState(),
      );
    }
  }

  void removePage() async {
    emit(MovieLoadingState());
    try {
      if (page > 1) {
        page--;
      }
      final response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$page',
      );
      var model = MovieModel.fromJson(response.data);
      allMovies = model.results;
      emit(MovieSuccessState());
    } catch (e) {
      emit(
        MovieFailureState(),
      );
    }
  }
}
