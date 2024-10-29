import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavItem> items;
  final List<BottomNavItem> selectedItems;
  final int selectedIndex;
  final double indicatorWidth;
  final double indicatorThickness;
  final Color? color;
  final double? fontSize;
  final double? activeFontSize;
  final double? iconSize;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.selectedItems,
    this.indicatorWidth = 56,
    this.indicatorThickness = 4,
    this.color,
    this.fontSize,
    this.activeFontSize,
    this.iconSize,
    required this.onTap,
  }) : assert(items.length >= 2);

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / items.length;

    return Stack(
      children: [
        Container(
          height: 90,
          padding: const EdgeInsets.only(bottom: 18),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.white10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (index) {
              return Expanded(
                child: InkWell(
                  onTap: () {
                    // _onItemTapped(index);
                    onTap(index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Icon(
                        selectedIndex == index
                            ? selectedItems[index].icon
                            : items[index].icon,
                        size: iconSize ?? 28,
                        color: selectedIndex == index
                            ? color ?? Theme.of(context).primaryColor
                            : Colors.black45,
                      ),
                      const SizedBox(height: 4),
                      AnimatedDefaultTextStyle(
                        style: TextStyle(
                            color: selectedIndex == index
                                ? color ?? Theme.of(context).primaryColor
                                : Colors.black45,
                            fontWeight: FontWeight.w600,
                            fontSize: selectedIndex == index
                                ? activeFontSize ?? 15
                                : fontSize ?? 14),
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          items[index].label,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          left: selectedIndex * itemWidth +
              (itemWidth / 2 - (indicatorWidth / 2)),
          top: 0,
          child: Container(
            decoration: BoxDecoration(
                color: color ?? Theme.of(context).primaryColor,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(12))),
            width: 56,
            height: 4,
          ),
        ),
      ],
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final String label;

  BottomNavItem({required this.icon, required this.label});
}
