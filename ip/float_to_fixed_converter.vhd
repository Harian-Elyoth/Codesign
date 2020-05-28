library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity float_to_fixed_converter is
    port(
        input : in std_logic_vector(31 downto 0);
        output : out std_logic_vector(14 downto 0)
    );
end entity;


architecture arch of float_to_fixed_converter is
    begin
        output <= input * 32768; -- 2^15
    end

end arch;


