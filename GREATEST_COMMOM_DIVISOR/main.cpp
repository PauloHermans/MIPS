///Disciplina: Arquitetura e Organização de Processadores
///Atividade: Avaliação 03 – Programação em Linguagem de Montagem
///Alunos: Gabriel Toscano e Paulo Martino Hermans


#include <iostream>
#include <locale.h>


using namespace std;


int proc_mdc(int x, int y) {
    while (x != y) {
        if (x < y)
            y = y - x;
        else
            x = x - y;
        }
    return x;
}


int main(){
    setlocale(LC_ALL, "Portuguese");
    int x, y, mdc;
    cout << "ENTRE COM O VALOR X: " << endl;
    cin >> x;
    cout << "ENTRE COM O VALOR Y: " << endl;
    cin >> y;
    mdc = proc_mdc(x, y);
    cout << "O MDC dos valores " << x << " e " << y << " é " << mdc << endl;
    return 0;
}
