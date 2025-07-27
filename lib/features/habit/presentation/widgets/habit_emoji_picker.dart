import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habitroot/core/extension/common.dart';

import '../../../../core/components/core_components.dart';
import '../../../../core/constants/assets.dart';



Future<Emoji?> showEmojiPickerSheet(BuildContext context) async {
  return await showModalBottomSheet<Emoji>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final double _height = MediaQuery.sizeOf(context).height * 0.45;
      final TextEditingController _controller = TextEditingController();
      final ScrollController _scrollController = ScrollController();

      return Container(
        height: _height,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: EmojiPicker(
          textEditingController: _controller,
          scrollController: _scrollController,
          onEmojiSelected: (category, emoji) {
            Navigator.pop(context, emoji);
          },
          config: Config(
            height: _height,
            checkPlatformCompatibility: true,
            viewOrderConfig: const ViewOrderConfig(
              bottom: EmojiPickerItem.searchBar,
              top: EmojiPickerItem.categoryBar,
            ),
            emojiViewConfig: EmojiViewConfig(
              emojiSizeMax: 28 *
                  (defaultTargetPlatform == TargetPlatform.iOS ? 1.2 : 1.0),
              backgroundColor: context.onSecondary,
            ),
            skinToneConfig: const SkinToneConfig(),
            categoryViewConfig: CategoryViewConfig(
              backgroundColor: context.onSecondary,
              iconColor: context.onPrimary.withOpacity(0.5),
              iconColorSelected: context.primary,
              indicatorColor: context.primary,
            ),
            bottomActionBarConfig: const BottomActionBarConfig(enabled: false),
          ),
        ),
      );
    },
  );
}

// class HabitEmojiPicker extends StatefulWidget {
//   const HabitEmojiPicker({
//     super.key,
//     this.onEmojiSelected,
//     this.initialEmojiString,
//   });

//   final void Function(Emoji)? onEmojiSelected;
//   final String? initialEmojiString; // <-- changed from Emoji?

//   @override
//   State<HabitEmojiPicker> createState() => _HabitEmojiPickerState();
// }

// class _HabitEmojiPickerState extends State<HabitEmojiPicker> {
//   late Emoji? emoji;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.initialEmojiString != null) {
//       emoji = Emoji(widget.initialEmojiString!, widget.initialEmojiString!);
//     } else {
//       emoji = null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final selected = await _showEmojiPickerBottomSheet(context);
//         if (selected != null) {
//           setState(() {
//             emoji = selected;
//           });
//           widget.onEmojiSelected?.call(selected);
//         }
//       },
//       child: Center(
//         child: Stack(
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundColor: context.secondaryContainer,
//               child: Text(
//                 emoji?.emoji ?? "🌱",
//                 style: const TextStyle(fontSize: 34),
//               ),
//             ),
//             Positioned.directional(
//               textDirection: TextDirection.ltr,
//               end: 2,
//               bottom: 3,
//               child: Container(
//                 height: 22,
//                 width: 22,
//                 padding: const EdgeInsets.all(2),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: context.secondaryContainer,
//                   border: Border.all(
//                     width: 1,
//                     color: context.secondary,
//                   ),
//                 ),
//                 child: const Center(
//                   child: SvgBuild(
//                     assetImage: Assets.smilePlus,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }


// }
