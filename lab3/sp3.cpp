#include<iostream>
#include<ctime>
#include<cmath>

using namespace std;

void CreateArray(int **array, int arrLength)
{
	for (int i = 0; i < arrLength; i++)
	{
		array[i] = new int [i];
	}
}

void ArrayGeneration(int **array, int arrLength)
{
	//srand(time(NULL));
	for (int i = 0; i < arrLength; i++) {
		for (int j = 0; j < arrLength; j++) {
			array[i][j] = 1 + rand() % 9;
		}
	}
}

void SquareMatrixConversion(int **array, int arrLength)
{
	for (int i = 0; i < arrLength; i++)
	{
		for (int j = 0; j < arrLength; j++)
		{
			array[i][j] *= array[i][j];
		}
	}
}

int main(int argc, char** argv)
{
	srand(time(NULL));
	
	const int arrLength = 2 + rand() % 8;
	
	int **array = new int* [arrLength];
	
	CreateArray(array, arrLength);
	ArrayGeneration(array, arrLength);
	
	cout << "Исходная матрица:" << endl;
	for (int i = 0; i < arrLength; i++) {
		for (int j = 0; j < arrLength; j++)
		{
			if (j == arrLength - 1)
			{
				cout << array[i][j];
			}
			else
			{
				cout << array[i][j] << " ";
			}
		}
		cout << endl;
	}
	
	
	SquareMatrixConversion(array, arrLength);
	
	int sum = 0;
	int &ref_sum = sum;
	
	for (int i = 0; i < arrLength; i++)
	{
		for (int j = 0; j < arrLength; j++)
		{
			int &ref_array = array[i][j];
			asm(
				"mov %[ref_sum], %%rax\n\t"
				"mov %[ref_array], %%rcx\n\t"
				
				"add %%rcx, %%rax\n\t"
				
				"mov %%rax, %[ref_sum]\n\t"
				
				"end_asm:\n\t"
				
				:[ref_sum]"=m"(ref_sum), [ref_array]"=m"(ref_array)
				:
				:"%rax"
			);
		}
	}
	
	cout << endl << "Преобразованная матрица:" << endl;
	
	for (int i = 0; i < arrLength; i++) {
		for (int j = 0; j < arrLength; j++) {
			if (j == arrLength - 1)
			{
				cout << array[i][j];
			}
			else
			{
				cout << array[i][j] << "	";
			}
		}
		cout << endl;
	}
	
	cout << endl << "Cумма квадратов элементов матрицы:" << sum << endl;
	
	return 0;

}
