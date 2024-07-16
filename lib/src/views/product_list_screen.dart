import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:malltiverse/app_theme.dart';
import 'package:malltiverse/models/product_list_model.dart';
import 'package:malltiverse/src/controllers/product_list_controller.dart';
import 'package:malltiverse/utils/app__export.dart';
import 'package:malltiverse/utils/image_constant.dart';
import 'package:malltiverse/widgets/custom_bottom_navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductsController controller = Get.put(ProductsController());
  int _currentIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
      // Handle navigation based on index if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.0, top: 8.0, bottom: 8.0),
          child: Image.asset(
            ImageConstant.mallTiverseLogo,
            height: 31.0,
            width: 99.0,
          ),
        ),
        title: Text(
          'Product List',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 19.0,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildPromoBanner(),
                buildCategorySection(
                  context,
                  'Tech Gadgets',
                  controller.techGadgets,
                ),
                buildCategorySection(
                  context,
                  'Men\'s Fashion',
                  controller.mensFashion,
                ),
                buildCategorySection(
                  context,
                  'Women\'s Fashion',
                  controller.womensFashion,
                ),
              ],
            ),
          );
        }
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onNavBarTap,
        ),
      ),
    );
  }

  Widget buildPromoBanner() {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.only(left: 24.0, right: 24.0),
        color: appTheme.gray400,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Container(
          height: 232.0,
          width: double.maxFinite,
          decoration: AppDecoration.fillGray400
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgHeadphonesNew,
                height: 338.0,
                width: double.maxFinite,
                radius: BorderRadius.circular(10.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Premium Sound, \nPremium Savings',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeGray50.copyWith(height: 1.40),
                    ),
                    SizedBox(height: 6.0,),
                    Text('Limited offer, hope on and get yours now',
                    style: CustomTextStyles.labelLargeGray50,)
                  ],
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection(
      BuildContext context, String categoryName, List<ProductsModel> products) {
    int numPages = (products.length / 2).ceil();
    List<Widget> pages = [];
    PageController pageController = PageController();
    RxInt activeIndex = 0.obs;

    for (int i = 0; i < numPages; i++) {
      pages.add(
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2 / 3,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            int actualIndex = i * 2 + index;
            if (actualIndex >= products.length) return Container();
            final product = products[actualIndex];
            return buildProductCard(product);
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              categoryName,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 8),
          CarouselSlider(
            items: pages,
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 0,
              onPageChanged: (index, reason) {
                activeIndex.value = index % 3;
              },
            ),
          ),
          SizedBox(height: 10),
          Center(child: Obx(() => buildSmoothPageIndicator(activeIndex.value))),
        ],
      ),
    );
  }

  Widget buildProductCard(ProductsModel product) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                product.imageUrl.isNotEmpty
                    ? product.imageUrl
                    : 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '₦${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green[700],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RatingBarIndicator(
              // rating: product.rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.red),
              ),
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmoothPageIndicator(int activeIndex) {
    List<Color> colors = [Colors.red, Colors.green, Colors.blue];
    return SmoothPageIndicator(
      controller: PageController(),
      count: 3,
      effect: WormEffect(
        dotHeight: 8.0,
        dotWidth: 8.0,
        activeDotColor: colors[activeIndex],
      ),
    );
  }
}
