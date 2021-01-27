//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//
simple Senders{
    parameters:
        @display("i=device/pc");
        double xpos;
        double ypos;
        @display("p=$xpos,$ypos");
        
        int EXB_SIZE;
        double TIMEOUT;
        double TIME_INTERVAL;
        double CHANNEL_DELAY;
        double CREDIT_DELAY;
        double TIME_GEN_MSG;
    gates:
        input in;
    	output out;
}

simple Receiver{
    parameters:
        @display("i=device/pc2");
        double xpos;
        double ypos;
        @display("p=$xpos,$ypos");
        
        double TIMEOUT;
    	double TIME_INTERVAL;
    gates:
        input in;
        output out;
        
}

simple Switch{
    parameters:
        @display("i=device/switch");
        double xpos;
        double ypos;
        @display("p=$xpos,$ypos");
        
        double TIMEOUT;
        int EXB_SIZE;
        double CHANNEL_DELAY;
        double TIME_INTERVAL;
        double TIME_OPERATION_OF_SWITCH;
    gates:
        input in[3];
        output out[4];
}

network SenderSwitchReceiver{
	parameters:
   	    sender[0].xpos = 100;
   	    sender[0].ypos = 100;
   	    
   	    sender[1].xpos = 100;
   	    sender[1].ypos = 200;
   	    
   	    sender[2].xpos = 100;
   	    sender[2].ypos = 300;
   	    
   	    switch.xpos = 200;
   	    switch.ypos = 200;
   	    
   	    receiver.xpos = 300;
   	    receiver.ypos = 200;
   	    
    types:
        channel Channel extends ned.DatarateChannel{
            delay = 15ms;
        }
   
    submodules:
        sender[3]: Senders;
        switch: Switch;
        receiver: Receiver;
    connections:
        for i=0..2{
            sender[i].out --> Channel --> switch.in[i];
        }
        
        for i = 0..2{
            switch.out[i] --> Channel --> sender[i].in;
        }
        
        switch.out++ --> Channel --> receiver.in;
        switch.in++ <-- receiver.out;
        
}