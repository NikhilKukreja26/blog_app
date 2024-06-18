// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blog_app/common.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BlogBloc>().add(const BlogFetchAllBlogs());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: [
          IconButton(
            onPressed: () async {
              const AddNewBlogPageData().push(context).then((_) {
                context.read<BlogBloc>().add(const BlogFetchAllBlogs());
              });
              // const AddNewBlogPageData().go(context);
            },
            icon: const Icon(
              CupertinoIcons.add_circled,
            ),
          ),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
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
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BlogDisplaySuccess) {
            return ListView.builder(
              itemCount: state.blogs.length,
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                final blog = state.blogs[index];
                return Text(blog.title);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
