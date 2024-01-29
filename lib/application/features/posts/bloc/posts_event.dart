part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent extends Equatable {}

class PostRequestedEvent extends PostsEvent {
  @override
  List<Object?> get props => [];
}
