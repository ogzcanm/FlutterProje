import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_proje/config/extension/contex_extension.dart';
import 'package:flutter_proje/config/utility/enums/image_enum.dart';

import '../../../config/items/app_colors.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.containerColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: context.paddingAllDefault,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Add card',
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: context.dynamicHeight(0.035),
                ),
              ),
              Image.asset(ImageEnum.verticalCard.imagePath),
              SizedBox(
                width: context.dynamicWidth(0.6),
                child: Text(
                  "Add a new card on your wallet for easy life",
                  style: context.textTheme.labelMedium?.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: context.dynamicHeight(0.023),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
