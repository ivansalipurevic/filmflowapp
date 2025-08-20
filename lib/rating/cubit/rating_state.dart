part of 'rating_cubit.dart';

abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingLoading extends RatingState {}

class RatingLoaded extends RatingState {
  final List<Map<String, dynamic>> reviews;

  RatingLoaded(this.reviews);
}

class RatingError extends RatingState {
  final String message;

  RatingError(this.message);
}
