#include <fstream>
#include <string>
#include <iostream>
#include <vector>
using namespace std;
 
// 功能：将filename 中的数据（共cols列）读取到_vector中，_vector可视为二维数组
int read_scanf(const string &filename, const int &cols, vector<double *> &_vector)
{
	FILE *fp = fopen(filename.c_str(), "r");
	bool flag = true;
	int i = 0;
	if (!fp) 
	{ 
		cout << "File open error!\n"; 
		return 0; 
	}
 
	while (flag)
	{
		double *rowArray = new double[cols]; //new一个double类型的动态数组
 
		for (i = 0; i < cols; i++) //读取数据，存在_vector[cols]中
		{
			if (EOF == fscanf(fp,"%lf", &rowArray[i]))
			{ 
				flag = false; 
				break; 
			}
			//输出rowArray存入的数据
			//cout << rowArray[0] << " " << rowArray[1] << " " << rowArray[2] << " " << rowArray[3] << endl;
		}
		if (cols == i) //将txt文本文件中的一行数据存入rowArray中，并将rowArray存入vector中
			_vector.push_back(rowArray);
	}
	fclose(fp);
	return 1;
}