import 'package:flutter/material.dart';

class SliverCategoryFilterList extends StatelessWidget {
  const SliverCategoryFilterList({
    Key? key,
    this.categories = const [],
    required this.onSelect,
  }) : super(key: key);

  final List<String> categories;
  final void Function(bool, int) onSelect;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
        child: Row(
          children: categories
              .map(
                (category) => Padding(
              padding: const EdgeInsets.only(left: 8),
              child: FilterChip(
                selected: false,
                onSelected: (selected) => onSelect(
                  selected,
                  categories.indexOf(category),
                ),
                label: Text(category),
              ),
            ),
          )
              .toList(),
        ),
      ),
    ),
  );
}