import 'dart:async'; // Enables stream controller and streams
import 'counter_event.dart'; // import the class we created

class CounterBloc {
  int _counter = 0;

  /*
  Create the Controller to privately input into the sink
  Create the Stream to publically ouput the stream
  Create the EventController to manage public events and feed into the sink
  Create the constructor to Listen to the stream and then map/filter/manage it


  */




  // Create a stateController

  final _counterStateController =
      StreamController<int>(); // Private bcs underscore
  //  Values comes in to the sink, which are private due to _underscore
  StreamSink<int> get _inCounter => _counterStateController.sink; // Input

  //  The outputted is outputted through the stream
  //  stream is public to enable listerning, only need to listen to output
  Stream<int> get counter => _counterStateController.stream; // Output

  // Bloc reacts to an event, this is an event handler
  final _counterEventController = StreamController<CounterEvent>();

  // To handle events that will be sent to the bloc and render the UI
  // Public events are sent to the sink of the EventController
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  // Constructor
  CounterBloc() {
    //  Listen to the output of the stream and maps it to a new state
    //  input event is outputted through the stream and listen to it
    _counterEventController.stream.listen(_mapEventToState);
  }

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
