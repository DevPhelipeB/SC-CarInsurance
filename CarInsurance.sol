// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarInsurance {

    struct Client {
        string name;
        uint256 premium;        // Prêmio pago pelo cliente
        uint256 balance;        // Saldo disponível para indenizações
        bool isInsured;         // Status de seguro
        bool hasClaimed;        // Status de reivindicação
    }

    address public insurer;     // Endereço do seguro
    mapping(address => Client) public clients;

    modifier onlyInsurer() {
        require(msg.sender == insurer, "Only the insurer can execute this function");
        _;
    }

    modifier onlyInsured() {
        require(clients[msg.sender].isInsured, "Only insured clients can execute this function");
        _;
    }

    event ClientRegistered(address client, string name);
    event PremiumPaid(address client, uint256 amount);
    event ClaimProcessed(address client, uint256 amount);

    constructor() {
        insurer = msg.sender;
    }

    // Função para registrar um novo cliente
    function registerClient(address clientAddress, string memory name) public onlyInsurer {
        require(!clients[clientAddress].isInsured, "Client is already registered");

        clients[clientAddress] = Client({
            name: name,
            premium: 0,
            balance: 0,
            isInsured: true,
            hasClaimed: false
        });
        
        emit ClientRegistered(clientAddress, name);
    }

    // Função para o cliente pagar o prêmio
    function payPremium() public payable onlyInsured {
        require(msg.value > 0, "The premium value must be positive");

        clients[msg.sender].premium += msg.value;
        clients[msg.sender].balance += msg.value;
        
        emit PremiumPaid(msg.sender, msg.value);
    }

    // Função para solicitar uma indenização
    function requestClaim(uint256 claimAmount) public onlyInsured {
        Client storage client = clients[msg.sender];
        
        require(client.balance >= claimAmount, "Insufficient balance for this claim");
        require(!client.hasClaimed, "Claim already requested for this period");

        client.balance -= claimAmount;
        client.hasClaimed = true;

        payable(msg.sender).transfer(claimAmount);
        
        emit ClaimProcessed(msg.sender, claimAmount);
    }

    // Função para reiniciar o status da indenização do cliente no próximo período
    function resetClaimStatus(address clientAddress) public onlyInsurer {
        clients[clientAddress].hasClaimed = false;
    }
}
