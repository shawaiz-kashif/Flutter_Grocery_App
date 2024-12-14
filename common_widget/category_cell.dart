import 'package:flutter/material.dart';
import '../common/color_extension.dart';

// class CategoryCell extends StatelessWidget {
//   final Map pObj;
//   final VoidCallback onPressed;

//   const CategoryCell({
//     super.key,
//     required this.pObj,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         width: 250,
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: (pObj["color"] as Color? ?? TColor.primary).withOpacity(0.3),
//           border:
//               Border.all(color: TColor.placeholder.withOpacity(0.5), width: 1),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   pObj["icon"],
//                   width: 70,
//                   height: 70,
//                   fit: BoxFit.contain,
//                 ),
//                 const SizedBox(
//                     width: 15), // Horizontal space between icon and text
//                 Expanded(
//                   child: Text(
//                     pObj["name"],
//                     style: TextStyle(
//                       color: TColor.primaryText,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     overflow: TextOverflow.ellipsis, // To handle long text
//                   ),
//                 ),
//               ],
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
class CategoryCell extends StatelessWidget {
  final Map pObj;
  final VoidCallback onPressed;

  const CategoryCell({
    super.key,
    required this.pObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    print("pObj: $pObj");
    String name = pObj["name"] ?? "Unknown";
    String icon = pObj["icon"] ?? "assets/img/default.png";
    Color color = (pObj["color"] as Color? ?? TColor.primary).withOpacity(0.3);

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          border:
              Border.all(color: TColor.placeholder.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error, size: 70, color: Colors.red);
                  },
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
