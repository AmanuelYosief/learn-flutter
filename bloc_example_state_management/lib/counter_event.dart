abstract class CounterEvent {} // base class

// extensions, these are passed to the bloc
// Any UI rendering Event -> Bloc -> request data from data layer > DATA
// DATA -> Bboc gets data -> Bloc -> Outputs the new state --> Renders the UI


//  Events
class IncrementEvent extends CounterEvent {} 

class DecrementEvent extends CounterEvent {}
