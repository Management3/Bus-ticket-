import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/booked_tickets/view/booked_tickets_page.dart';
import 'package:ezy_transport/dashboard/bloc/bottom_nav_bloc.dart';
import 'package:ezy_transport/home_page/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFf4f4f4),
        //Bloc for changing Navbar active button colors and navigation
        bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return state.when(
              pageLoaded: (selectedIndex) => BottomNavigationBar(
                unselectedItemColor: Colors.white,
                selectedItemColor: const Color(0xFFFAD309),
                backgroundColor: const Color(0xFF0094FF),
                currentIndex: selectedIndex,
                onTap: (index) {
                  context
                      .read<BottomNavBloc>()
                      .add(BottomNavEvent.pageTapped(pageIndex: index));
                  _pageController?.animateToPage(index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 28,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "images/booked.svg",
                      height: 18,
                      colorFilter: selectedIndex == 1
                          ? const ColorFilter.mode(
                              Color(0xFFFAD309), BlendMode.srcIn)
                          : const ColorFilter.mode(
                              Color(0xFFFFFFFF), BlendMode.srcIn),
                    ),
                    label: 'Tickets',
                  ),
                  // Add more items if needed
                ],
              ),
            );
          },
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            BookedTicketsPage(),
          ],
        ),
      ),
    );
  }
}
