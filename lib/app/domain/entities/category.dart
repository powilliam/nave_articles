import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.label,
    this.isSelected = false,
  });

  final String label;
  final bool isSelected;

  @override
  List<Object> get props => [label, isSelected];
}

extension CategoryExtension on Category {
  Category copyWith({String? label, bool? isSelected}) => Category(
      label: label ?? this.label, isSelected: isSelected ?? this.isSelected);
}
