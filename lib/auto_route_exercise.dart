import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:navigator2_exercise/auto_route_exercise.gr.dart';

// Run `dart run build_runner watch` to generate code before running the demo
void main() {
  runApp(MyApp());
}

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: FirstScreen, initial: true),
    AutoRoute(page: SecondScreen, path: '/second-screen/:id'),
  ],
)
class $AppRouter {}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("Book $index"),
                  trailing: ElevatedButton(
                    child: Text('Details'),
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      context.router.push(SecondRoute(bookId: "$index"));
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String bookId;
  SecondScreen({Key key, @PathParam('id') this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Book $bookId"),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                if (context.router.stack.length > 1) {
                  context.router.pop();
                } else {
                  context.router.navigate(FirstRoute());
                }
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
