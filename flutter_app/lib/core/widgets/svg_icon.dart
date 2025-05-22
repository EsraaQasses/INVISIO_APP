import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

//  اللي منسحبن بكون شكلهن شكل ايقونة رسم وعادتا بتكون لون واحد svg عادتا ال
// ولكن ممكن تجي ايقونات معقدة مارح نشملها هلأ هي منحطا متل ماهية
// البوتوم ناف بار اذا حطينا ايقونات عادية انا فيني  فوت عالثيم قلو السيليكتد كولور لونو أخضر
// لحالا الايقونة بتتغير لأخضر أما اذا حطيت اس في جي فيني غير لون الاس في جي لأخضر بشكل أوتوماتيكي لأ لهيك عملت كلاس لخلي الاس في جي يتعامل معاملة الايقونة تماما

class SvgIcon extends StatelessWidget {
  // بتاخد اخضر عند اللون الغعال
  final SvgGenImage icon; // بمرقو ك اس في جي جين هي يلي ولدتا من فلاتر جين
  // كيف جبت نوعا رحت عالناف بار شفت ايقونة الهوم مثلا لاقيت نوعا اس في جي جين امج ف كتبتو لانو انا بدي خزن فيهاهدول القيم اللي هنن رسمات
  final Color? color;
  final double size;

  const SvgIcon({
    super.key,
    required this.icon,
    this.color,
    this.size = 23,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ?? IconTheme.of(context).color!;
    return SizedBox(
      height: size,
      width: size,
      child: icon.svg(
        colorFilter: ColorFilter.mode(
            effectiveColor,
            BlendMode
                .srcATop), // الاس ار سي اي توب بتاخد اللون بتحطو محل ما صار في رسم بقلب الصورة
      ),
    );
  }
}
