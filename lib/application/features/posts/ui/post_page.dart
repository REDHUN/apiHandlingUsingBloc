import 'package:blocapihandling/application/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(),
      child: const PostPage(),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<PostsBloc>(context).add(PostRequestedEvent());
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Posts",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  if (state is PostsInitial) {
                    return const Center(
                      child: Text(
                        "Posts are Waiting",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (state is PostStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PostStateLoaded) {
                    return ListView.builder(
                        itemCount: state.post.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  state.post[index].id.toString(),
                                ),
                              ),
                              title: Text(state.post[index].title),
                              subtitle: Text(state.post[index].body),
                            ),
                          );
                        }));
                  } else if (state is PostStateError) {
                    return Center(
                      child: Text(
                        state.errMsg,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
