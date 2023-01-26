import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_intership/features/data/model/post_model.dart';
import 'package:test_project_intership/features/presentation/bloc/get_post_cubit/get_post_cubit.dart';
import 'package:test_project_intership/features/presentation/pages/detail_page.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (d){
        context.read<GetPostCubit>().ls.removeAt(product.id!);
      },
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                product: product,
              ),
            ),
          );
        },
        leading: Image.network(
          product.image!,
          width: 100,
          height: 150,
          fit: BoxFit.contain,
        ),
        title: Text(
          product.title!,
          maxLines: 2,
        ),
        subtitle: Text(
          product.description!,
          maxLines: 3,
        ),
      ),
    );
  }
}
