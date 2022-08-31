import 'package:first_test/models/post.dart';
import 'package:first_test/widgets/profle_avatar.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final List<Post> post;

  const PostContainer({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  //    shrinkWrap: true,
      itemCount:post.length,
      itemBuilder:(context,index){
        return Card(
        margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 0.0,
        ),
        elevation: 0.0,
        shape: null,
        child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
        children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        _PostHeader(post: post[index]),
        const SizedBox(height: 4.0),
        Text(post[index].caption),
        post[index].imageUrl != null
        ? const SizedBox.shrink()
            : const SizedBox(height: 6.0),
        ],
        ),
        ),
        post[index].imageUrl != null
        ? Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Image.network(post[index].imageUrl!),
        )
            : const SizedBox.shrink(),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: _PostStats(post: post[index]),
        ),
        ],
        ),
        ),
        );

      },
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.profileImageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Color(0xFF1777F2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
          //  _PostButton(
          //    icon: Icon(
          //      MdiIcons.thumbUpOutline,
          //      color: Colors.grey[600],
          //      size: 20.0,
          //    ),
          //    label: 'Like',
          //    onTap: () => print('Like'),
          //  ),
          //  _PostButton(
          //    icon: Icon(
          //      MdiIcons.commentOutline,
          //      color: Colors.grey[600],
          //      size: 20.0,
          //    ),
          //    label: 'Comment',
          //    onTap: () => print('Comment'),
          //  ),
          //  _PostButton(
          //    icon: Icon(
          //      MdiIcons.shareOutline,
          //      color: Colors.grey[600],
          //      size: 25.0,
          //    ),
          //    label: 'Share',
          //    onTap: () => print('Share'),
          //  )
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: (){},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}