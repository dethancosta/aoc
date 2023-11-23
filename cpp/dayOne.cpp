#include <cstdio>
#include <ios>
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

vector<int> getFloor(std::string filename) {
	char ch;
	fstream fin(filename, fstream::in);
	int floor{0};
	int count{0};
	int basement{-1};
	while (fin >> noskipws >> ch) {
		switch (ch) {
			case '(':
			floor++;
			break;

			case ')':
			floor--;
			break;
		}
		count++;

		if (basement == -1 && floor == -1) {
			basement = count;
		}
	}
	return vector<int>{floor, basement};
}

int main() {
	vector<int> res = getFloor("dayone.txt");
	cout << "Final floor: " << res[0] << endl;
	cout << "Basement at: " <<  res[1] << endl;
	return 0;
}
