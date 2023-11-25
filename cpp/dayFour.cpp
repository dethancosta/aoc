#include <cstdio>
#include <stdio.h>
#include <iostream>
#include <string>

#include <CommonCrypto/CommonDigest.h>

using namespace std;

string getHash(string input, int postfix) {
	unsigned char hash[CC_MD5_DIGEST_LENGTH];
	const string toHash = input.append(to_string(postfix));
	
	CC_MD5_CTX context;
	CC_MD5_Init(&context);
	CC_MD5_Update(&context, toHash.c_str(), (CC_LONG)strlen(toHash.c_str()));
	CC_MD5_Final(hash, &context);

	char buff[2*CC_MD5_DIGEST_LENGTH+1];
	for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
		sprintf(&buff[i*2], "%.2x", (unsigned int)hash[i]);
	}

	return string(buff);
}

int main() {
	string input = "yzbqklnj";
	int lowest = 1;
	string hash = getHash(input, lowest);

	while (hash.substr(0, 6) != "000000") {
		lowest++;
		hash = getHash(input, lowest);
	}

	cout << "Lowest: " << to_string(lowest) << endl;
	cout << "Hash Result: " << hash << endl;
}
