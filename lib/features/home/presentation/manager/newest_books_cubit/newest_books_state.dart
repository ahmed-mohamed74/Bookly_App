
part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  NewestBooksFailure(this.errMessage);
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> newestBooks;

  NewestBooksSuccess(this.newestBooks);
}
