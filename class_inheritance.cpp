/*Классы:
1 реагент;
2 углерод;
3 железо.
Используя виртуальные функции, не зная с объектом какого
класса вы работаете, выведите на экран его количество и
свойства(форма кристаллической решетки для углерода и чистота выработки руды для железа)*/
#include<iostream>
#include<conio.h>
#include<stdlib.h>
using namespace std;


class Reagent {
protected:
	double x;
	string p;
public:
	void set_dim(double i, string j) {
		x = i;
		p = j;
	}
	virtual void show_property() {
		cout << "Свойства материала" << endl;
	};
};
class Uglerod : public Reagent {
public:
	void show_property() {
		cout << "Количество углерода: " << x << endl;
		cout << "Форма кристалической решетки: " << p << endl;

	}
};
class Zhelezo : public Reagent {
public:
	void show_property() {
		cout << "Количество железа: " << x << endl;
		cout << "Чистота выработки руды: " << p << endl;
	}
};
int main()
{
	setlocale(LC_ALL, "Russian"); // Русская локализация консоли
	Reagent* r; //указатель на базовый тип
	Uglerod u; //объекты производных типов
	Zhelezo zh;
	r = &u;
	r->set_dim(100, " гексагональная");
	r->show_property();
	r = &zh;
	r->set_dim(150, "высокая");
	r->show_property();
	//_getch();
	system("pause");
	return 0;
}
