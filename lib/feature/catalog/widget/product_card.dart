import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/product.dart';
import 'package:test_xpage/core/theme/icons.dart';
import 'package:test_xpage/core/theme/text_style.dart';

/// Настраиваемый виджет карточки для отображения информации о продукте

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final Product product; // Товар для которого предназначена карточка

  @override
  Widget build(final BuildContext context) {
    final double widthCard = (MediaQuery.of(context).size.width - 64) / 2;

    return Container(
      height: 270,
      width: widthCard,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Изображение продукта, кнопка избранное и рейтинг
          Stack(
            children: <Widget>[
              SizedBox(
                height: 112,
                width: widthCard,
                child: Image(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 16,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: IconButton(
                    onPressed: () {
                      product.isFavorite = !product.isFavorite;
                    },
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    ),
                    icon: SvgPicture.asset(
                      product.isFavorite ? AppIcons.fullHeart : AppIcons.emptyHeart,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(Color(0xFFFF8B19), BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 8,
                child: _productRate(product.rate),
              ),
            ],
          ),

          // Детали продукта
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 158,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 12),
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: product.name.length < 10 ? AppTextStyle.productName : AppTextStyle.productNameS,
                ),
                const SizedBox(height: 10),
                Text(
                  '${product.price} ${product.units}',
                  style: AppTextStyle.price,
                ),
                const SizedBox(height: 4),
                if (product.discountedPrice != product.price)
                  Text(
                    '${product.discountedPrice} ${product.units}',
                    style: AppTextStyle.discountPrice,
                  ),
                const Spacer(),
                SizedBox(
                  height: 36,
                  child: FilledButton(
                    onPressed: () {},
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFF8B19))),
                    child: SvgPicture.asset(
                      AppIcons.cart,
                      width: 24,
                      height: 20,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _productRate(final int rate) {
  final Color green = Color(0xFFACC800);
  final Color orange = Color(0xFFFFB657);

  return SizedBox(
    width: 17,
    height: 9,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 2,
          height: 6,
          color: rate >= 1
              ? rate >= 3
                  ? green
                  : orange
              : Colors.white,
        ),
        Container(
          width: 2,
          height: 7,
          color: rate >= 2
              ? rate >= 3
                  ? green
                  : orange
              : Colors.white,
        ),
        Container(
          width: 2,
          height: 8,
          color: rate >= 3 ? green : Colors.white,
        ),
        Container(
          width: 2,
          height: 9,
          color: rate == 4 ? green : Colors.white,
        ),
      ],
    ),
  );
}
