import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/src/model/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/src/blocs/bloc/post_bloc.dart';
import 'package:flutter_infinite_list/src/model/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(App()),
      blocObserver: SimpleBlocObserver());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white70, foregroundColor: Colors.black)),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: const Text(
            "Posts",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          )),
        ),
        body: BlocProvider(
          create: (context) =>
              PostBloc(httpClient: http.Client())..add(PostFetched()),
          lazy: false,
          child: PostsList(),
        ),
      ),
    );
  }
}

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case PostStatus.success:
              if (state.posts.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return ListView.builder(
                itemBuilder: (context, index) => (index >= state.posts.length)
                    ? BottomLoader()
                    : PostListItem(post: state.posts[index]),
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
              );

            case PostStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        },
      );
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 1.5,
    );
  }
}

class PostListItem extends StatelessWidget {
  PostListItem({Key? key, required this.post}) : super(key: key);
  final _boldStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 12);
  final _smallText = TextStyle(fontSize: 8, fontWeight: FontWeight.w100);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      margin: EdgeInsets.all(3.0),
      child: ListTile(
        leading: Text("${post.id}"),
        title: Column(children: [
          Text("${post.title}", style: _boldStyle),
          Text(
            "${post.body}",
            style: _smallText,
          )
        ]),
      ),
    );
  }
}
