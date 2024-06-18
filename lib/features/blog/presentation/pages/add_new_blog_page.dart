// Dart imports:
import 'dart:io' show File;

// Package imports:
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blog_app/common.dart';
import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/utils/pick_image.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> with ValidationMixin {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<List<String>> _selectedTopics =
      ValueNotifier<List<String>>([]);

  final ValueNotifier<File?> image = ValueNotifier(null);

  Future<void> selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      image.value = pickedImage;
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  void _uploadBlog() {
    if (_formKey.currentState!.validate() &&
        _selectedTopics.value.isNotEmpty &&
        image.value != null) {
      final posterId =
          (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;
      context.read<BlogBloc>().add(
            BlogUploadBlogToDatabase(
              posterId: posterId!,
              title: _titleController.text.trim(),
              content: _contentController.text.trim(),
              image: image.value!,
              topics: _selectedTopics.value,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _uploadBlog,
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: BlocConsumer<BlogBloc, BlogState>(
          listener: (context, state) {
            if (state is BlogFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                  ),
                  backgroundColor: context.error,
                ),
              );
            } else if (state is BlogUploadSuccess) {
              const BlogPageData().go(context);
            }
          },
          builder: (context, state) {
            if (state is BlogLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: selectImage,
                      child: ValueListenableBuilder<File?>(
                        valueListenable: image,
                        builder: (_, value, __) {
                          if (value != null) {
                            return SizedBox(
                              height: AppHeight.h200,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppBorderRadius.r10),
                                child: Image.file(
                                  value,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }
                          return DottedBorder(
                            color: AppPalette.borderColor,
                            dashPattern: const [10, 4],
                            radius: Radius.circular(AppBorderRadius.r10),
                            borderType: BorderType.RRect,
                            strokeCap: StrokeCap.round,
                            child: SizedBox(
                              height: AppHeight.h150,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: AppHeight.h40,
                                  ),
                                  SizedBox(height: AppHeight.h16),
                                  Text(
                                    AppStrings.selectYourImage,
                                    style: context.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: AppHeight.h20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          AppStrings.technology,
                          AppStrings.business,
                          AppStrings.programming,
                          AppStrings.entertainment,
                        ]
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ValueListenableBuilder<List<String>>(
                                  valueListenable: _selectedTopics,
                                  builder: (_, topics, ___) {
                                    return FilterChip(
                                      onSelected: (value) {
                                        if (!_selectedTopics.value
                                            .contains(e)) {
                                          _selectedTopics.value = [
                                            ..._selectedTopics.value,
                                            e,
                                          ];
                                          topics.add(e);
                                        } else {
                                          _selectedTopics.value =
                                              _selectedTopics.value
                                                  .where((value) => value != e)
                                                  .toList();
                                        }
                                      },
                                      showCheckmark: false,
                                      color: topics.contains(e)
                                          ? const WidgetStatePropertyAll(
                                              AppPalette.gradient1,
                                            )
                                          : null,
                                      side: topics.contains(e)
                                          ? null
                                          : const BorderSide(
                                              color: AppPalette.borderColor,
                                            ),
                                      label: Text(e),
                                    );
                                  },
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    SizedBox(height: AppHeight.h20),
                    BlogEditor(
                      controller: _titleController,
                      hintText: AppStrings.blogTitle,
                      validator: validateTitle,
                    ),
                    SizedBox(height: AppHeight.h14),
                    BlogEditor(
                      controller: _contentController,
                      hintText: AppStrings.blogContent,
                      validator: validateContent,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
