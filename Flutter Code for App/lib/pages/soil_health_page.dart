import 'package:flutter/material.dart';
import '../utilities/constants/constants.dart';

class SoilHealthTab extends StatefulWidget {
  const SoilHealthTab({super.key});

  @override
  State<SoilHealthTab> createState() => _SoilHealthTabState();
}

class _SoilHealthTabState extends State<SoilHealthTab> {
  final String location = "S Block 17, Bodhanga, Cuttack-08..";
  final ScrollController _scrollController = ScrollController();

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
      backgroundColor: Colors.white,
      body: Container(
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
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Soil Health',
                  style: TextStyle(
                    color: themeColor2,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/soil_health_cover.png',
                  width: screenWidth,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: 300),
                    _buildSection(
                      title: 'Soil Moisture Content',
                      content:
                          'The soil moisture content is adequate. Ensure regular irrigation to maintain this level.',
                      imageUrl: 'assets/soil moisture.png',
                      currentData: '30%',
                    ),
                    _buildSection(
                      title: 'pH Levels',
                      content:
                          'The soil pH level is slightly acidic. Consider adding lime to raise pH level.',
                      imageUrl: 'assets/pH level.png',
                      currentData: '6.5',
                    ),
                    _buildSection(
                      title: 'NPK Concentrations',
                      content:
                          'The NPK values are suitable, but increase Nitrogen if growth is weak and regularly test soil for adjustments.',
                      imageUrl: null,
                      currentData: null,
                      isNpkSection: true,
                    ),
                    const SizedBox(height: 48),
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

Widget _buildSection({
  required String title,
  required String content,
  String? imageUrl,
  String? currentData,
  bool isNpkSection = false,
}) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.only(bottom: 16.0),
    decoration: BoxDecoration(
      color: themeColor.withOpacity(0.6),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              if (currentData != null)
                Text(
                  'Current $title: $currentData',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 8.0),
              Text(
                content,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 16.0),
              if (isNpkSection)
                Column(
                  children: [
                    _buildNpkItem(
                      label: 'Nitrogen',
                      value: '60 kg/ha',
                      color: Colors.red,
                    ),
                    _buildNpkItem(
                      label: 'Phosphorus',
                      value: '30 kg/ha',
                      color: Colors.green,
                    ),
                    _buildNpkItem(
                      label: 'Potassium',
                      value: '40 kg/ha',
                      color: Colors.blue,
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        if (imageUrl != null)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
      ],
    ),
  );
}

Widget _buildNpkItem({
  required String label,
  required String value,
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Text(
            label.substring(0, 1).toUpperCase(),
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          '$label: $value',
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    ),
  );
}
