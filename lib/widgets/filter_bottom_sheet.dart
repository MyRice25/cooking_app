import 'package:flutter/material.dart';

class FilterBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lọc',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Color.lerp(
                        const Color(0xffCEA700),
                        Colors.white,
                        0.90,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Đặt lại',
                      style: TextStyle(
                        color: Color(0xffCEA700),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _buildFilterSection("Danh mục", [
                'Danh mục 1',
                'Danh mục 2',
                'Danh mục 3',
                'Danh mục 4',
              ]),
              const SizedBox(height: 8),
              _buildFilterSection("Nguyên liệu", [
                'Thịt gà',
                'Thịt heo',
                'Danh mục',
                'Ức gà',
                'Chân gà',
              ]),
              const SizedBox(height: 8),
              _buildFilterSection("Khu vực", [
                'TP.HCM',
                'Bình Phước',
                'Đồng Nai',
                'An Giang',
                'Long An',
              ]),
              const SizedBox(height: 16),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffCEA700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Xác nhận'),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.flag, size: 16),
            const SizedBox(width: 4),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children:
              options
                  .map(
                    (opt) => FilterChip(
                      label: Text(opt),
                      selected: false,
                      selectedColor: const Color(0xffCEA700),
                      onSelected: (_) {},
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
