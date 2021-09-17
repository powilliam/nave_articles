import 'package:flutter/material.dart';
import 'package:nave_articles/app/domain/entities/category.dart';
import 'package:nave_articles/app/presentation/utils/string.dart';

class SliverCategoryFilterList extends StatelessWidget {
  const SliverCategoryFilterList({
    Key? key,
    this.categories = const [],
    required this.onSelect,
  }) : super(key: key);

  final List<Category> categories;
  final void Function(bool, Category) onSelect;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: categories.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                  child: Row(
                    children: categories
                        .map(
                          (category) => Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: FilterChip(
                              selected: category.isSelected,
                              onSelected: (selected) => onSelect(
                                selected,
                                category,
                              ),
                              label: Text(category.label.capitalize()),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
        ),
      );
}
