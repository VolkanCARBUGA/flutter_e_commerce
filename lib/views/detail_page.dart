import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/constants/themes.dart';
import 'package:flutter_e_commerce/controllers/product_controller.dart';
import 'package:flutter_e_commerce/views/home_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';


class DetailsPage extends ConsumerWidget {
  int getIndex;
   DetailsPage({super.key,required this.getIndex});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index=ref.watch(currentIndexProvider);
     final product = ref.watch(proudctNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimarycolor,
          title: Text(
            "Detay Sayfası",
            style: AppTheme.apptitle,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.local_mall,
                    color: kWiteColor,
                  )),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kLightBackground,
                    borderRadius: BorderRadius.circular(15),
                    shape: BoxShape.rectangle,
                    border: const Border(
                        bottom: BorderSide(width: 2, color: kSecondaryColor),
                        top: BorderSide(width: 2, color: kSecondaryColor),
                        right: BorderSide(width: 2, color: kSecondaryColor),
                        left: BorderSide(width: 2, color: kSecondaryColor))),
                child: Image.asset(
                  product[getIndex].imgUrl,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
             
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(product[getIndex].title,
                      style: AppTheme.productNameTitle
                          .copyWith(color: kPrimarycolor, fontSize: 20)),
                  Row(
                    children: [
                      RatingBar(
                          itemSize: 25,
                          unratedColor: Colors.amber,
                          initialRating: product[getIndex].rating,
                          minRating: 0.1,
                          maxRating: 5,
                          allowHalfRating: true,
                          ratingWidget: RatingWidget(
                              full: Icon(Icons.star, color: kyellowCoolor),
                              half: Icon(Icons.star_half_sharp,
                                  color: kyellowCoolor),
                              empty: Icon(
                                Icons.star_border,
                                color: kyellowCoolor,
                              )),
                          onRatingUpdate: (value) => {}),
                      Gap(12),
                      Text(
                        product[getIndex].review.toString(),
                        style: AppTheme.bodyText.copyWith(color: kyellowCoolor),
                      )
                    ],
                  ),
                  Text(
                    product[getIndex].longDescription,
                    style: AppTheme.descriptionText,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product[getIndex].price*product[getIndex].qty}",
                        style: AppTheme.bigTitle
                            .copyWith(color: kSecondaryColor, fontSize: 20),
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  ref.read(proudctNotifierProvider.notifier).incrementQty(product[getIndex].pid);
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  size: 30,
                                  color: kSecondaryColor,
                                )),
                            Text(
                              product[getIndex].qty.toString(),
                              style: AppTheme.bigTitle.copyWith(
                                  color: kSecondaryColor, fontSize: 20),
                            ),
                            IconButton(
                                onPressed: () {
                                  ref.read(proudctNotifierProvider.notifier).decreaseQty(product[getIndex].pid);
                                },
                                icon: Icon(
                                  Icons.do_not_disturb_on_outlined,
                                  size: 30,
                                  color: kSecondaryColor,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimarycolor,
                      minimumSize: Size(double.infinity, 50),

                    ),
                      onPressed: () {},
                      child: Text(
                        "Sepete Ekle ",
                        style: AppTheme.cardTitle
                            .copyWith(color:kWiteColor, fontSize: 20),
                      ),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimarycolor,
          unselectedItemColor: kSecondaryColor,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            ref.read(currentIndexProvider.notifier).update((state) => value);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "Anasayfa",
                activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: "Favoriler",
                activeIcon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: "Konum",
                activeIcon: Icon(Icons.location_on)),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: "Bildirimler",
                activeIcon: Icon(Icons.notifications)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profil",
                activeIcon: Icon(Icons.person)),
          ]),
    );
  }
}
