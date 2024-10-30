import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatelessWidget {
  final int currentIcon;
  final List<IconModel> icons;
  final ValueChanged<int>? onTap;
  const AnimatedBottomBar({
    super.key,
    required this.currentIcon,
    required this.onTap,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        height: 65,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: icons
              .map(
                (icon) => Expanded(
                  child: GestureDetector(
                    onTap: () => onTap?.call(icon.id),
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        icon.icon,
                        size: currentIcon == icon.id ? 36 : 32,
                        color: currentIcon == icon.id
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class IconModel {
  final IconData icon;
  final int id;

  IconModel({required this.icon, required this.id});
}
