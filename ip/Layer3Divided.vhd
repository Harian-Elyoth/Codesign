library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.bus_multiplexer_pkg.all;

entity Layer3Divided is
	generic(
		NEURONE_LIST_SIZE	:	natural := 1255;
		NEURONE_LIST_SIZE_OUT	:	natural := 1255;
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
end Layer3Divided;

architecture RTL of Layer3Divided is

signal	i		:	integer;
signal	j		:	integer;
signal	k		:	integer;
signal	m		:	integer;
signal	n		:	integer;
signal SAL		:	integer;
signal sommeInteger	:	integer;
signal somme		:	std_logic_vector((NEURONE_SIZE*2)-1 downto 0);
signal mult0		:	std_logic_vector((NEURONE_SIZE*2)-1 downto 0);
signal mult1		:	std_logic_vector((NEURONE_SIZE*2)-1 downto 0);
signal mult2		:	std_logic_vector((NEURONE_SIZE*2)-1 downto 0);
signal mult3		:	std_logic_vector((NEURONE_SIZE*2)-1 downto 0);
signal mult4		:	std_logic_vector((NEURONE_SIZE*2)-1 downto 0);
signal mult5		:	std_logic_vector((NEURONE_SIZE*2)-1 downto 0);
signal nextNeuronesSIG	:	bus_array(0 to NEURONE_LIST_SIZE_OUT-1);

component oneNeuroneCalculator
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
end component;

component sigmoid
	port(
		Z: in integer range 0 to 511;
		SAL: out integer range 0 to 255
	);
end component;

begin

	neurone0 : oneNeuroneCalculator port map(
		i 		=> i,
		j		=> j,
		k		=> k,
		m		=> m,
		n		=> n,
		offset		=> 0,
		neurones	=> neurones,
		weights		=> weights,
		mult		=> mult0
	);
	
	neurone1 : oneNeuroneCalculator port map(
		i 		=> i,
		j		=> j,
		k		=> k,
		m		=> m,
		n		=> n,
		offset		=> 1,
		neurones	=> neurones,
		weights		=> weights,
		mult		=> mult1
	);

	neurone2 : oneNeuroneCalculator port map(
		i 		=> i,
		j		=> j,
		k		=> k,
		m		=> m,
		n		=> n,
		offset		=> 2,
		neurones	=> neurones,
		weights		=> weights,
		mult		=> mult2
	);
	
	neurone3 : oneNeuroneCalculator port map(
		i 		=> i,
		j		=> j,
		k		=> k,
		m		=> m,
		n		=> n,
		offset		=> 3,
		neurones	=> neurones,
		weights		=> weights,
		mult		=> mult3
	);

	neurone4 : oneNeuroneCalculator port map(
		i 		=> i,
		j		=> j,
		k		=> k,
		m		=> m,
		n		=> n,
		offset		=> 4,
		neurones	=> neurones,
		weights		=> weights,
		mult		=> mult4
	);
	
	neurone5 : oneNeuroneCalculator port map(
		i 		=> i,
		j		=> j,
		k		=> k,
		m		=> m,
		n		=> n,
		offset		=> 5,
		neurones	=> neurones,
		weights		=> weights,
		mult		=> mult5
	);

	sig : sigmoid port map(
		Z	=> sommeInteger,
		SAL	=> SAL
	);	


	process
	begin
		if(rising_edge(calculate)) then
			for i in start to finish loop
				for j in 0 to 5 loop
					for k in 0 to 5 loop
						somme <= weights(26*6*i);
						for m in 0 to 5 loop
							for n in 0 to 5 loop
								somme <= somme + mult0 + mult1 + mult2 + mult3 + mult4 + mult5;
							end loop;
						end loop;
						nextNeuronesSIG(5*5*i+5*j+k) <= std_logic_vector(to_unsigned(SAL, 32));
					end loop;
				end loop;
			end loop;
		end if;
	end process;

	sommeInteger <= to_integer(unsigned(somme));

	nextNeurones <= nextNeuronesSig;

end RTL;
