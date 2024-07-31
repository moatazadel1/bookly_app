part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksSucess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSucess({required this.books});
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailure({required this.errMessage});
}

final class SimilarBooksLoading extends SimilarBooksState {}
