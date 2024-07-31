part of 'preview_books_cubit.dart';

sealed class PreviewBooksState extends Equatable {
  const PreviewBooksState();

  @override
  List<Object> get props => [];
}

final class PreviewBooksInitial extends PreviewBooksState {}

final class PreviewBooksLoading extends PreviewBooksState {}

final class PreviewBooksSuccess extends PreviewBooksState {
  final List<BookModel> books;

  const PreviewBooksSuccess({required this.books});
}

final class PreviewBooksFailure extends PreviewBooksState {
  final String errMessage;

  const PreviewBooksFailure({required this.errMessage});
}
