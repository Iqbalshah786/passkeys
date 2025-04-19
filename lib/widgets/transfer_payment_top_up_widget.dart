import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransferPaymentTopUpWidget extends StatefulWidget {
  final bool initialIsTransfer;
  final Function(bool) onToggle;

  const TransferPaymentTopUpWidget({
    Key? key,
    required this.initialIsTransfer,
    required this.onToggle,
  }) : super(key: key);

  @override
  State<TransferPaymentTopUpWidget> createState() => _TransferPaymentTopUpWidgetState();
}

enum ToggleOption { transfer, payment, topUp }

class _TransferPaymentTopUpWidgetState extends State<TransferPaymentTopUpWidget> {
  ToggleOption _selectedOption = ToggleOption.transfer;

  @override
  void initState() {
    super.initState();
    // Set initial state based on the passed value
    _selectedOption = widget.initialIsTransfer
        ? ToggleOption.transfer
        : ToggleOption.payment; // Default to payment if not transfer
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,

      child: Row(
        children: [
          _buildToggleButton(
            text: 'Funds Transfer',
            isSelected: _selectedOption == ToggleOption.transfer,
            onTap: () => _updateSelection(ToggleOption.transfer),
          ),
          // SizedBox(width: 16.w),
          _buildToggleButton(
            text: 'Bill payment',
            isSelected: _selectedOption == ToggleOption.payment,
            onTap: () => _updateSelection(ToggleOption.payment),
          ),
          // SizedBox(width: 16.w),
          _buildToggleButton(
            text: 'Top-up',
            isSelected: _selectedOption == ToggleOption.topUp,
            onTap: () => _updateSelection(ToggleOption.topUp),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF4169E1) : Colors.transparent,
            borderRadius: BorderRadius.circular(4.r),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.white : Color(0xff121212),
            ),
          ),
        ),
      ),
    );
  }

  void _updateSelection(ToggleOption option) {
    setState(() {
      _selectedOption = option;
    });

    // Call the onToggle callback with true if transfer is selected, false otherwise
    widget.onToggle(_selectedOption == ToggleOption.transfer);
  }
}