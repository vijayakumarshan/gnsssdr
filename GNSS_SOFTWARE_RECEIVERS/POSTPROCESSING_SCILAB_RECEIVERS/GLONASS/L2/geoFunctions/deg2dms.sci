function dmsOutput = deg2dms(deg)
//DEG2DMS  Conversion of degrees to degrees, minutes, and seconds.
//The output format (dms format) is: (degrees*100 + minutes + seconds/100)

// Written by Kai Borre
// February 7, 2001
// Updated by Darius Plausinaitis
// Updated and converted to scilab 5.3.0 by Artyom Gavrilov

  // Save the sign for later processing
  neg_arg = 'false';
  if deg < 0
    // Only positive numbers should be used while spliting into deg/min/sec
    deg     = -deg;
    neg_arg = 'true';
  end

  // Split degrees minutes and seconds
  int_deg   = floor(deg);
  decimal   = deg - int_deg;
  min_part  = decimal*60;
  minn       = floor(min_part);
  sec_part  = min_part - floor(min_part);
  secc       = sec_part*60;

  // Check for overflow
  if secc == 60
    minn     = minn + 1;
    secc     = 0;
  end
  if minn == 60
    int_deg = int_deg + 1;
    minn     = 0;
  end

  // Construct the output
  dmsOutput = int_deg * 100 + minn + secc/100;

  // Correct the sign
  if neg_arg == 'true'
    dmsOutput = -dmsOutput;
  end

///////////////////////////////// end deg2dms.m ////////////////////////////////

endfunction
