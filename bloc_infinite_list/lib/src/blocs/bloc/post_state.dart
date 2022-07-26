part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  //inizializzo lo stato
  const PostState(
      {this.status = PostStatus.initial,
      this.posts = const <Post>[],
      this.hasReachedMax = false});

  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  //funzione di copia
  PostState copyWith(
          {PostStatus? status, List<Post>? posts, bool? hasReachedMax}) =>
      PostState(
          status: status ?? this.status,
          posts: posts ?? this.posts,
          hasReachedMax: hasReachedMax ?? this.hasReachedMax);

  //utili ad equatable per comparare due stati
  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
