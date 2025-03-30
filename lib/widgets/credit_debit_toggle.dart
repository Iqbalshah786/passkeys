import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditDebitToggle extends StatefulWidget {
  final Function(bool isCredit) onToggle;
  final bool initialIsCredit;

  const CreditDebitToggle({
    Key? key,
    required this.onToggle,
    this.initialIsCredit = true,
  }) : super(key: key);

  @override
  State<CreditDebitToggle> createState() => _CreditDebitToggleState();
}

class _CreditDebitToggleState extends State<CreditDebitToggle> {
  late bool _isCredit;

  @override
  void initState() {
    super.initState();
    _isCredit = widget.initialIsCredit;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 6.h), // responsive padding
      width: 165.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.h),
      ),
      child: Row(
        children: [
          _buildToggleOption(
            label: 'Credit',
            isSelected: _isCredit,
            onTap: () {
              if (!_isCredit) {
                setState(() {
                  _isCredit = true;
                });
                widget.onToggle(true);
              }
            },
          ),
          _buildToggleOption(
            label: 'Debit',
            isSelected: !_isCredit,
            onTap: () {
              if (_isCredit) {
                setState(() {
                  _isCredit = false;
                });
                widget.onToggle(false);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF4361EE) : Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF121212),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}