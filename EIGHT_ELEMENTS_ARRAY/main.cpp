///Disciplina: Arquitetura e Organização de Processadores 
///Atividade: Avaliação 01 – Programação em Linguagem de Montagem 
///Exercício 03
///Alunos: Gabriel Toscano e Paulo Martino Hermans

#include <iostream>
#include <locale.h>

using namespace std;

int main(){
    setlocale(LC_ALL, “Portuguese”);
    int A[8];
    cout << “LEITURA DOS ELEMENTOS DO VETOR:” << endl;
    for (int i=0; i<8; i++){
        cout << “ENTRE COM A[“ << i << “]:” << endl;
        cin >> A[i];
    }
    cout << “APRESENTAÇÃO DO VETOR LIDO:” << endl;
    for (int i=0; i<8; i++){
        cout << “A[“ << i << “] = ” << A[i] << endl;
    }
    return 0;
}
