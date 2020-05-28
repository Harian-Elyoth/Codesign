library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.bus_multiplexer_pkg.all;

entity Layer3Calculator is
	generic(
		NEURONE_LIST_SIZE_IN	:	natural := 1255;
		NEURONE_LIST_SIZE_OUT	:	natural := 1255;
		NEURONE_SIZE		:	natural := 16
	);
	port (
		calculate		:	in std_logic;
		neurones		:	in bus_array(0 to NEURONE_LIST_SIZE_IN-1);
		weights			:	in bus_array(0 to NEURONE_LIST_SIZE_IN-1);
		nextNeurones		:	out bus_array(0 to NEURONE_LIST_SIZE_OUT-1)
	);
end Layer3Calculator;

architecture RTL of Layer3Calculator is

signal nextNeuronesSIG	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);

component Layer3Divided is
	generic(
		NEURONE_LIST_SIZE	:	natural := 1014;
		NEURONE_SIZE		:	natural := 16
	);
	port (
		
		start		:	in integer;
		finish		:	in integer;
		calculate	:	in std_logic;
		neurones	:	in bus_array(0 to NEURONE_LIST_SIZE-1);
		weights		:	in bus_array(0 to NEURONE_LIST_SIZE-1);
		nextNeurones	:	out bus_array(0 to NEURONE_LIST_SIZE_OUT-1)
	);
end component;

signal nextNeurones0	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones1	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones2	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones3	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones4	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones5	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones6	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones7	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones8	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);
signal nextNeurones9	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);

begin

	div0 : Layer3Divided port map(
		start		=>	0,
		finish		=>	5,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones0
	);	

	div1 : Layer3Divided port map(
		start		=>	5,
		finish		=>	10,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones1
	);	

	div2 : Layer3Divided port map(
		start		=>	10,
		finish		=>	15,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones2
	);	

	div3 : Layer3Divided port map(
		start		=>	15,
		finish		=>	20,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones3
	);	

	div4 : Layer3Divided port map(
		start		=>	20,
		finish		=>	25,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones4
	);	

	div5 : Layer3Divided port map(
		start		=>	25,
		finish		=>	30,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones5
	);	

	div6 : Layer3Divided port map(
		start		=>	30,
		finish		=>	35,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones6
	);	

	div7 : Layer3Divided port map(
		start		=>	35,
		finish		=>	40,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones7
	);	

	div8 : Layer3Divided port map(
		start		=>	40,
		finish		=>	45,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones8
	);	

	div9 : Layer3Divided port map(
		start		=>	45,
		finish		=>	50,
		calculate	=>	calculate,
		neurones	=>	neurones,
		weights		=>	weights,
		nextNeurones	=>	nextNeurones9
	);	

	

	nextNeurones(0 to 130) <= nextNeurones0(0 to 130);
	nextNeurones(131 to 255) <= nextNeurones1(131 to 255);
	nextNeurones(256 to 380) <= nextNeurones2(256 to 380);
	nextNeurones(381 to 505) <= nextNeurones3(381 to 505);
	nextNeurones(506 to 630) <= nextNeurones4(506 to 630);
	nextNeurones(631 to 755) <= nextNeurones5(631 to 755);
	nextNeurones(756 to 880) <= nextNeurones6(756 to 880);
	nextNeurones(881 to 1005) <= nextNeurones7(881 to 1005);
	nextNeurones(1006 to 1130) <= nextNeurones8(1006 to 1130);
	nextNeurones(1131 to 1255) <= nextNeurones9(1131 to 1255);

end RTL;
