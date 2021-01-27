#include <string.h>
#include <omnetpp.h>
#include "message_m.h"
using namespace omnetpp;
class sensor : public cSimpleModule
{
public:
    static float matrix[100][100];
    static int start;
    static int list[100][2];
    static int visited[100];
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
    void calculateMatrix();
    int getClosestNode(int index);
};
Define_Module(sensor);
int sensor::start=0;
int sensor::list[100][2]={0,0};
float sensor::matrix[100][100]={0};
int sensor::visited[100]={0,0,0};

void sensor::initialize(){
    visited[start]=0;
    start++;
    int x=intuniform(0, 800);
    int y=intuniform(0, 800);
    getDisplayString().setTagArg("p", 0, x);
    getDisplayString().setTagArg("p", 1, y);
    list[getIndex()][0]=x;
    list[getIndex()][1]=y;
    int ix=getIndex();

    if(start==100){
        calculateMatrix();
        float maxx=0.0f;
        for(int i=0;i<100;i++){
                for(int j=0;j<100;j++){
                    if(matrix[i][j]>maxx) maxx=matrix[i][j];
                }
        }

        EV<<"MAX: "<<maxx <<"\n";

        for(int i=0;i<100;i++){
               for(int j=0;j<100;j++){
                   matrix[i][j]/=maxx;
               }
        }
        for(int i=0;i<100;i++){
                       for(int j=0;j<100;j++){
                           EV<<matrix[i][j]<<"      ";
                       }
                       EV<<"\n";
                }
        WATCH(matrix);
        //send first
         cModule *target=getParentModule()->getSubmodule("node", getIndex());
         sendDirect(new cMessage(""), target,"radioIn");
    }
    }
void sensor::handleMessage(cMessage *msg){
    visited[getIndex()]=1;
    int n=getClosestPossible(getIndex());
    if(n==101) return;
    cModule *target=getParentModule()->getSubmodule("node", n);
    sendDirect(msg, target,"radioIn");

}
void sensor::calculateMatrix(){

    for(int i=0;i<100;i++){
        for(int j=0;j<100;j++){
            matrix[i][j]=sqrt((list[i][0]-list[j][0])*(list[i][0]-list[j][0])+(list[i][1]-list[j][1])*(list[i][1]-list[j][1]));

        }
    }
}
int sensor::getClosestNode(int index){
    float min=2.0f;
    int d=101;
    for(int i=0;i<100;i++){

        if(i==index) continue;

        if(visited[i]==0&&(matrix[index][i]<min)){
            minn=matrix[index][i];
            d=i;
        }
    }
    EV<<"Next hop:"<<d<<" Distance: "<<min<<"\n";
    return d;
}


