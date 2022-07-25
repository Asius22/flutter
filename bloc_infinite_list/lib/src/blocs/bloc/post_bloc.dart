import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_infinite_list/src/model/post.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

const throttleDuration = Duration(milliseconds: 100);

class PostBloc extends Bloc<PostFetched, PostState> {
  PostBloc({required this.httpClient}) : super(PostState()) {
    on<PostFetched>(_onPostFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  EventTransformer<E> throttleDroppable<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    //event è l'evento che viene inviato
    //emit si occupa di "smistare" il nuovo stato ai vari provider/riceier
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(state.copyWith(
            hasReachedMax: false, posts: posts, status: PostStatus.success));
      }
      final posts = await _fetchPosts(startIndex: state.posts.length);
      posts.isEmpty
          ? emit(PostState(hasReachedMax: true))
          : emit(state.copyWith(
              hasReachedMax: false,
              posts: List.of(state.posts)..addAll(posts),
            ));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  final int _limit = 20;

  Future<List<Post>> _fetchPosts({int startIndex = 0}) async {
    final response = await http.get(Uri.https(
        "jsonplaceholder.typicode.com",
        "/posts",
        <String, String>{'_start': '$startIndex', '_limit': '$_limit'}));

    return response.statusCode == 200
        ? _parsePost(response.body)
        : throw Exception("fetchPosts: error fetching posts");
  }

  List<Post> _parsePost(String json) {
    final decoded = jsonDecode(json).cast<Map<String, dynamic>>();

    return decoded.map<Post>((json) => Post.fromJson(json)).toList();
  }
}
