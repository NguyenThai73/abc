import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staras_manager/constants/assets_location.dart';
import 'package:staras_manager/constants/color_styles.dart';
import 'package:staras_manager/constants/dimensions.dart';
import 'package:staras_manager/constants/strings.dart';
import 'package:staras_manager/features/widgets/horizontal_space.dart';

class SearchEmployee extends StatelessWidget {
  const SearchEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 64,
            child: TextField(
              cursorColor: ColorStyles.darkTitleColor,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(24, context),
                    vertical: scaleHeight(14, context),
                  ),
                  child: SvgPicture.asset(
                    Assets.search,
                  ),
                ),
                hintText: StaticText.searchEmployeePosition,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    scaleRadius(12, context),
                  ),
                  borderSide: const BorderSide(
                    color: ColorStyles.darkTitleColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    scaleRadius(12, context),
                  ),
                  borderSide: const BorderSide(color: ColorStyles.f2f2f3),
                ),
                filled: true,
                fillColor: ColorStyles.f2f2f3,
              ),
            ),
          ),
        ),
        HorizontalSpace(value: 16, ctx: context),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.filter,
          ),
        ),
      ],
    );
  }
}
