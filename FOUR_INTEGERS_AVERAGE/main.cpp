///Disciplina: Arquitetura e Organização de Processadores 
///Atividade: Avaliação 01 – Programação em Linguagem de Montagem 
///Exercício 01 
///Alunos: Gabriel Toscano e Paulo Martino Hermans

#include <iostream>
#include <locale.h>

using namespace std;

int main(){
    setlocale(LC_ALL, “Portuguese”);
    int w, x, y, z;
    int media=0;
    cout << “Entre com o valor de W: ” << endl;
    cin >> w;
    cout << “Entre com o valor de X: ” << endl;
    cin >> x;
    cout << “Entre com o valor de Y: ” << endl;
    cin >> y;
    cout << “Entre com o valor de Z: ” << endl;
    cin >> z;
    media = w+x+y+z;
    media = media/4;
    cout << “A média aritmética da soma é igual a: ” << media << endl;
    return 0;
}
