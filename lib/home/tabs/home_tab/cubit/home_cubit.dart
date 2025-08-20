import 'package:equatable/equatable.dart';
import 'package:filmflowapp/home/tabs/home_tab/models/movie.dart';
import 'package:filmflowapp/home/tabs/home_tab/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;
  HomeCubit(this.repository) : super(const HomeState());

  Future<void> fetchMovies() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final movieresult = await Future.wait([
        repository.getMovies('popular'),
        repository.getMovies('top_rated'),
        repository.getMovies('upcoming'),
      ]);
      final popular = movieresult[0];
      final topRated = movieresult[1];
      final upcoming = movieresult[2];

      emit(
        state.copyWith(
          popularMovies: popular,
          topRatedMovies: topRated,
          upcomingMovies: upcoming,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
