#include <algorithm>
#include<iostream>
#include<fstream>
#include<string>
#include<sstream>
using namespace std;

int getGiftWrapArea(int l, int w, int h) {
	int side1 = l * w;
	int side2 = w * h;
	int side3 = l * h;
	int slack = min(side1, side2);
	slack = min(slack, side3);

	return 2 * (side1+side2+side3) + slack;
}

int getRibbon(int l, int w, int h) {
	int wrap{2*l + 2*w};
	wrap = min(wrap, 2*w + 2*h);
	wrap = min(wrap, 2*l + 2*h);

	return wrap + (l*w*h);
}

int main() {
	fstream fin("daytwo.txt");
	long totalArea{0};
	long totalRibbon{0};
	string line{};

	string dimensionStr{};
	int dimensionVal{};
	vector<int> currentDims{};
	while (getline(fin, line)) {
		stringstream s(line);
		while (getline(s, dimensionStr, 'x')) {
			dimensionVal = stoi(dimensionStr);
			currentDims.push_back(dimensionVal);
		}
		if (currentDims.size() == 3) {
			totalArea += getGiftWrapArea(currentDims.at(0), currentDims.at(1), currentDims.at(2));
			totalRibbon += getRibbon(currentDims.at(0), currentDims.at(1), currentDims.at(2));
		}
		currentDims = {};
	}
	cout << "Need " << totalArea << " sq ft of wrapping paper" << endl;
	cout << "and " << totalRibbon << " ft of ribbon" << endl;
}
