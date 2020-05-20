library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.bus_multiplexer_pkg.all;

entity oneNeuroneCalculator is
	generic(
		NEURONE_LIST_SIZE	:	natural := 1014;
		NEURONE_SIZE		:	natural := 16
	);
	port (
		i		:	in integer;
		j		:	in integer;
		k		:	in integer;
		m		:	in integer;
		n		:	in integer;
		offset		:	in integer;
		neurones	:	in bus_array(0 to NEURONE_LIST_SIZE-1);
		weights		:	in bus_array(0 to NEURONE_LIST_SIZE-1);
		mult		:	out std_logic_vector(NEURONE_SIZE-1 downto 0)
	);
end oneNeuroneCalculator;

architecture RTL of oneNeuroneCalculator is

signal multSig	:	std_logic_vector((2*NEURONE_SIZE)-1 downto 0);

begin

	multSig <= std_logic_vector(unsigned(weights(26*6*i+1+6*(n+5*m)+offset)) * unsigned(neurones(13*13*offset+13*(2*j+m)+(2*k+n))));

	mult <= multSig;

end RTL;
