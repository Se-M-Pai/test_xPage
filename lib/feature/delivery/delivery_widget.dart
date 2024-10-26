import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_xpage/core/theme/icons.dart';
import 'package:test_xpage/core/theme/text_style.dart';
import 'package:test_xpage/feature/delivery/delivery_model.dart';
import 'package:test_xpage/feature/delivery/delivery_wm.dart';
import 'package:test_xpage/feature/shopping_cart/widget/cart_button_mini.dart';

class DeliveryWidget extends ElementaryWidget<IDeliveryWM> {
  const DeliveryWidget({super.key}) : super(deliveryWMFactory);

  @override
  Widget build(final IDeliveryWM wm) => EntityStateNotifierBuilder<DeliveryState>(
        listenableEntityState: wm.deliveryState,
        builder: (final BuildContext context, final DeliveryState? state) => SizedBox(
          height: 92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 36,
                child: state != DeliveryState.selfDelivery
                    ? Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: Color(0xFFACC800),
                            child: Center(
                              child: Text('Доставка', style: AppTextStyle.white14b),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: Color(0xFFF8F8F8),
                            child: InkWell(
                              onTap: () {
                                wm.change(DeliveryState.selfDelivery);
                              },
                              child: Center(
                                child: Text('Забери сам', style: AppTextStyle.black14l),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: Color(0xFFF8F8F8),
                            child: InkWell(
                              onTap: () {
                                wm.change(DeliveryState.delivery);
                              },
                              child: Center(
                                child: Text('Доставка', style: AppTextStyle.black14l),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: Color(0xFFACC800),
                            child: Center(
                              child: Text('Забери сам', style: AppTextStyle.white14b),
                            ),
                          ),
                        ],
                      ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    state == DeliveryState.delivery
                        ? TextButton.icon(
                            onPressed: () {
                              // ToDo по нажатию открывается карта с указанием адреса доставки
                              log('Адрес');
                            },
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                            ),
                            label: Text('ул. Родионова, 13', style: AppTextStyle.black14),
                            iconAlignment: IconAlignment.end,
                            icon: SvgPicture.asset(
                              AppIcons.edit,
                              width: 13,
                              height: 13,
                              colorFilter: ColorFilter.mode(Color(0xFFC3C3C3), BlendMode.srcIn),
                            ),
                          )
                        : SizedBox(),
                    const CartButtonMini(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
