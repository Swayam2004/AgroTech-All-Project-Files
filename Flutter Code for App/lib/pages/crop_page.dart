import 'package:agro_tech/utilities/features/prediction/crop_recommend_controller.dart';
import 'package:agro_tech/utilities/features/prediction/get_prediction.dart';
import 'package:agro_tech/utilities/features/prediction/yield_optimization_controller.dart';
import 'package:agro_tech/widgets/crop_value_text_field.dart';
import 'package:agro_tech/widgets/get_crop_yield_elevated_button.dart';
import 'package:agro_tech/widgets/progress_indicator_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/constants/constants.dart';

class CropTab extends StatefulWidget {
  const CropTab({super.key});

  @override
  State<CropTab> createState() => _CropTabState();
}

class _CropTabState extends State<CropTab> {
  final _cropFormKey = GlobalKey<FormState>();
  final _yieldFormKey = GlobalKey<FormState>();
  final cropRecommendController = Get.put(CropRecommendController());
  final yieldOptimizationController = Get.put(YieldOptimizationController());
  final ScrollController _scrollController = ScrollController();

  bool _isCroploading = false;
  bool _isYieldloading = false;
  var optimizationRate = 0.0;
  final String location = "S Block 17, Bodhanga, Cuttack-08..";
  List<String> predictionResult = ["recommendations appear here"];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                themeColor, // Start color
                themeColor2, // End color
                themeColor
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Crops and Yield',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themeColor2,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: _cropFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CropValueTextField(
                              controller: cropRecommendController.pValue,
                              labelText: 'P Value',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter P Value";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CropValueTextField(
                              controller: cropRecommendController.nValue,
                              labelText: 'N Value',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter N Value";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: CropValueTextField(
                              controller: cropRecommendController.kValue,
                              labelText: 'K Value',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter K Value";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CropValueTextField(
                              controller: cropRecommendController.temperature,
                              labelText: 'Temperature (°C)',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter temperature";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: CropValueTextField(
                              controller: cropRecommendController.humidity,
                              labelText: 'Humidity (%)',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter humidity";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CropValueTextField(
                              controller: cropRecommendController.phLevel,
                              labelText: 'pH Level',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter ph level";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: CropValueTextField(
                              controller: cropRecommendController.rainfall,
                              labelText: 'Rainfall (mm)',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter rainfall";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GetCropYieldElevatedButton(
                              text: 'Get Recommendation',
                              onPressed: _isCroploading
                                  ? null
                                  : () async {
                                      if (_cropFormKey.currentState!
                                          .validate()) {
                                        Map<String, dynamic> inputFeatures = {
                                          "N": double.parse(
                                              cropRecommendController
                                                  .nValue.text),
                                          "P": double.parse(
                                              cropRecommendController
                                                  .pValue.text),
                                          "K": double.parse(
                                              cropRecommendController
                                                  .kValue.text),
                                          "temperature": double.parse(
                                              cropRecommendController
                                                  .temperature.text),
                                          "humidity": double.parse(
                                              cropRecommendController
                                                  .humidity.text),
                                          "rainfall": double.parse(
                                              cropRecommendController
                                                  .rainfall.text),
                                          "ph": double.parse(
                                              cropRecommendController
                                                  .phLevel.text),
                                        };

                                        try {
                                          setState(() {
                                            _isCroploading = true;
                                          });

                                          final result =
                                              await fetchCropRecommendation(
                                                  inputFeatures);

                                          setState(() {
                                            _isCroploading = false;
                                            predictionResult.clear();
                                            predictionResult
                                                .add(result['prediction']);
                                          });
                                        } catch (e) {
                                          Get.snackbar("Error", "Error: $e");
                                        }
                                      }
                                    },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Crops Recommendations',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                (_isCroploading)
                    ? const BarProgressIndicator(
                        numberOfBars: 10,
                        color: themeColor,
                        fontSize: 15.0,
                        barSpacing: 2.0,
                        beginTweenValue: 5.0,
                        endTweenValue: 13.0,
                        milliseconds: 200,
                      )
                    : Column(
                        children: [
                          for (String item in predictionResult)
                            Column(
                              children: [
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: screenWidth,
                                  child: Card(
                                    color: themeColor.withOpacity(0.6),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item[0].toUpperCase() +
                                                item.substring(1),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(cropDescriptions[item]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                const SizedBox(height: 32),
                const Text(
                  'Yield Booster',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Form(
                  key: _yieldFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: yieldOptimizationController.landArea,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter land area";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: themeColor,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: themeColor),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: themeColor, width: 2),
                                ),
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.black87),
                                filled: true,
                                fillColor: themeColor3.withOpacity(0.3),
                                labelText: 'Land Area (hectares)',
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: TextFormField(
                              controller: yieldOptimizationController
                                  .expectedProduction,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter expected production value";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Expected Production (kg)',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          label: Text("Crop Type"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a crop type";
                          } else {
                            return null;
                          }
                        },
                        items: optimizeCrops
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          yieldOptimizationController.cropType.text =
                              value ?? "";
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          label: Text("Select Season"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a season";
                          } else {
                            return null;
                          }
                        },
                        items: season
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          yieldOptimizationController.cropType.text =
                              value ?? "";
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          label: Text("Select State"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a state";
                          } else {
                            return null;
                          }
                        },
                        items: states
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          yieldOptimizationController.cropType.text =
                              value ?? "";
                        },
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GetCropYieldElevatedButton(
                          text: 'Get Optimization Rate',
                          onPressed: _isYieldloading
                              ? null
                              : () async {
                                  if (_yieldFormKey.currentState!.validate()) {
                                    Map<String, dynamic> inputFeatures = {
                                      "Area": double.parse(
                                          yieldOptimizationController
                                              .landArea.text),
                                      "Production": double.parse(
                                          yieldOptimizationController
                                              .expectedProduction.text),
                                      "Crop_Type": yieldOptimizationController
                                          .cropType.text,
                                      "Season": yieldOptimizationController
                                          .season.text,
                                      "State": yieldOptimizationController
                                          .state.text,
                                    };

                                    setState(() {
                                      _isYieldloading = true;
                                    });

                                    try {
                                      final result =
                                          await fetchYieldOptimizationResult(
                                              inputFeatures);

                                      setState(() {
                                        _isYieldloading = false;
                                        optimizationRate = result['prediction'];
                                      });
                                    } catch (e) {
                                      Get.snackbar("Error", "Error: $e");
                                    }
                                  }
                                },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Yield Optimization Results',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    (_isYieldloading)
                        ? const BarProgressIndicator(
                            numberOfBars: 10,
                            color: themeColor,
                            fontSize: 15.0,
                            barSpacing: 2.0,
                            beginTweenValue: 5.0,
                            endTweenValue: 13.0,
                            milliseconds: 200,
                          )
                        : Text(
                            'Optimization Rate: ${optimizationRate.toStringAsFixed(3)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
