import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: Text('Home Page'));
    return Stack(
      children: [
        // Banner cong trên cùng
        ClipPath(
          clipper: BannerClipper(),
          child: Container(
            height: 180,
            width: double.infinity,
            color: Colors.deepPurple,
            child: Image.asset(
              'assets/images/home_banner.jpg', // Đường dẫn ảnh
              fit: BoxFit.cover, // Đảm bảo ảnh bao phủ toàn bộ
            ),
          ),
        ),

        // Nội dung trang chủ
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 200, left: 16, right: 16),
            child: Align(
              alignment: Alignment.centerLeft, // Căn toàn bộ về trái
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400, // Màu nền
                          borderRadius: BorderRadius.circular(
                            28,
                          ), // Bo tròn viền
                        ),
                        child: Icon(
                          LineIcons.user,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Colors.grey.shade400,
                      //   radius: 30,
                      //   child: Icon(
                      //     LineIcons.user,
                      //     color: Colors.white,
                      //     size: 30,
                      //   ),
                      //   // backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      // ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Khuyến mãi 100% ngày vàng nạp',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400, // Màu nền
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // Bo tròn viền
                        ),
                        child: Icon(
                          LineIcons.search,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 12),
                      Stack(
                        clipBehavior:
                            Clip.none, // Cho phép phần tử con vượt ra ngoài Stack
                        children: [
                          // Nút icon chuông
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400, // Màu nền
                              borderRadius: BorderRadius.circular(
                                20,
                              ), // Bo tròn viền
                            ),
                            child: Icon(
                              LineIcons.bell,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),

                          // Số thông báo màu đỏ
                          Positioned(
                            right: -6,
                            top: -16, // Dịch lên một chút
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.red, // Màu nền thông báo
                                shape: BoxShape.circle, // Hình tròn
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ), // Viền trắng
                              ),
                              child: Text(
                                '3', // Số thông báo
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.shade200,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tổng số dư',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  '888.888đ',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 12),
                                // SizedBox(
                                //   height: double.infinity,
                                //   // Direct to Wallet page
                                //   child: ElevatedButton(
                                //     onPressed: () {
                                //       Navigator.of(
                                //         context,
                                //       ).pushNamed('/wallet');
                                //     },
                                //     child: Text('Chi tiết'),
                                //   ),
                                // ),
                              ],
                            ),
                            // Spacer(),
                            // Container(
                            //   width: 100,
                            //   height: 100,
                            //   decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     borderRadius: BorderRadius.circular(12),
                            //   ),
                            //   child: Icon(
                            //     LineIcons.wallet,
                            //     color: Colors.white,
                            //     size: 48,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Clipper để tạo đường cong
class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
