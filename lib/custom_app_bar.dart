import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final bool showActionMenu;
  final VoidCallback? onBtnClicked;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.leading,
    this.titleWidget,
    this.showActionMenu = false,
    this.onBtnClicked,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25 / 2.5,
        ),
        child: Stack(
          children: [
            // Title widget yoki textni qo'shish
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50), // Chap va o'ngdan cheklov
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,  // Max qatorlarni cheklash
                    overflow: TextOverflow.ellipsis, // Uzun matn uchun "..." bilan cheklash
                  ),
                ),
              )
                  : Center(child: titleWidget),
            ),
            // Leading va Action Menu qo'yish
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: const BackButton(color: Colors.white),
                    ),
                if (showActionMenu)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: InkWell(
                      onTap: onBtnClicked,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.navigate_next, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
    double.maxFinite,
    88,
  );
}
