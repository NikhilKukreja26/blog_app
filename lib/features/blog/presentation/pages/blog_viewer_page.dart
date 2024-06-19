import 'package:blog_app/common.dart';
import 'package:blog_app/core/utils/calculate_reading_time.dart';
import 'package:blog_app/core/utils/format_date.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';

class BlogViewerPage extends StatelessWidget {
  const BlogViewerPage({
    super.key,
    required this.blog,
  });
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: context.titleLarge?.copyWith(
                    fontSize: FontSizeManager.s24,
                  ),
                ),
                SizedBox(height: AppHeight.h20),
                Text(
                  '${blog.posterName}',
                  style: context.titleMedium,
                ),
                SizedBox(height: AppHeight.h6),
                Text(
                  '${formatDateBydMMMYYYY(blog.updatedAt)} . ${calculateReadingTime(blog.content)} min',
                  style: context.titleMedium?.copyWith(
                    color: AppPalette.greyColor,
                  ),
                ),
                SizedBox(height: AppHeight.h20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppBorderRadius.r10),
                  child: Image.network(
                    blog.imageUrl,
                    height: AppHeight.h240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: AppHeight.h20),
                Text(
                  blog.content,
                  style: context.bodyLarge?.copyWith(
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
