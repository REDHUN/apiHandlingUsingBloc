part of 'posts_bloc.dart';

@immutable
abstract class PostsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class PostStateLoading extends PostsState {}

class PostStateLoaded extends PostsState {
  final List<PostEntities> post;

  PostStateLoaded({required this.post});
  @override
  List<Object?> get props => [];
}

class PostStateError extends PostsState {
  final String errMsg;

  PostStateError({required this.errMsg});
  @override
  List<Object?> get props => [];
}
