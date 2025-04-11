import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/widgets/transfer_payment_top_up_widget.dart';
import '../widgets/CardCarousel.dart';
import '../widgets/account_credit_toggle.dart';
import '../widgets/investment_card_widget.dart';
import '../widgets/quick_transfers_section.dart';
import 'app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isAccount = true;
  bool _isTransfer = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(

        // backgroundColor: Colors.black,
        backgroundColor: const Color(0xFFF4F6FF),
        body: Column(
          children: [
            SizedBox(height:screenHeight < 700 ? 25.h : 50.h),
            AppBarScreen(),

            // Text('hi'),

            // toggle credit and debit
            AccountcreditToggle(
              initialIsAccount: _isAccount,
              onToggle: (_isAccount) {
                setState(() {
                  _isAccount = _isAccount;
                });
                // // Handle the toggle action, e.g., load different data
                // print('Switched to ${isCredit ? "Credit" : "Debit"} mode');
              },
            ),
            SizedBox(height: 12.h),

            //cards
            CardCarousel(),
            SizedBox(height: 16.h),

            // payment type tabs
            Container(
              width: screenHeight < 700 ? 350.w : 360.w,
              height: 50.h,
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                  color: Colors.white
              ),
              child: TransferPaymentTopUpWidget(
                initialIsTransfer: _isTransfer,
                onToggle: (bool _isTransfer) {
                  setState(() {
                    _isTransfer = _isTransfer;
                  });
                },
              ),
            ),

            //quick transfer
            Container(
              width: screenHeight < 700 ? 350.w : 360.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  QuickTransfersSection(),

                ],
              ),
            ),

            //investment ai
            SizedBox(height: 16.h),
            InvestmentCardWidget(),
            ],
        ),
      ),
    );
  }
}





Widget _buildCardInfo() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[700]!, Colors.blue[800]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Current Account',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              IconButton(
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text(
                'PKR ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '10,252,015.15',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const Text(
            'Available Balance',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Naveed Tejani',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'PK012MEZN14265455236356612',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    // child: Image.asset(
                    //   'assets/mastercard.png',
                    //   width: 24,
                    //   height: 24,
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildActionButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(Icons.swap_horiz, 'Funds Transfer', Colors.blue),
        _buildActionButton(Icons.receipt_long, 'Bill payment', Colors.black),
        _buildActionButton(Icons.arrow_upward, 'Top-up', Colors.black),
      ],
    ),
  );
}

Widget _buildActionButton(IconData icon, String label, Color color) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color == Colors.blue ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: color == Colors.blue ? Colors.white : Colors.black,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color == Colors.blue ? Colors.blue : Colors.black,
        ),
      ),
    ],
  );
}

Widget _buildQuickTransfers() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quick transfers',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See more',
                style: TextStyle(color: Colors.blue[600], fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTransferContact(Icons.arrow_forward, 'Send\nMoney', true),
            _buildContactCircle('SS', 'Samia Sajjad', false),
            _buildContactCircle('AI', 'Apple Inc', false),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildContactCircle('KS', 'Khubaiballah', false),
            _buildContactCircle('ZK', 'Zeeshan Khemani', false),
            _buildContactCircle('SS', 'Samia Sajjad', false),
          ],
        ),
      ],
    ),
  );
}

Widget _buildTransferContact(IconData icon, String label, bool isButton) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isButton ? Colors.blue[50] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            icon,
            color: isButton ? Colors.blue : Colors.black54,
            size: 28,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget _buildContactCircle(String initials, String name, bool isSelected) {
  return Column(
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_drop_up,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Text(
        name.split(' ')[0],
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      Text(
        '1234567891234',
        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
      ),
    ],
  );
}

Widget _buildInvestmentBanner() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.pie_chart, color: Colors.purple),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Start investing now!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.purple,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.bolt, color: Colors.white, size: 12),
                          Text(
                            'AI',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Protected savings and investment plans.',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildBottomNavigation() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavItem(Icons.home, 'Home', true),
        _buildNavItem(Icons.credit_card, 'Card', false),
        _buildNavItem(Icons.receipt_long, 'Transaction', false),
        _buildNavItem(Icons.grid_view, 'More', false),
      ],
    ),
  );
}

Widget _buildNavItem(IconData icon, String label, bool isSelected) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: isSelected ? Colors.blue : Colors.grey[600]),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: isSelected ? Colors.blue : Colors.grey[600],
        ),
      ),
    ],
  );
}

// This widget appears in the first screenshot and is a dialog for passkey setup
class PasskeyDialog extends StatelessWidget {
  const PasskeyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.shield_outlined,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Use a Passkey for Stronger Security',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'Passkeys are faster, easier, and safer than passwords. They can\'t be guessed, stolen, or leaked – perfect for protecting your bank account',
              style: TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Setup Passkey'),
            ),
            const SizedBox(height: 12),
            TextButton(onPressed: () {}, child: const Text('No thanks')),
          ],
        ),
      ),
    );
  }
}
