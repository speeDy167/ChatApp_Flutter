import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/widgets/reuse_widgets.dart';
import 'package:flutter/material.dart';

class GroupProfile extends StatefulWidget {
  final String userName;
  final String groupId;
  final String groupName;
  const GroupProfile({
    Key? key,
    required this.groupId,
    required this.groupName,
    required this.userName,
  }) : super(key: key);

  @override
  State<GroupProfile> createState() => _GroupProfileState();
}

class _GroupProfileState extends State<GroupProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            ChatPage(
                groupId: widget.groupId,
                groupName: widget.groupName,
                userName: widget.userName));
      },
      child: Container(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar_acc.jpg"),
            radius: 35,
          ),
          title: Text("${widget.groupId}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.left),
          subtitle: Text(
            "Enter chat as ${widget.userName}",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
