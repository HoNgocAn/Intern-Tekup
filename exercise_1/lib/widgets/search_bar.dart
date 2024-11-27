import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBar({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white, // Nền trắng
        borderRadius: BorderRadius.circular(8), // Bo tròn góc
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Bóng mờ
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2), // Độ lệch bóng
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey, // Icon tìm kiếm
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: (value) => onSearch(value), // Gọi hàm khi nhập
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none, // Không viền
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Hành động khi nhấn nút clear
            },
            icon: const Icon(
              Icons.clear,
              color: Colors.grey, // Icon xóa
            ),
          ),
        ],
      ),
    );
  }
}