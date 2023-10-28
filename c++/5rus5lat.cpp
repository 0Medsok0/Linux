#include <iostream>
#include <vector>

using namespace std;

const int Nсл = 3;
const int Nн_max = 30;
const int Nн_min = 4;
const int Nш = 10;

vector<vector<int>> STRUC = {{30, 30, 25, 4}};
vector<vector<double>> NET(Nсл + 1, vector<double>(Nн_max + 1));
vector<vector<double>> OUT(Nсл + 1, vector<double>(Nн_max + 1));
vector<vector<vector<double>>> W(Nсл + 1, vector<vector<double>>(Nн_max + 1, vector<double>(Nн_max + 1)));
vector<vector<int>> PATTERN(Nш + 1, vector<int>(Nн_max + 1));
vector<vector<int>> TARGET(Nш + 1, vector<int>(Nн_min + 1));

int main() {
    // Создаем нейронную сеть
    for (int k = 1; k <= Nсл; k++) {
        for (int i = 1; i <= STRUC[k - 1][k]; i++) {
            NET[k][i] = 0;
            OUT[k][i] = 0;
            for (int j = 1; j <= STRUC[k - 1][k - 1]; j++) {
                W[k][i][j] = 0;
            }
        }
    }
    
    // реализация тут
    
    return 0;
}
