import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/constants/themes.dart';
import 'package:flutter_e_commerce/controllers/product_controller.dart';
import 'package:flutter_e_commerce/widgets/ads_banner_widget.dart';
import 'package:flutter_e_commerce/widgets/chip_widget.dart';
import 'package:flutter_e_commerce/widgets/product_card_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  final imageSvg = "assets/general/store_brand_white.svg";
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final product=ref.watch(provider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: SvgPicture.asset(
          imageSvg,
          color: kWiteColor,
          width: 200,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.local_mall_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              //Banner Ekleme
              AdsBannerWidget(),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    ChipWidget(
                      chipLabel: 'Tümü',
                      chipavatar: Icon(Icons.mobile_friendly),
                    ),
                    ChipWidget(
                      chipLabel: 'Bilgisayarlar',
                      chipavatar: Icon(Icons.computer_sharp),
                    ),
                    ChipWidget(
                      chipLabel: 'Kulakliklar',
                      chipavatar: Icon(Icons.headset_sharp),
                    ),
                    ChipWidget(
                      chipLabel: 'Aksesuarlar',
                      chipavatar: Icon(Icons.inventory),
                    ),
                    ChipWidget(
                      chipLabel: 'Yazıcılar',
                      chipavatar: Icon(Icons.print),
                    ),
                    ChipWidget(
                      chipLabel: 'Kamera',
                      chipavatar: Icon(Icons.photo_camera),
                    )
                  ],
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Yeni Satışlar", style: AppTheme.headText),
                  Text("Tümünü Gör", style: AppTheme.seeAlltext),
                ],
              ),

             Container(
              padding: EdgeInsets.all(4),
              width: double.infinity,
              height: 300,
              
              child: ListView.builder(
                padding: EdgeInsets.all(4),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,

                itemBuilder: (context, index) => ProductCardWidget(index: index,),),
             ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Özel Ürünler", style: AppTheme.headText),
                  Text("Tümünü Gör", style: AppTheme.seeAlltext),
                ],
              ),
              MasonryGridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: product.length,
                shrinkWrap: true,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => SizedBox(
                  height: 250,
                  child: ProductCardWidget(index: index,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
