import 'package:flutter/material.dart';

const _avatarSize = 48.0;

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.photo}) : super(key: key);

  final String photo;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: _avatarSize,
        backgroundImage: NetworkImage(photo),
        child: const Icon(Icons.person_outline, size: _avatarSize));
  }
}
