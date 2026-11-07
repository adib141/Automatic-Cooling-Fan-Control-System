PROGRAM main
  VAR
    stop : BOOL;
    start : BOOL;
    machine_run : BOOL;
    TOF0 : TOF;
    fan : BOOL;
  END_VAR

  machine_run := (machine_run OR start) AND NOT(stop);
  TOF0(IN := machine_run, PT := T#10s);
  fan := TOF0.Q;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION
