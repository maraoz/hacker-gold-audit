pragma solidity ^0.4.0;

contract HKG {

  // 1 ether = 200 hkg
  uint BASE_PRICE = 200;

  struct milestones_struct {
    uint p1;
    uint p2; 
    uint p3;
    uint p4;
    uint p5;
    uint p6;
  }

  milestones_struct milestones;

  function HKG() {
    milestones = milestones_struct(

      1476972000,  // P1: GMT: 20-Oct-2016 14:00  => The Sale Starts
      1478181600,  // P2: GMT: 03-Nov-2016 14:00  => 1st Price Ladder 
      1479391200,  // P3: GMT: 17-Nov-2016 14:00  => Price Stable, 
      //                                Hackathon Starts
      1480600800,  // P4: GMT: 01-Dec-2016 14:00  => 2nd Price Ladder
      1481810400,  // P5: GMT: 15-Dec-2016 14:00  => Price Stable
      1482415200   // P6: GMT: 22-Dec-2016 14:00  => Sale Ends, Hackathon Ends
    );

  }

  function getPrice(uint time) constant returns (uint result){

    if (time < milestones.p1) return 1;

    if (time >= milestones.p1 && time < milestones.p2){

      return BASE_PRICE;
    }

    if (time >= milestones.p2 && time < milestones.p3){


      uint days_in = 1 + (time - milestones.p2) / (60 * 60 *24); 
      return BASE_PRICE - days_in * 25 / 7;  // daily decrease 3.5
    }

    if (time >= milestones.p3 && time < milestones.p4){

      return BASE_PRICE / 4 * 3;
    }

    if (time >= milestones.p4 && time < milestones.p5){

      days_in = 1 + (time - milestones.p4) / (60 * 60 *24); 
      return (BASE_PRICE / 4 * 3) - days_in * 25 / 7;  // daily decrease 3.5
    }

    if (time >= milestones.p5 && time < milestones.p6){

      return BASE_PRICE / 2;
    }

    if (time >= milestones.p6){

      return 2;
    }
  }

}

