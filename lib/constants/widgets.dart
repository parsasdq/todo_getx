import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/constants/colors.dart';
import 'package:getx/constants/style.dart';

enum textstyle { tittle, subtittle }

class MyListTile extends StatelessWidget {
  final String text;
  final String subtext;
  final ValueChanged oncheckboxchange;
  final bool val;
  final VoidCallback ondeletetap;
  final VoidCallback ontap;
  const MyListTile(
      {required this.text,
      super.key,
      required this.subtext,
      required this.oncheckboxchange,
      required this.ondeletetap,
      required this.val,
      required this.ontap,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      
        margin: EdgeInsets.only(right: 10, top: 10, left: 10),
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey
        ),
        child: ListTile(
          onTap: ontap,
          textColor: Colors.black,
          title: Text(this.text),
          subtitle: Text(this.subtext),
          titleTextStyle: TittleStyleblack,
          subtitleTextStyle: SubTittlegray,
          trailing: Checkbox(
            value: val,
            onChanged: oncheckboxchange,
            activeColor: MYgrey,
            checkColor: Colors.white,
          ),
          leading: IconButton(onPressed: ondeletetap, icon: Icon(Icons.delete)),
        ));
  }
}

class MYTextfield extends StatelessWidget {
  final String hint;
  final Color? color;
  final TextEditingController? controller;
  const MYTextfield({
    this.controller,
    this.color,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.hint,
              style: this.color == null
                  ? SubTittlegray
                  : TextStyle(
                      color: this.color,
                    )),
          TextField(
            controller: this.controller,
            cursorColor: MYgrey,
            cursorHeight: 35,
          )
        ],
      ),
    );
  }
}

class MYText extends StatelessWidget {
  final String text;
  final Color? color;
  final textstyle style;
  const MYText({
    required this.text,
    required this.style,
    super.key,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Text(
        this.text,
        style: this.style == textstyle.tittle
            ? TextStyle(
                color: color != null ? this.color : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )
            : TextStyle(
                color: color != null ? color : Colors.black,
                fontWeight: FontWeight.w200,
                fontSize: 16,
              ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MYIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  const MYIcon({super.key, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Icon(
        this.icon,
        color: color != null ? color : Colors.black,
        size: 22,
      ),
    );
  }
}

class MYListItem extends StatelessWidget {
  final String tittle;
  final String subtittle;
  final IconData icon;
  final VoidCallback ontap;
  final Color? iconcolor;
  const MYListItem({
    super.key,
    required this.tittle,
    required this.icon,
    required this.subtittle,
    required this.ontap,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(15),
        width: Get.width * 1 / 2 - 30,
        height: 150,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    this.icon,
                    color: iconcolor == null ? MYgrey : iconcolor,
                    size: 45,
                  ),
                  Column(
                    children: [
                      MYText(text: this.tittle, style: textstyle.tittle),
                      Row(
                        children: [
                          MYIcon(icon: Icons.task_alt),
                          MYText(
                            text: this.subtittle,
                            style: textstyle.subtittle,
                            color: MYgrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
