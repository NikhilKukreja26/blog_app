// Package imports:
import 'package:dotted_border/dotted_border.dart';

// Project imports:
import 'package:blog_app/common.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  ValueNotifier<List<String>> _selectedTopics = ValueNotifier<List<String>>([]);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DottedBorder(
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
                                  if (!_selectedTopics.value.contains(e)) {
                                    _selectedTopics.value = [
                                      ..._selectedTopics.value,
                                      e,
                                    ];
                                    topics.add(e);
                                  } else {
                                    _selectedTopics.value = _selectedTopics
                                        .value
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
              ),
              SizedBox(height: AppHeight.h14),
              BlogEditor(
                controller: _contentController,
                hintText: AppStrings.blogContent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
