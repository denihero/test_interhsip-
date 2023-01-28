import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_intership/features/presentation/bloc/get_post_cubit/get_post_cubit.dart';
import 'package:test_project_intership/features/presentation/widget/add_new_product.dart';
import 'package:test_project_intership/features/presentation/widget/product_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Intership',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AddNewProduct();
                  });
            },
            icon: const Icon(Icons.add),
            color: Colors.black,
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<GetPostCubit>().getPost();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<GetPostCubit, GetPostState>(
                builder: (context, state) {
                  if (state is GetPostSuccess) {
                    final post = context.read<GetPostCubit>().ls;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: post.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: ProductCardWidget(
                              product: post[index],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is GetPostError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is GetPostLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
