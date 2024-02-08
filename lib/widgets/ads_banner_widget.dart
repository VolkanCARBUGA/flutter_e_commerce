import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/constants/themes.dart';
import 'package:gap/gap.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 10,left: 10),
      decoration: BoxDecoration(
        color: kPrimarycolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Uygulama Mağazası", style: AppTheme.bigTitle),
                 const Gap( 10,color: Colors.black,),
                  Text(
                      "Aradığınız Apple ürününü ve aksesuarlarını bulun",
                      style: AppTheme.bodyText.copyWith(
                        color: kWiteColor,
                      )),
                      const Gap(5,color: Colors.black,),
                  ElevatedButton(
                    onPressed: () {},
                    child:
                        Text("Yeni Yıl alışverişi", style: AppTheme.bodyText),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kWiteColor,
                        foregroundColor: kSecondaryColor),
                  )
                ],
              )),
          Image.asset(
            "assets/general/landing.png",
           
          )
        ],
      ),
    );
  }
}
