
simple sensor
{
    parameters:
        @display("i=block/routing");
       
        int posX = default(0);
        int posY = default(0);
       
    gates:
        input radioIn @directIn;
      
}

network wsn{
    parameters:

        @display("bgb=800,800");
   types:
        channel Channel extends ned.DelayChannel
        {
            delay = 100ms;
        }
   submodules:
       node[100]: sensor{
          @display("p=0,0"); }
       
}
