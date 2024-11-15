abstract class counterStat{


}


class initialCounterStat extends counterStat{


}

class plusCounterStat extends counterStat{
  final counter;
  plusCounterStat(this.counter);
}
class minusCounterStat extends counterStat{
  final counter;
  minusCounterStat(this.counter);
}