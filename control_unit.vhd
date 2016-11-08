LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Main_Control_Unit IS
   PORT( 
      Instruction_31_26 : IN     std_logic_vector (5 DOWNTO 0);
      ALUOp             : OUT    std_logic_vector (1 DOWNTO 0);
      ALUSrc            : OUT    std_logic;
      Branch            : OUT    std_logic;
      Jump              : OUT    std_logic;
      MemRead           : OUT    std_logic;
      MemToReg          : OUT    std_logic;
      MemWrite          : OUT    std_logic;
      RegDst            : OUT    std_logic;
      RegWrite          : OUT    std_logic
   );
END Main_Control_Unit ;


ARCHITECTURE struct OF Main_Control_Unit IS

BEGIN

   -- insert your design here --
   CUprocess: PROCESS(Instruction_31_26)
   BEGIN
   ALUOp <= "00";
   ALUSrc <= '0';
   Branch <= '0';
   Jump <= '0';
   MemRead <= '0';
   MemToReg <= '0';
   MemWrite <= '0';
   RegDst <= '0';
   RegWrite <= '0';
   
   CASE Instruction_31_26 IS
   WHEN "001000" =>
     ALUSrc <= '1';
     RegWrite <= '1';
   WHEN "000000" =>
     RegDst <= '1';
     RegWrite <= '1';
     ALUOp <= "10";
   WHEN "100011" =>
     ALUSrc <= '1';
     MemToReg <= '1';
     MemRead <= '1';
     RegWrite <= '1';
   WHEN "101011" =>
     ALUSrc <= '1';
     MemWrite <= '1';
   WHEN "000100" =>
     Branch <= '1';
     ALUOp <= "01";
   WHEN "000010" =>
     Jump <= '1';
   WHEN OTHERS => NULL;
   END CASE;
   END PROCESS CUprocess;
   -----------------------------
   
END struct;
