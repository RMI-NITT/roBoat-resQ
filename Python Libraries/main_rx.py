import XBee_Threaded
from time import sleep
st="/dev/ttyACM"
port = raw_input()
if __name__ == "__main__":
    xbee = XBee_Threaded.XBee(st+port)
    print("Port "+st+port+" selected")
    while(1):
        Msg = xbee.Receive()
        if Msg:
            content = Msg[7:-1].decode('ascii')
            print("Msg: " + content)
    xbee.shutdown()
