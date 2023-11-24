#include <cstdio>
#include <fstream>
#include <ios>
#include <iostream>
#include <set>
#include <string>
using namespace std;


int housesVisited(string filename) {
	char ch;
	fstream fin(filename, fstream::in);
	bool roboTurn{false};

	set<string> visited{"0,0"};
	array<int, 2> current{0,0};
	array<int, 2> currentRobo{0, 0};
	int count{1};

	while (fin >> noskipws >> ch) {
		switch (ch) {
			case '^':
			roboTurn ? current[1]++ : currentRobo[1]++;
			break;
			case 'v':
			roboTurn ? current[1]-- : currentRobo[1]--;
			break;
			case '>':
			roboTurn ? current[0]++ : currentRobo[0]++;
			break;
			case '<':
			roboTurn ? current[0]-- : currentRobo[0]--;
			break;
		}
		roboTurn = !roboTurn;
		string currentStr = to_string(current.at(0)) + "," + to_string(current.at(1));
		string roboStr = to_string(currentRobo.at(0)) + "," + to_string(currentRobo.at(1));
		if (!visited.contains(currentStr) || !visited.contains(roboStr)) {
			count++;
		}
		visited.insert(currentStr);
		visited.insert(roboStr);
	}
	
	return count;
}

int main() {
	cout << housesVisited("daythree.txt") << endl;
}
