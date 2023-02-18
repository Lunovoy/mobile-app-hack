import 'package:bloc/bloc.dart';
import 'package:deep_shield_hack/pages/home/account_page/my_account_page.dart';
import 'package:deep_shield_hack/pages/home/event_page/events_page.dart';
import 'package:deep_shield_hack/pages/home/favorite_page/favorites_page.dart';
import 'package:deep_shield_hack/pages/home/notification_page/notifications_page.dart';
import 'package:deep_shield_hack/pages/home/request_page/requests_page.dart';
import 'package:deep_shield_hack/pages/home/science_page/sciences_page.dart';
import 'package:deep_shield_hack/pages/home/start_page.dart';

enum NavigationEvents {
  MyAccountClickedEvent,
  HomePageClickedEvent,
  EventsClickedEvent,
  ScienceClickedEvent,
  FavoriteClickedEvent,
  RequestsClickedEvent,
  NotificationsClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => StartPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountPage();
        break;
      case NavigationEvents.HomePageClickedEvent:
        yield StartPage();
        break;
      case NavigationEvents.EventsClickedEvent:
        yield EventsPage();
        break;
      case NavigationEvents.ScienceClickedEvent:
        yield SciencePage();
        break;
      case NavigationEvents.FavoriteClickedEvent:
        yield FavoritesPage();
        break;
      case NavigationEvents.RequestsClickedEvent:
        yield RequestPage();
        break;
      case NavigationEvents.NotificationsClickedEvent:
        yield NotificationPage();
        break;

      default:
    }
  }
}
