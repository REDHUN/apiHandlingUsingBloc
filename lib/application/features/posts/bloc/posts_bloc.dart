import 'package:bloc/bloc.dart';
import 'package:blocapihandling/domain/entities/post_entites.dart';
import 'package:blocapihandling/domain/usecases/post_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostRequestedEvent>((event, emit) async {
      emit(PostStateLoading());
      await Future.delayed(const Duration(seconds: 3));
      try {
        emit(PostStateLoaded(
            post: await PostUseCases().getPostFromDataSource()));
      } catch (e) {
        print(e.toString());
        emit(PostStateError(errMsg: e.toString()));
      }
    });
  }
}
