import 'package:flutter/material.dart';
import 'package:profiles/app/models/pictureModel.dart';
import 'package:profiles/app/models/usersModel.dart';
import 'package:cached_network_image/cached_network_image.dart';


class MyCard extends StatelessWidget {
  final Users user; // Assuming User is your model class
  final String fullName;
  final Picture picture; // Assuming you want to pass the full name

  MyCard({
    Key? key,
    required this.user, // Require a user object to be passed
    required this.fullName, required this.picture, // Require full name to be passed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
       leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(user.picture.large),
          child: CachedNetworkImage(
            imageUrl: user.picture.large,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) {
              print("Error loading image: $error");
              return Image.asset(
                'assets/images/avatar.jfif', // Fallback image
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        title: Text(
          fullName.trim().isEmpty ? 'No Name Available' : fullName,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email ?? 'No Email Available'),
            Text(user.phone ?? 'No Phone Available'),
          ],
        ),
      ),
    );
  }
}
