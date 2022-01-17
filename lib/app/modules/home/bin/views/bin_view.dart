import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smart_bin_app/app/shared/constants/app_colors.dart';

import '../controllers/bin_controller.dart';

class BinView extends GetView<BinController> {
  const BinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 15.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 15.0),
                  const Text(
                    'Bin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15.0),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Status',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Icon(Icons.history),
                                  onTap: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Fullness',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10.0),
                                  LinearPercentIndicator(
                                    percent: 0.5,
                                    progressColor: Colors.red,
                                    lineHeight: 15,
                                    trailing: Text('${50}%'),
                                    padding: const EdgeInsets.only(right: 18.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '156',
                                            style: TextStyle(fontSize: 32),
                                          ),
                                          Text('gr'),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text('Current Weight'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 75,
                                  child: VerticalDivider(
                                    color: AppColors.black,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '5',
                                            style: TextStyle(fontSize: 32),
                                          ),
                                          Text('cm'),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text('Height Left'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Device Info',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListTile(
                          title: const Text('Device ID'),
                          trailing: Text('1234567890'),
                          visualDensity: VisualDensity(vertical: -4),
                        ),
                        ListTile(
                          title: const Text('Model'),
                          trailing: Text('XDCA'),
                          visualDensity: VisualDensity(vertical: -4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
