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
                                const Expanded(
                                  child: Text(
                                    'Status',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Obx(() {
                                  return (controller.isRefreshLoading.value)
                                      ? const CircularProgressIndicator()
                                      : InkWell(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: const Icon(Icons.refresh),
                                          onTap: controller.onGetData,
                                        );
                                }),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Obx(() {
                              final heightPercentage =
                                  controller.data.value?.heightPercentage;
                              final weightPercentage =
                                  controller.data.value?.weightPercentage;
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      CircularPercentIndicator(
                                        percent: (weightPercentage ?? 0) / 100,
                                        progressColor:
                                            ((weightPercentage ?? 0) >= 100)
                                                ? Colors.red
                                                : AppColors.blue,
                                        radius: 108,
                                        center: (weightPercentage == null)
                                            ? const CircularProgressIndicator()
                                            : Text(
                                                '$weightPercentage%',
                                                style: const TextStyle(
                                                    fontSize: 28),
                                              ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Weight'),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 100,
                                    child: VerticalDivider(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      CircularPercentIndicator(
                                        percent: (heightPercentage ?? 0) / 100,
                                        progressColor:
                                            ((heightPercentage ?? 0) >= 100)
                                                ? Colors.red
                                                : AppColors.blue,
                                        radius: 108,
                                        center: (heightPercentage == null)
                                            ? const CircularProgressIndicator()
                                            : Text(
                                                '$heightPercentage%',
                                                style: const TextStyle(
                                                    fontSize: 28),
                                              ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Height'),
                                    ],
                                  ),
                                ],
                              );
                            }),
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
                          style: ListTileStyle.list,
                          title: const Text(
                            'Device ID',
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: Text(
                            controller.deviceId,
                            style: const TextStyle(fontSize: 16),
                          ),
                          visualDensity: const VisualDensity(vertical: -4),
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
