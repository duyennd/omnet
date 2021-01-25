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
simple Tic
{
    parameters:
        @display("i=block/routing");
    gates:
        inout gate[];
}

network Lab03a
{
    //@display("bgb=2126,589");
    types:
        channel Channel extends ned.DelayChannel
        {
            delay = 100ms;
        }
    submodules:
   tic:Tic {
            @display("p=160.44,63.03");
        }
        tic1: Tic {
            @display("p=44.407497,67.3275");
        }
        tic2: Tic {
            @display("p=40.11,290.7975");
        }
        tic3: Tic {
            @display("p=147.5475,289.365");
        }
        tic4: Tic {
            @display("p=232.06499,193.3875");
        }
        tic5: Tic {
            @display("p=335.205,85.95");
        }
        tic6: Tic {
            @display("p=323.745,300.82498");
        }
        tic7: Tic {
            @display("p=475.59,305.1225");
        }
        tic8: Tic {
            @display("p=466.995,83.085");
        }
        tic9: Tic {
            @display("p=567.26996,87.3825");
        }
        tic10: Tic {
            @display("p=643.1925,191.95499");
        }
        tic11: Tic {
            @display("p=641.76,319.44748");
        }
        tic12: Tic {
            @display("p=706.2225,75.9225");
        }
        tic13: Tic {
            @display("p=826.5525,85.95");
        }
        tic14: Tic {
            @display("p=968.37,77.354996");
        }
        tic15: Tic {
            @display("p=836.57996,186.22499");
        }
        tic16: Tic {
            @display("p=978.39746,196.25249");
        }
        tic17: Tic {
            @display("p=843.7425,318.01498");
        }
        tic18: Tic {
            @display("p=969.8025,303.69");
        }
        tic19: Tic {
            @display("p=1110.1875,283.63498");
        }
        tic20: Tic {
            @display("p=1095.8624,80.22");
        }
        tic21: Tic {
            @display("p=1246.2749,287.9325");
        }
        tic22: Tic {
            @display("p=1244.8424,80.22");
        }
    connections:
        tic.gate++ <--> Channel <--> tic1.gate++;
        tic.gate++ <--> Channel <--> tic4.gate++;
        tic1.gate++ <--> Channel <--> tic2.gate++;
        tic2.gate++ <--> Channel <--> tic3.gate++;
        tic3.gate++ <--> Channel <--> tic4.gate++;

        tic4.gate++ <--> Channel <--> tic5.gate++;

        tic5.gate++ <--> Channel <--> tic6.gate++;
        tic6.gate++ <--> Channel <--> tic7.gate++;
        tic7.gate++ <--> Channel <--> tic8.gate++;

        tic8.gate++ <--> Channel <--> tic9.gate++;

        tic9.gate++ <--> Channel <--> tic10.gate++;
        tic10.gate++ <--> Channel <--> tic11.gate++;
        tic10.gate++ <--> Channel <--> tic12.gate++;

        tic12.gate++ <--> Channel <--> tic13.gate++;

        tic13.gate++ <--> Channel <--> tic14.gate++;
        tic13.gate++ <--> Channel <--> tic15.gate++;
        tic15.gate++ <--> Channel <--> tic16.gate++;
        tic15.gate++ <--> Channel <--> tic17.gate++;
        tic17.gate++ <--> Channel <--> tic18.gate++;

        tic18.gate++ <--> Channel <--> tic19.gate++;

        tic19.gate++ <--> Channel <--> tic20.gate++;
        tic20.gate++ <--> Channel <--> tic21.gate++;
        tic21.gate++ <--> Channel <--> tic22.gate++;
}

   