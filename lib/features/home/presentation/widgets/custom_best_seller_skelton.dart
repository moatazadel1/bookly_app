import 'package:bookly_app/core/widgets/skelton.dart';
import 'package:flutter/material.dart';

class CustomBestSellerSkelton extends StatelessWidget {
  const CustomBestSellerSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skelton(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.12,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              // height: MediaQuery.sizeOf(context).height * 0.09,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skelton(
                    width: MediaQuery.sizeOf(context).width * .45,
                    child: Container(
                      height: 15,
                      color: Colors.grey.withOpacity(.1),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Skelton(
                    width: MediaQuery.sizeOf(context).width * .3,
                    child: Container(
                      height: 15,
                      color: Colors.grey.withOpacity(.1),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Skelton(
                    width: MediaQuery.sizeOf(context).width * .47,
                    child: Container(
                      height: 15,
                      color: Colors.grey.withOpacity(.1),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
