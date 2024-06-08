// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:blog_app/common.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: [
          IconButton(
            onPressed: () {
              // const AddNewBlogPageData().push(context);
              const AddNewBlogPageData().go(context);
            },
            icon: const Icon(
              CupertinoIcons.add_circled,
            ),
          ),
        ],
      ),
    );
  }
}
