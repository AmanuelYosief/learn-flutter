# bloc_example_state_management

# Background

# Abstract base class on which events are extended  _event.dart
  abstract class CounterEvent {}
  
  class IncrementEvent extends CounterEvent {} 
  
  class DecrementEvent extends CounterEvent {}



# _bloc.dart

  Create the Controller to privately (_underscore)a input into the sink
  final _counterStateController = StreamController<int>();
   StreamSink<int> get _inCounter => _counterStateController.sink; // Input
  
  Create the Stream to publically otuput (to enable listerning)  through the stream
  Stream<int> get counter => _counterStateController.stream; // Output

  
  Create the EventController to manage public events that are sent to the bloc and render the UI. This is feed into the sink
  final _counterEventController = StreamController<CounterEvent>();
  
  
  Public events are sent to the sink of the EventController
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;
  
  Create the constructor to Listen to the event streams and then map/filter/manage it
  _counterEventController.stream.listen(_mapEventToState);
  
  // Accepts an event and behaves accordingly
  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;

    _inCounter.add(_counter);
  }

  // To avoid memory leak, dispose();
  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}





