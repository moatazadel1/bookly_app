import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'preview_books_state.dart';

class PreviewBooksCubit extends Cubit<PreviewBooksState> {
  PreviewBooksCubit(this.homeRepo) : super(PreviewBooksInitial());

  final HomeRepo homeRepo;

  Future fetchPreviewBooks() async {
    emit(PreviewBooksLoading());
    var result = await homeRepo.fetchPreviewBooks();
    result.fold((failure) {
      emit(PreviewBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(PreviewBooksSuccess(books: books));
    });
  }
}
