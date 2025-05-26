# 📈 Monitor de Criptomoedas

Aplicativo multiplataforma para monitoramento em tempo quase real de preços e variações de criptomoedas, com alertas e visualizações interativas. Desenvolvido em Rust, Go e Dart. 

## 🚀 Visão Geral

Este projeto é uma aplicação completa composta por três módulos independentes, integrados de forma eficiente:

- 🦀 **Rust (Coletor de Dados)**: Responsável por consultar periodicamente a API do CoinGecko e enviar dados atualizados ao backend.
- 🟡 **Go (Orquestrador & API)**: Processa os dados recebidos, mantém um histórico em memória, calcula rankings e alertas, e fornece uma API REST.
- 🎯 **Flutter (Interface Gráfica)**: Aplicativo mobile que consome a API Go para exibir as informações de forma amigável ao usuário.

## 👤 Persona de Uso

**Luana**, 24 anos, estudante de economia e investidora iniciante. Utiliza o app diariamente para acompanhar o mercado de Bitcoin e Ethereum, recebendo alertas de variações acima de 5%.

## 🧩 Estrutura do Projeto

/monitor-cripto
├── README.md
├── .gitignore
├── rust-collector/ # Módulo de coleta em Rust
├── go-api/ # Backend e API em Go
└── flutter-app/ # Aplicativo mobile Flutter


## 🔌 APIs Externas

- [CoinGecko API](https://www.coingecko.com/en/api/documentation) – Fonte dos dados de mercado de criptomoedas.

## 🎯 Funcionalidades MVP

- Coleta de dados atualizados (preço, variação 24h, valor de mercado).
- API REST para consulta das cotações.
- App com lista de criptomoedas e suas variações.
- Ranking por valorização.
- Alertas visuais para variações acima de 5%.

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Função                      |
|------------|-----------------------------|
| Rust       | Coleta de dados via HTTP    |
| Go         | Backend, lógica e API REST  |
| Flutter    | Interface do usuário        |
| CoinGecko  | API pública de criptomoedas |

## 👨‍💻 Como Executar

### Pré-requisitos:
- Git
- [Rust](https://www.rust-lang.org/tools/install)
- [Go](https://go.dev/doc/install)
- [Flutter](https://docs.flutter.dev/get-started/install)

### Clonando o projeto:
```bash
git clone https://github.com/seu-usuario/monitor-cripto.git
cd monitor-cripto
