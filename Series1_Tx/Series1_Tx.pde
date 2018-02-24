#include <XBee.h>

XBee xbee = XBee();

unsigned long start = millis();

//10.7589° N, 78.8132° E

float lat=175.7589,lng=78.8132;
char slat[10],slng[10];
uint8_t payload0[30];
uint8_t payload1[30];
uint8_t payload2[30];
uint8_t payload3[30];

Tx16Request tx0 = Tx16Request(0x0000, payload0, sizeof(payload0));
Tx16Request tx1 = Tx16Request(0x0001, payload1, sizeof(payload1));
Tx16Request tx2 = Tx16Request(0x0002, payload2, sizeof(payload2));
Tx16Request tx3 = Tx16Request(0x0003, payload3, sizeof(payload3));

TxStatusResponse txStatus = TxStatusResponse();

void payloader(){
  int j=0;
  dtostrf(lat,-7,7,slat);
  dtostrf(lng,-7,7,slng);
  int n=j;
  j=0;
  while(j<sizeof(slat)){
    payload0[j+n]=slat[j];
    j++;
  }
  payload0[j]=',';
  j++;
  n=j;
  j=0;
  while(j<sizeof(slng)){
    payload0[j+n]=slng[j];
    j++;
  }
}

void setup() {
  Serial.begin(115200);
  xbee.setSerial(Serial);
  payloader();
}

void loop() {
    if (millis() - start > 15) {
      xbee.send(tx0);
  }
    delay(1000);
}
