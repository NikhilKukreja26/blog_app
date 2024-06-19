import 'package:blog_app/common.dart';
import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:go_router/go_router.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
    required this.color,
  });
  final Blog blog;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.goNamed(
        //   'blogDetails',
        //   extra: blog,
        // );
        context.pushNamed(
          'blogDetails',
          extra: blog,
        );
        // context.push(
        //   '/blog/blog-details',
        //   extra: blog,
        // );
        // BlogViewerData().push(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p8,
        ),
        padding: EdgeInsets.all(AppPadding.p16),
        height: AppHeight.h200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            AppBorderRadius.r10,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: blog.topics
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Chip(
                              label: Text(e),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Text(
                  blog.title,
                  style: context.titleLarge,
                ),
              ],
            ),
            Text('${calculateReadingTime(blog.content)} min'),
          ],
        ),
      ),
    );
  }
}
