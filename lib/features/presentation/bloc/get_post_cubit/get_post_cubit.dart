import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project_intership/features/data/model/post_model.dart';
import 'package:test_project_intership/features/domain/usecases/post_usecase.dart';

part 'get_post_state.dart';

class GetPostCubit extends Cubit<GetPostState> {
  GetPostCubit(this.post) : super(GetPostInitial());

  final Post post;

  List<ProductModel> ls = [];

  Future<void> getPost() async{
    ls.clear();
    emit(GetPostLoading());

    final postResult = await post.getPost();

    postResult.fold((l) => emit(GetPostError(l.message)), (r) {
      ls.addAll(r);
      emit(GetPostSuccess(ls));
    });

  }

  void addPost(ProductModel product) async {
    emit(GetPostLoading());

    ls.insert(0, product);

    emit(GetPostSuccess(ls));
  }
}
