-- CreateTable
CREATE TABLE "Usuario" (
    "idUsuario" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senhaHash" TEXT NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("idUsuario")
);

-- CreateTable
CREATE TABLE "Cliente" (
    "idCliente" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "email" TEXT,
    "cpf" TEXT NOT NULL,
    "cpfHash" TEXT NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Cliente_pkey" PRIMARY KEY ("idCliente")
);

-- CreateTable
CREATE TABLE "Barbeiro" (
    "idBarbeiro" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "cpfHash" TEXT NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Barbeiro_pkey" PRIMARY KEY ("idBarbeiro")
);

-- CreateTable
CREATE TABLE "Servico" (
    "idServico" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "preco" DECIMAL(10,2) NOT NULL,
    "duracaoMin" INTEGER NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Servico_pkey" PRIMARY KEY ("idServico")
);

-- CreateTable
CREATE TABLE "Agendamento" (
    "idAgendamento" SERIAL NOT NULL,
    "idCliente" INTEGER NOT NULL,
    "idBarbeiro" INTEGER NOT NULL,
    "idServico" INTEGER NOT NULL,
    "horario" TIMESTAMP(3) NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Agendamento_pkey" PRIMARY KEY ("idAgendamento")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Cliente_telefone_key" ON "Cliente"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "Cliente_email_key" ON "Cliente"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Cliente_cpfHash_key" ON "Cliente"("cpfHash");

-- CreateIndex
CREATE UNIQUE INDEX "Barbeiro_email_key" ON "Barbeiro"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Barbeiro_telefone_key" ON "Barbeiro"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "Barbeiro_cpfHash_key" ON "Barbeiro"("cpfHash");

-- CreateIndex
CREATE UNIQUE INDEX "Servico_nome_key" ON "Servico"("nome");

-- CreateIndex
CREATE INDEX "Agendamento_horario_idx" ON "Agendamento"("horario");

-- CreateIndex
CREATE UNIQUE INDEX "Agendamento_idBarbeiro_horario_key" ON "Agendamento"("idBarbeiro", "horario");

-- AddForeignKey
ALTER TABLE "Agendamento" ADD CONSTRAINT "Agendamento_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES "Cliente"("idCliente") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agendamento" ADD CONSTRAINT "Agendamento_idBarbeiro_fkey" FOREIGN KEY ("idBarbeiro") REFERENCES "Barbeiro"("idBarbeiro") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agendamento" ADD CONSTRAINT "Agendamento_idServico_fkey" FOREIGN KEY ("idServico") REFERENCES "Servico"("idServico") ON DELETE RESTRICT ON UPDATE CASCADE;
