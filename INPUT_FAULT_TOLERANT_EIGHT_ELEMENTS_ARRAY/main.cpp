///Disciplina: Arquitetura e Organização de Processadores
///Atividade: Avaliação 02 – Programação em Linguagem de Montagem
///Alunos: Gabriel Toscano e Paulo Martino Hermans


#include <iostream>


using namespace std;


int main(){
    int vet[8] = {0,0,0,0,0,0,0,0};
    int ind, imp=0;
    cout << "ENTRE COM O TAMANHO DO VETOR (MAX: 8): ";
    cin >> ind;
    while(ind < 2 || ind > 8){
        cout << "VALOR INVALIDO, ESCOLHA DE 2 ATÉ 8: ";
        cin >> ind;
    }
    for(int i=0; i<ind; i++){
        cout << "ENTRE COM A[" << i << "]: ";
        cin >> vet[i];
    }
    while(imp >= 0 && imp < ind){
        cout << "\nDIGITE O INDICE A SER IMPRESSO: ";
        cin >> imp;
        if(imp >= 0 && imp < ind){
            cout << "A[" << imp <<"] = " << vet[imp];
        }
    }
}
