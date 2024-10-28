# SC-CarInsurance
Sample Car Insurance Solidity Ethereum Blockchain

**1. Configurar o Ambiente**
Para fins de teste, o Remix IDE (https://remix.ethereum.org/) é uma excelente opção, pois permite compilar e testar contratos sem a necessidade de configurações adicionais no seu computador.

**2. Compilar o Contrato no Remix**
- Abra o Remix IDE: Acesse https://remix.ethereum.org/.
- Crie um novo arquivo: No painel de arquivos, crie um novo arquivo .sol, por exemplo, CarInsurance.sol.
- Cole o código do contrato que forneci acima no editor.
- Compilação: Vá para a aba "Solidity Compiler" e selecione a versão 0.8.0 (ou qualquer outra versão compatível com o código) e clique em "Compile CarInsurance.sol".
  
**3. Implantar o Contrato no Remix**
- Aba Deploy & Run Transactions: Depois de compilar, vá para a aba “Deploy & Run Transactions”.
- Selecionar Ambiente: Escolha um ambiente como "JavaScript VM" para fazer testes locais, ou "Injected Web3" se quiser implantar na rede de testes usando sua carteira MetaMask.
- Deploy: Clique em "Deploy" para implantar o contrato. Uma vez implantado, o contrato estará visível na lista "Deployed Contracts" abaixo.
  
**4. Testar as Funcionalidades do Contrato**
Depois que o contrato estiver implantado, você poderá testar suas funções no Remix. Aqui está um guia de como fazer isso:

4.1 Registrar um Cliente
- Como Insurer: A função registerClient só pode ser chamada pelo endereço que implantou o contrato (insurer).
- Clique em registerClient, insira o endereço do cliente (um dos endereços de teste gerados pelo Remix) e o nome do cliente.
- Clique para confirmar o registro.
  
4.2 Pagar o Prêmio
- Como Cliente Registrado: Mude para o endereço do cliente registrado usando o dropdown "Account" no Remix.
- Na função payPremium, insira um valor em "Value" (quantia em wei, por exemplo, 1000000000000000000 para 1 ETH).
- Clique em payPremium para enviar o pagamento de prêmio.

4.3 Solicitar Indenização
- Como Cliente Registrado: Clique na função requestClaim.
- Insira o valor da indenização que deseja solicitar (deve ser menor ou igual ao saldo do cliente).
- Clique em requestClaim para enviar a solicitação de indenização.

4.4 Resetar o Status de Indenização
- Como Insurer: Usando o endereço da seguradora (insurer), clique em resetClaimStatus e insira o endereço do cliente.
- Clique para resetar o status de reivindicação, permitindo que o cliente faça uma nova solicitação.

**5. Interagir com o Contrato em uma Rede Testnet**
- Para usar este contrato fora do ambiente local (em uma rede de teste, como Rinkeby ou Ropsten), você precisará de uma carteira Ethereum como MetaMask:
**Configurar MetaMask:** Configure sua carteira para a rede de teste desejada.
**Obter Testnet ETH:** Acesse um faucet (como o Rinkeby ou o Goerli faucet) para obter ETH fictício para testes.
*Injetar Web3 no Remix:** No Remix, escolha "Injected Web3" como ambiente.
**Implantar e Interagir:** Repita o processo de deploy e execução de funções descrito acima, agora com a interação direta na testnet.
