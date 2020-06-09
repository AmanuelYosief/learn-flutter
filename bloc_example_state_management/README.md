# bloc_example_state_management


### Create an abstract base class on which events are extended  _event.dart
```dart
  abstract class CounterEvent {}
  
  class IncrementEvent extends CounterEvent {} 
  
  class DecrementEvent extends CounterEvent {}
   ```    

## _bloc.dart

  Create the Controller to privately (_underscore)a input into the sink
```dart
  final _counterStateController = StreamController<int>();
   StreamSink<int> get _inCounter => _counterStateController.sink; // Input
   ```
  
  Create the Stream to publically otuput (to enable listerning)  through the stream
```dart
  Stream<int> get counter => _counterStateController.stream; // Output
   ```

  
  Create the EventController to manage public events that are sent to the bloc and render the UI. This is feed into the sink
```dart
  final _counterEventController = StreamController<CounterEvent>();
   ```
  
  Public events are sent to the sink of the EventController
```dart
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;
   ```
  
  Create the constructor to Listen to the event streams and then map/filter/manage it
  
```dart
  _counterEventController.stream.listen(_mapEventToState);
  
  // Accepts an event and behaves accordingly
  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;
    _inCounter.add(_counter);
  }
   ```
   
   Managing memory and closing connection
   To avoid memory leak, dispose();
  
  ```dart
  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
 ```

## Inputting data into the stream

There is two kinds of streams.
Single-subscription streams or Broadcast stream

 - Single type = allows only a single listerner during the whole
   lifetime of stream
 - Broadcast stream allows any numbers of listerns and fires it's events
   when they are ready, whether there are listerners or not.

  ```dart

// Adding data into the stream
addData() async {
for (int i = 0; i <= 10; i++) {
// Setting up a second delay
await Future.delayed(Duration(seconds: 1));
// Then adds data to the source of the stream.
// The Sink is the source.
_streamController.sink.add(i);
}
}
  ```

  
## Another way to create a stream
  ```dart
// Provide a type e.g.
Stream<int> numberStream() async* {
for (int i = 0; i <= 10; i++) {
// Setting up a second delay
await Future.delayed(Duration(seconds: 1));
// Then adds data to the source of the stream.
// The Sink is the source.
yield i;
// No need to worry about memory leak, it closes on finish
}
}
 ```

## StreamBuilder main.dart


#### Import the bloc, this is normally at the top of a widget tree and is passed down through inherited widget
  ```dart
final _bloc =  CounterBloc();
body: Center(
child: StreamBuilder(
stream: numberStream(), //previously _streamController.Stream,
 ```

### Enable filtering
#### numberStream().where((number) => number%2 == 0), for even numbers
#### numberStream().map((number) => "number $number").

  ```dart
initialData: null,
builder: (BuildContext context, AsyncSnapshot snapshot) {
if (snapshot.hasError) {
return Text("There is some error");
} else if (snapshot == null) {
return CircularProgressIndicator();
}

return Container(
child: Text("${snapshot.data}",
style: Theme.of(context).textTheme.bodyText1),
);
 ```
