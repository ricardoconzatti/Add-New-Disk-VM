# Add New Disk VM

Este script é bem simples, mas extremamente útil quando precisamos adicionar vários discos em várias máquinas virtuais. Existem alguns casos específicos onde precisamos de
controladoras de disco com configurações especificas, como é o caso do Failover Cluster com Storage Replica ou Storage Spaces Direct em máquinas virtuais e com este script toda esta configuração fica bem fácil e rápida.

 - **Ações que o Script executa**
	 - **Máquinas Virtuais**
		 - Cria uma controladora de discos
		 - Adiciona discos a nova controladora
 - **Compatibilidade**
	 - vSphere (ESXi e vCenter)
		 - Testado nas versões 6.0, 6.5 e 6.7
	 - PowerCLI
		 - Recomendo a versão 6 ou superior
 - **Pré-requisitos**
	 - vCenter Server (Windows ou Appliance) versão 5 ou superior
		 - Garantir que o vCenter esteja acessivel pela rede
	 - VMware vSphere PowerCLI versão 6 ou superior

[Mais informações](https://solutions4crowds.com.br/script-para-adicionar-discos-em-maquinas-virtuais)

