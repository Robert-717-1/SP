#include <iostream>
#include <bitset>

using namespace std;
int main(int argc, char **argv)
{
	char ch[9] = { -1, 58, -32, 14, -67, 99, -76, 25, 43 };
	
	cout << "Исходный массив:" << endl;
	for (int i = 0; i < 9; i++)
	{
		cout << (int)ch[i] << endl;
	}
	
	for (int i = 0; i < 9; i++)
	{
		if (ch[i] < 0)
		{
			ch[i] = ch[i] >> 2;
		}
		else
		{
		
			bitset<9> bitset1(ch[i]);
			bitset1[0] = 0;
			bitset1[4] = 0;
			int bts = (int)(bitset1.to_ulong());
			ch[i] = (char)bts;
		}
	}
	
	cout << "Преобразованный массив:" << endl;
	for (int i = 0; i < 9; i++)
	{
		cout << (int)ch[i] << endl;
	}
	return 0;
}
