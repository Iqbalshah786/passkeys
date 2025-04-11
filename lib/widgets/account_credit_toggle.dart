import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountcreditToggle extends StatefulWidget {
  final Function(bool _isAccount) onToggle;
  final bool initialIsAccount;

  const AccountcreditToggle({
    Key? key,
    required this.onToggle,
    this.initialIsAccount = true,
  }) : super(key: key);

  @override
  State<AccountcreditToggle> createState() => _AccountcreditToggleState();
}

class _AccountcreditToggleState extends State<AccountcreditToggle> {
  late bool _isAccount;

  @override
  void initState() {
    super.initState();
    _isAccount = widget.initialIsAccount;
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
            label: 'Account',
            isSelected: _isAccount,
            onTap: () {
              if (!_isAccount) {
                setState(() {
                  _isAccount = true;
                });
                widget.onToggle(true);
              }
            },
          ),
          _buildToggleOption(
            label: 'Credit',
            isSelected: !_isAccount,
            onTap: () {
              if (_isAccount) {
                setState(() {
                  _isAccount = false;
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
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}