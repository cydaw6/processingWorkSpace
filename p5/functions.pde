
public Mover[] createMovers(int number){
  Mover[] movers = new Mover[number];
  for(int i = 0; i < number; i++){
    movers[i]=new Mover();
  }
  return movers;
}
