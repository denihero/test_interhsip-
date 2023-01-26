import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project_intership/features/data/model/post_model.dart';
import 'package:test_project_intership/features/domain/entity/post_entity.dart';
import 'package:test_project_intership/features/presentation/bloc/get_post_cubit/get_post_cubit.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  late final TextEditingController descriptionController;
  late final TextEditingController titleController;
  late final TextEditingController priceController;

  final ImagePicker picker = ImagePicker();
  File? imageFile;

  pickImage() async {
    try {
      final image =
          await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
      if (image == null) return;
      setState(() {
        imageFile = File(image.path);
      });
    } catch (_) {}
  }

  @override
  void initState() {
    descriptionController = TextEditingController();
    titleController = TextEditingController();
    priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        width: 350,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // const Text('Фотка товара'),
                  // SizedBox(
                  //   width: 130,
                  //   child: ElevatedButton(
                  //     style: ButtonStyle(
                  //         elevation: MaterialStateProperty.all(0),
                  //         backgroundColor:
                  //             MaterialStateProperty.all(Colors.white),
                  //         shape: MaterialStateProperty.all(
                  //             RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(5),
                  //                 side: const BorderSide(color: Colors.grey)))),
                  //     onPressed: () async {
                  //       await pickImage();
                  //     },
                  //     child: Row(
                  //       children: const [
                  //         Text(
                  //           'Загрузить',
                  //           style: TextStyle(color: Colors.black),
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Icon(
                  //           Icons.download_sharp,
                  //           color: Colors.black,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: true,
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Название товара',
                      contentPadding:
                          const EdgeInsets.only(bottom: 0, left: 10),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: true,
                    keyboardType: TextInputType.multiline,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Описание товара',
                      contentPadding:
                          const EdgeInsets.only(bottom: 5, left: 10),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: true,
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                    ], // Only numbers can be entered
                    decoration: InputDecoration(
                      hintText: 'Цена товара',
                      contentPadding:
                          const EdgeInsets.only(bottom: 5, left: 10),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    child: const Text('Создать'),
                    onPressed: () {
                      context.read<GetPostCubit>().ls.insert(
                            0,
                            ProductModel(
                              id: 45,
                              title: titleController.text,
                              price: double.parse(priceController.text),
                              description: descriptionController.text,
                              image:
                                  'https://siteimages.simplified.com/background-remover/background-remover-apparels-image-3.png',
                              category: Category.MEN_S_CLOTHING,
                              rating: RatingModel(
                                rate: Random().nextDouble() * 5,
                                count: Random().nextInt(100),
                              ),
                            ),
                          );

                      Navigator.pop(context);

                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
