-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- Generated by Quartus Prime Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition
-- Created on Wed Sep 06 16:29:20 2017

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fahrstrecke IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        cl : IN STD_LOGIC := '0';
        cr : IN STD_LOGIC := '0';
        fk : IN STD_LOGIC := '0';
        sl : OUT STD_LOGIC;
        sr : OUT STD_LOGIC;
        sk : OUT STD_LOGIC;
        dl : OUT STD_LOGIC;
        dr : OUT STD_LOGIC;
        ac : OUT STD_LOGIC;
        y0 : OUT STD_LOGIC;
        y1 : OUT STD_LOGIC;
        y2 : OUT STD_LOGIC;
        y3 : OUT STD_LOGIC
    );
END fahrstrecke;

ARCHITECTURE BEHAVIOR OF fahrstrecke IS
    TYPE type_fstate IS (W1,K1,W2,K2,W3,K3,W4,Fertig);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reset,reg_fstate)
    BEGIN
        IF (reset='0') THEN
            fstate <= W1;
        ELSIF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,cl,cr,fk)
    BEGIN
        sl <= '0';
        sr <= '0';
        sk <= '0';
        dl <= '0';
        dr <= '0';
        ac <= '0';
        y0 <= '0';
        y1 <= '0';
        y2 <= '0';
        y3 <= '0';
        CASE fstate IS
            WHEN W1 =>
                IF ((NOT((fk = '1')) AND (NOT((cl = '1')) OR NOT((cr = '1'))))) THEN
                    reg_fstate <= W1;
                ELSE
                    reg_fstate <= K1;
                END IF;

                sl <= '0';
                sl <= '0';

                dl <= '0';

                sk <= '0';

                y2 <= '0';

                sr <= '0';

                y3 <= '0';

                y0 <= '0';

                dr <= '0';

                y1 <= '0';

                ac <= '0';
            WHEN K1 =>
                IF ((NOT((fk = '1')) AND (NOT((cl = '1')) OR NOT((cr = '1'))))) THEN
                    reg_fstate <= W2;
                ELSE
                    reg_fstate <= K1;
                END IF;

                sl <= '0';

                dl <= '0';

                sk <= '0';

                y2 <= '0';

                sr <= '1';

                y3 <= '0';

                y0 <= '1';

                dr <= '0';

                y1 <= '0';

                ac <= '1';
            WHEN W2 =>
                IF ((NOT((fk = '1')) AND (NOT((cl = '1')) OR NOT((cr = '1'))))) THEN
                    reg_fstate <= W2;
                ELSE
                    reg_fstate <= K2;
                END IF;

                sl <= '0';

                dl <= '0';

                sk <= '0';

                y2 <= '0';

                sr <= '0';

                y3 <= '0';

                y0 <= '0';

                dr <= '0';

                y1 <= '1';

                ac <= '0';
            WHEN K2 =>
                IF ((NOT((fk = '1')) AND (NOT((cl = '1')) OR NOT((cr = '1'))))) THEN
                    reg_fstate <= W3;
                ELSE
                    reg_fstate <= K2;
                END IF;

                sl <= '0';

                dl <= '0';

                sk <= '1';

                y2 <= '0';

                sr <= '0';

                y3 <= '0';

                y0 <= '1';

                dr <= '0';

                y1 <= '1';

                ac <= '0';
            WHEN W3 =>
                IF ((NOT((fk = '1')) AND (NOT((cl = '1')) OR NOT((cr = '1'))))) THEN
                    reg_fstate <= W3;
                ELSE
                    reg_fstate <= K3;
                END IF;

                sl <= '0';

                dl <= '0';

                sk <= '0';

                y2 <= '1';

                sr <= '0';

                y3 <= '0';

                y0 <= '0';

                dr <= '0';

                y1 <= '0';

                ac <= '0';
            WHEN K3 =>
                IF ((NOT((fk = '1')) AND (NOT((cl = '1')) OR NOT((cr = '1'))))) THEN
                    reg_fstate <= W4;
                ELSE
                    reg_fstate <= K3;
                END IF;

                sl <= '0';

                dl <= '0';

                sk <= '0';

                y2 <= '1';

                sr <= '1';

                y3 <= '0';

                y0 <= '1';

                dr <= '0';

                y1 <= '0';

                ac <= '0';
            WHEN W4 =>
                IF ((NOT((fk = '1')) AND (NOT((cl = '1')) OR NOT((cr = '1'))))) THEN
                    reg_fstate <= W4;
                ELSE
                    reg_fstate <= Fertig;
                END IF;

                sl <= '0';

                dl <= '0';

                sk <= '0';

                y2 <= '1';

                sr <= '0';

                y3 <= '0';

                y0 <= '0';

                dr <= '0';

                y1 <= '1';

                ac <= '0';
            WHEN Fertig =>
                reg_fstate <= Fertig;

                sl <= '0';

                dl <= '0';

                sk <= '0';

                y2 <= '1';

                sr <= '0';

                y3 <= '0';

                y0 <= '1';

                dr <= '1';

                y1 <= '1';

                ac <= '0';
            WHEN OTHERS => 
                sl <= 'X';
                sr <= 'X';
                sk <= 'X';
                dl <= 'X';
                dr <= 'X';
                ac <= 'X';
                y0 <= 'X';
                y1 <= 'X';
                y2 <= 'X';
                y3 <= 'X';
                report "Reach undefined state";
        END CASE;
    END PROCESS;
END BEHAVIOR;