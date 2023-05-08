CREATE TABLE anotacoes(
  dia INT NOT NULL,
  mes INT NOT NULL,
  ano INT NOT NULL,
  identificador SERIAL,
  PRIMARY KEY (identificador)
);

CREATE TABLE calendario(
  dia INT NOT NULL,
  mes INT NOT NULL,
  ano INT NOT NULL,
  identificador SERIAL,
  id_anotacoes SERIAL,
  PRIMARY KEY (identificador),
  FOREIGN KEY (id_anotacoes) REFERENCES anotacoes (identificador)
);

CREATE TABLE consumoDeAgua(
  aguaPorDia DECIMAL(10, 2) NOT NULL,
  aguaBanho DECIMAL(10, 2) NOT NULL,
  aguaIngerida DECIMAL(10, 2) NOT NULL,
  aguaConsumida DECIMAL(10, 2) NOT NULL,
  identificador SERIAL,
  PRIMARY KEY (identificador)
);

CREATE TABLE notificacao(
  titulo VARCHAR(30),
  conteudo VARCHAR(200),
  identificador SERIAL,
  PRIMARY KEY (identificador)
);

CREATE TABLE timer(
  nome VARCHAR(25) NOT NULL,
  tempoInicial DECIMAL(5, 2) NOT NULL,
  tempoFinal DECIMAL(5, 2) NOT NULL,
  identificador SERIAL,
  id_notificacao SERIAL,
  PRIMARY KEY (identificador),
  FOREIGN KEY (id_notificacao) REFERENCES notificacao (identificador)
);

CREATE TABLE background(
  nivelDaAgua INT NOT NULL,
  identificador SERIAL,
  PRIMARY KEY (identificador)
);

CREATE TABLE aplicativo(
  nome VARCHAR(20) NOT NULL,
  identificador SERIAL,
  id_calendario SERIAL,
  id_consumoDeAgua SERIAL,
  id_timer SERIAL,
  id_notificacao SERIAL,
  id_background SERIAL,
  PRIMARY KEY (identificador),
  FOREIGN KEY (id_calendario) REFERENCES calendario (identificador),
  FOREIGN KEY (id_consumoDeAgua) REFERENCES consumoDeAgua (identificador),
  FOREIGN KEY (id_timer) REFERENCES timer (identificador),
  FOREIGN KEY (id_notificacao) REFERENCES notificacao (identificador),
  FOREIGN KEY (id_background) REFERENCES background (identificador)
);

CREATE TABLE usuario(
  nome VARCHAR(150) NOT NULL,
  idade INT,
  peso DECIMAL(5, 2) NOT NULL,
  altura DECIMAL(5, 2) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  email VARCHAR(100) NOT NULL,
  tempoTimer DECIMAL(5, 2) NOT NULL,
  identificador SERIAL,
  id_app SERIAL,
  id_calendario SERIAL,
  id_consumoDeAgua SERIAL,
  id_timer SERIAL,
  id_notificacao SERIAL,
  id_background SERIAL,
  PRIMARY KEY (identificador),
  FOREIGN KEY (id_app) REFERENCES aplicativo (identificador),
  FOREIGN KEY (id_calendario) REFERENCES calendario (identificador),
  FOREIGN KEY (id_consumoDeAgua) REFERENCES consumoDeAgua (identificador),
  FOREIGN KEY (id_timer) REFERENCES timer (identificador),
  FOREIGN KEY (id_notificacao) REFERENCES notificacao (identificador),
  FOREIGN KEY (id_background) REFERENCES background (identificador)
);

INSERT INTO anotacoes (dia, mes, ano) VALUES (13, 03, 2023);
INSERT INTO calendario (dia, mes, ano) VALUES (13, 03, 2023);
INSERT INTO consumoDeAgua (aguaPorDia, aguaBanho, aguaIngerida, aguaConsumida) VALUES (15, 50.2, 3.7, 72.8);
INSERT INTO notificacao (titulo, conteudo) VALUES ('Hora de se hidratar!', 'Faça uma pausa para tomar água 💧');
INSERT INTO timer (nome, tempoInicial, tempoFinal) VALUES ('Tomar água', 0.0, 10.0);
INSERT INTO background (nivelDaAgua) VALUES (2);
INSERT INTO aplicativo (nome) VALUES ('WaterClub');
INSERT INTO usuario (nome, idade, peso, altura, cpf, email, tempoTimer, id_app, id_calendario, id_consumoDeAgua, id_timer, id_notificacao, id_background) VALUES ('Pedro', 25, 51.0, 1.70, '123456789', 'pedro@gmail.com', 30.0, 1, 1, 1, 1, 1, 1);
ALTER TABLE anotacoes ADD COLUMN descricao VARCHAR(200);
