part of 'get_post_cubit.dart';

abstract class GetPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPostInitial extends GetPostState {}

class GetPostError extends GetPostState {
  GetPostError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

class GetPostLoading extends GetPostState {}

class GetPostSuccess extends GetPostState {
  GetPostSuccess(this.post);

  final List<ProductModel> post;

  @override
  List<Object> get props => [post];
}
