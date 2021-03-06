-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- Generated by Quartus Prime Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition
-- Created on Wed Aug 19 13:40:05 2020

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY JKFLip IS
    PORT (
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC := '0';
        j : IN STD_LOGIC := '0';
        K : IN STD_LOGIC := '0';
        Q : OUT STD_LOGIC
    );
END JKFLip;

ARCHITECTURE BEHAVIOR OF JKFLip IS
    TYPE type_fstate IS (idle,active);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,j,K)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= idle;
            Q <= '0';
        ELSE
            Q <= '0';
            CASE fstate IS
                WHEN idle =>
                    IF (NOT((j = '1'))) THEN
                        reg_fstate <= idle;
                    ELSIF ((j = '1')) THEN
                        reg_fstate <= active;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= idle;
                    END IF;

                    Q <= '0';
                WHEN active =>
                    IF (NOT((K = '1'))) THEN
                        reg_fstate <= active;
                    ELSIF ((K = '1')) THEN
                        reg_fstate <= idle;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= active;
                    END IF;

                    Q <= '1';
                WHEN OTHERS => 
                    Q <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;
