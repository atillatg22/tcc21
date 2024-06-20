-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/06/2024 às 16:23
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `matricula` varchar(50) NOT NULL,
  `turma` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `cpf`, `matricula`, `turma`, `telefone`, `email`, `senha`) VALUES
(1, 'atilla', '164.389.087-54', '3686556', 'htc-dds-1-15', '(27) 99999-9999', 'atillarocha.tg22@gmail.com', '123456'),
(2, 'Rafinha Balinha', '123.456.789-04', '7894561', 'HTC-DDS-3-15', '(27) 99929-2562', 'atillarocha.tg22@gmail.com', '123456'),
(3, 'Alice', '999.999.999-99', '9999999', '9999', '(99) 99999-9999', '99999999@gmai.com', '123456');

-- --------------------------------------------------------

--
-- Estrutura para tabela `chaves`
--

CREATE TABLE `chaves` (
  `id` int(11) NOT NULL,
  `prateleira` varchar(255) NOT NULL,
  `disponivel` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chaves`
--

INSERT INTO `chaves` (`id`, `prateleira`, `disponivel`) VALUES
(1, '0-01', 1),
(2, '0-02', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `chave_id` int(11) NOT NULL,
  `aluno_cpf` varchar(14) NOT NULL,
  `data_emprestimo` datetime NOT NULL,
  `data_devolucao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id`, `chave_id`, `aluno_cpf`, `data_emprestimo`, `data_devolucao`) VALUES
(1, 1, '164.389.087-54', '2024-06-19 04:39:49', '2024-06-19 04:39:54'),
(2, 2, '123.456.789-04', '2024-06-19 13:04:50', '2024-06-19 13:06:09'),
(3, 1, '123.456.789-04', '2024-06-20 08:02:30', '2024-06-20 15:04:00'),
(4, 1, '164.389.087-54', '2024-06-20 10:04:33', '2024-06-20 15:59:02'),
(5, 2, '999.999.999-99', '2024-06-20 11:04:26', '2024-06-20 16:14:34'),
(6, 1, '164.389.087-54', '2024-06-20 11:10:02', '2024-06-20 16:14:23'),
(7, 1, '123.456.789-04', '2024-06-20 11:14:47', '2024-06-20 16:18:06'),
(8, 1, '123.456.789-04', '2024-06-20 11:18:24', NULL),
(9, 2, '999.999.999-99', '2024-06-20 11:18:32', '2024-06-20 16:20:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `chaves`
--
ALTER TABLE `chaves`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chave_id` (`chave_id`),
  ADD KEY `aluno_cpf` (`aluno_cpf`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `chaves`
--
ALTER TABLE `chaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`chave_id`) REFERENCES `chaves` (`id`),
  ADD CONSTRAINT `emprestimos_ibfk_2` FOREIGN KEY (`aluno_cpf`) REFERENCES `alunos` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
