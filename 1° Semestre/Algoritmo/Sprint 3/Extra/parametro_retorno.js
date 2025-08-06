// parametro - passa para a função um argumento

// console.log("1111111111")

let mensagem = "Olá, tudo bem";

function cumprimentar(mensagem1, mensagem2){
    console.log("mensagem:", mensagem1)
    console.log("mensagem:", mensagem2)
};

// cumprimentar(123);


function multiplicar(num1, num2){
let multiplicacao = num1 * num2
return multiplicacao
}

// console.log(`Multiplicação: ${multiplicar(10, 20)}`)


function filtrarLista (lista, valorEncontrar){
    const lista2 = []
    for(let i = 0; i < lista.length; i++){
        const elemento = lista[i]

        if(elemento == valorEncontrar){
            lista2.push(elemento)
        }
    }

    return lista2
}

const listaNome = ["banana","Arroz","banana","banana","Arroz","Arroz","Arroz","Arroz","Arroz",]

console.log(filtrarLista(listaNome, 'banana'))