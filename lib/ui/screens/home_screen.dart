import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsos_helper/blocs/authentication/authentication.dart';
import 'package:jsos_helper/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:jsos_helper/ui/components/bottom_navigation.dart';
import 'package:jsos_helper/ui/screens/calendar_screen.dart';
import 'package:jsos_helper/ui/screens/grades_screen.dart';
import 'package:jsos_helper/ui/screens/messages_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      body: BlocBuilder<BottomNavigationEvent, BottomNavigationState>(
        bloc: BlocProvider.of<BottomNavigationBloc>(context),
        builder: (BuildContext context, BottomNavigationState state) {
          // TODO - add additional pages
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CalendarPageLoaded) {
            return CalendarScreen(title: 'Calendar');
          }
          if (state is GradesPageLoaded) {
            return GradesScreen(
              title: 'Grades',
            );
          }
          if (state is MessagesPageLoaded) {
            return MessagesScreen(
              title: 'Messages',
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
