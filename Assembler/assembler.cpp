#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <fstream>
#include "pass1.cpp"
using namespace std;

map<string, string> opcode_table;
map<string, string> symbol_table;

void SetupOpcodes () {
    opcode_table["MVIB"] = "06";
    opcode_table["LDA"] = "3A";
    opcode_table["SUBB"] = "90";
    opcode_table["JZ"] = "CA";
    opcode_table["JMP"] = "C3";
    opcode_table["HLT"] = "76";
}

void pass1 () {
    fstream parse;
    string word;
    string start_loc = "2000";
    parse.open("code.txt");
    while (parse >> word){
      // Dealing with 3 byte instructions
        if (word == "LDA"){
            parse >> word;
            parse >> word;
            start_loc = HexaAdd(start_loc, "3");
        }
        else if (word == "JZ" || word == "JMP"){
            parse >> word;
            start_loc = HexaAdd(start_loc, "3");
        }

        // Dealing with 2 byte instructions
        else if (word == "MVIB,"){
            parse >> word;
            start_loc = HexaAdd(start_loc, "2");
        }

        // Dealing with 1 byte instructions
        else if (word == "SUB" || word == "HLT"){
            start_loc = HexaAdd(start_loc, "1");
        }

        // Inserting labels in symbol table
        else if (word[word.size()-1] == ':'){
            symbol_table[word.substr(0, word.size()-1)] = start_loc;
        }
    }
    parse.close();
}

void pass2 () {
    fstream parse, writer;
    parse.open("code.txt");
    writer.open("output.txt", ios::out | ios::trunc);
    string word;
    while (parse >> word){
        if (word[word.size()-1] == ':') {
            continue;
        }
        if (word[word.size()-1] == ','){
            word = word.substr(0, word.size()-1);
        }
        string opcode = opcode_table[word];
        if (symbol_table.find(word) != symbol_table.end()) {
            opcode = symbol_table[word];
            opcode = opcode.substr(2,2) + " " + opcode.substr(0,2);
        }
        if (opcode == "") {
            if (word.size() == 2)
            opcode = word;
            else if (word.size() == 4){
                opcode = word.substr(2,2) + " " + word.substr(0,2);
            }
        }
        writer << opcode << " ";
    }
    writer.close();
}

int main() {
    SetupOpcodes();
    pass1();
    pass2();
    return 0;
}
