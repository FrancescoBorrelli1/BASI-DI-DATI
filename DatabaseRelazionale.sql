-- Creazione della tabella filiera
CREATE TABLE filiera (
    id_filiera INT PRIMARY KEY,
    agricoltura VARCHAR(50),
    allevamento VARCHAR(50),
    pesca VARCHAR(50),
    biologico BOOLEAN
);

-- Creazione della tabella azienda
CREATE TABLE azienda (
    id_azienda INT PRIMARY KEY,
    nome_azienda VARCHAR(20),
    p_iva VARCHAR(20),
    id_proprietario INT,
    numero_aziendale VARCHAR(20) UNIQUE,
    email VARCHAR(50),
    regione VARCHAR(20),
    data_fondazione DATE,
    id_filiera INT,  -- Chiave esterna per la tabella filiera
    FOREIGN KEY (id_filiera) REFERENCES filiera(id_filiera)
);

-- Creazione della tabella dipendenti
CREATE TABLE dipendenti (
    id_dipendente INT PRIMARY KEY,
    nome_dipendente VARCHAR(10) NOT NULL,
    cognome_dipendente VARCHAR(10) NOT NULL,
    data_nascita DATE NOT NULL,
    id_azienda INT,  -- Chiave esterna per la tabella azienda
    FOREIGN KEY (id_azienda) REFERENCES azienda(id_azienda)
);

-- Creazione della tabella proprietario
CREATE TABLE proprietario (
    id_proprietario INT PRIMARY KEY,
    id_azienda INT,  -- Chiave esterna per la tabella azienda
    nome_proprietario VARCHAR(10),
    cognome_proprietario VARCHAR(10),
    c_f VARCHAR(50),
    numero_telefono VARCHAR(10),
    email VARCHAR(50),
    FOREIGN KEY (id_azienda) REFERENCES azienda(id_azienda)
);

-- Creazione della tabella cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(50),
    cognome_cliente VARCHAR(50),
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(15),
    indirizzo VARCHAR(100),
    regione VARCHAR(20)
);


-- Creazione della tabella prodotto
CREATE TABLE prodotto (
    id_prodotto INT PRIMARY KEY,
    nome VARCHAR(10),
    prezzo INT,
    peso DOUBLE,
    id_azienda INT,  -- Chiave esterna per la tabella azienda
    FOREIGN KEY (id_azienda) REFERENCES azienda(id_azienda)
);

-- Creazione della tabella ordini
CREATE TABLE ordini (
    id_ordine INT PRIMARY KEY,
    id_prodotto INT,  -- Chiave esterna per la tabella prodotto
    id_cliente INT,   -- Chiave esterna per la tabella cliente
    data_ordine DATE,
    stato VARCHAR(20),
    quantita INT,
    prezzo_totale DOUBLE,
    FOREIGN KEY (id_prodotto) REFERENCES prodotto(id_prodotto),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);



INSERT INTO filiera (id_filiera, agricoltura, allevamento, pesca, biologico) VALUES
(1, 'Frutta', 'Bovini', 'Tonno', TRUE),
(2, 'Cereali', 'Ovini', 'Pesce Spada', FALSE),
(3, 'Verdure', 'Suini', 'Gamberi', TRUE),
(4, 'Legumi', 'Caprini', 'Cozze', FALSE),
(5, 'Frutta Secca', 'Avicoli', 'Polpo', TRUE),
(6, 'Riso', 'Conigli', 'Sardine', FALSE),
(7, 'Viti', 'Equini', 'Aragoste', TRUE),
(8, 'Olive', 'Struzzi', 'Granchi', FALSE),
(9, 'Tuberi', 'Camellidi', 'Calamari', TRUE),
(10, 'Erbe', 'Api', 'Ricci di Mare', FALSE);



INSERT INTO azienda (id_azienda, nome_azienda, p_iva, id_proprietario, numero_aziendale, email, regione, data_fondazione, id_filiera) VALUES
(1, 'AgriTech Srl', '12345678901', 1, '0987654321', 'info@agritech.com', 'Lombardia', '2000-01-01', 1),
(2, 'BioHarvest Spa', '12345678902', 2, '0987654322', 'info@bioharvest.it', 'Veneto', '2001-02-01', 2),
(3, 'GreenPastures Ltd', '12345678903', 3, '0987654323', 'info@greenpastures.com', 'Sicilia', '2002-03-01', 3),
(4, 'EcoFarm SRL', '12345678904', 4, '0987654324', 'info@ecofarm.com', 'Toscana', '2003-04-01', 4),
(5, 'HealthyLand Spa', '12345678905', 5, '0987654325', 'info@healthyland.it', 'Lazio', '2004-05-01', 5),
(6, 'OceanHarvest Ltd', '12345678906', 6, '0987654326', 'info@oceanharvest.com', 'Emilia-Romagna', '2005-06-01', 6),
(7, 'NatureFoods Spa', '12345678907', 7, '0987654327', 'info@naturefoods.it', 'Calabria', '2006-07-01', 7),
(8, 'FarmersCoop', '12345678908', 8, '0987654328', 'info@farmerscoop.com', 'Piemonte', '2007-08-01', 8),
(9, 'SunField SRL', '12345678909', 9, '0987654329', 'info@sunfield.com', 'Sardegna', '2008-09-01', 9),
(10, 'BioRural Spa', '12345678910', 10, '0987654330', 'info@biorural.it', 'Puglia', '2009-10-01', 10);


-- Inserimento nella tabella dipendenti
INSERT INTO dipendenti (id_dipendente, nome_dipendente, cognome_dipendente, data_nascita, id_azienda) VALUES
(1, 'Mario', 'Rossi', '1990-01-01', 1),
(2, 'Luigi', 'Verdi', '1985-02-02', 2),
(3, 'Anna', 'Bianchi', '1992-03-03', 3),
(4, 'Marco', 'Gialli', '1988-04-04', 4),
(5, 'Giulia', 'Neri', '1995-05-05', 5),
(6, 'Paolo', 'Blu', '1991-06-06', 6),
(7, 'Elena', 'Arancioni', '1989-07-07', 7),
(8, 'Francesco', 'Viola', '1993-08-08', 8),
(9, 'Silvia', 'Rosa', '1996-09-09', 9),
(10, 'Claudio', 'Beige', '1994-10-10', 10);



-- Inserimento nella tabella proprietario
INSERT INTO proprietario (id_proprietario, id_azienda, nome_proprietario, cognome_proprietario, c_f, numero_telefono, email) VALUES
(1, 1, 'Alessandro', 'Rossi', 'ABCDEF12345', '1234567890', 'alessandro.rossi@example.com'),
(2, 2, 'Giorgio', 'Verdi', 'BCDEFG23456', '1234567891', 'giorgio.verdi@example.com'),
(3, 3, 'Luca', 'Bianchi', 'CDEFGH34567', '1234567892', 'luca.bianchi@example.com'),
(4, 4, 'Matteo', 'Gialli', 'DEFGHI45678', '1234567893', 'matteo.gialli@example.com'),
(5, 5, 'Simone', 'Neri', 'EFGHIJ56789', '1234567894', 'simone.neri@example.com'),
(6, 6, 'Antonio', 'Blu', 'FGHIJK67890', '1234567895', 'antonio.blu@example.com'),
(7, 7, 'Emanuela', 'Arancioni', 'GHIJKL78901', '1234567896', 'emanuela.arancioni@example.com'),
(8, 8, 'Sara', 'Viola', 'HIJKLM89012', '1234567897', 'sara.viola@example.com'),
(9, 9, 'Giovanni', 'Rosa', 'IJKLMN90123', '1234567898', 'giovanni.rosa@example.com'),
(10, 10, 'Michela', 'Beige', 'JKLMNOP01234', '1234567899', 'michela.beige@example.com');

INSERT INTO cliente (id_cliente, nome_cliente, cognome_cliente, email, telefono, indirizzo, regione) VALUES
(1, 'Marco', 'Rossi', 'marco.rossi@example.com', '3401234567', 'Via Roma 10, Milano', 'Lombardia'),
(2, 'Giulia', 'Bianchi', 'giulia.bianchi@example.com', '3502345678', 'Via Venezia 5, Venezia', 'Veneto'),
(3, 'Luca', 'Verdi', 'luca.verdi@example.com', '3603456789', 'Corso Italia 15, Torino', 'Piemonte'),
(4, 'Anna', 'Neri', 'anna.neri@example.com', '3704567890', 'Via Napoli 20, Napoli', 'Campania'),
(5, 'Francesco', 'Ferrari', 'francesco.ferrari@example.com', '3805678901', 'Viale Dante 12, Firenze', 'Toscana'),
(6, 'Sara', 'Esposito', 'sara.esposito@example.com', '3906789012', 'Piazza del Duomo 2, Bari', 'Puglia'),
(7, 'Davide', 'Ricci', 'davide.ricci@example.com', '3207890123', 'Via Garibaldi 3, Bologna', 'Emilia-Romagna'),
(8, 'Elisa', 'Gallo', 'elisa.gallo@example.com', '3308901234', 'Via Mazzini 8, Cagliari', 'Sardegna'),
(9, 'Matteo', 'Fontana', 'matteo.fontana@example.com', '3109012345', 'Via Manzoni 7, Palermo', 'Sicilia'),
(10, 'Chiara', 'Martini', 'chiara.martini@example.com', '3001234567', 'Via Dante 9, Genova', 'Liguria');


INSERT INTO prodotto (id_prodotto, nome, prezzo, peso, id_azienda) VALUES
(1, 'Mela', 2, 0.2, 1),
(2, 'Pera', 3, 0.25, 2),
(3, 'Banana', 1, 0.3, 3),
(4, 'Pomodoro', 4, 0.15, 4),
(5, 'Carota', 2, 0.1, 5),
(6, 'Zucchina', 3, 0.2, 6),
(7, 'Patata', 1, 0.3, 7),
(8, 'Arancia', 3, 0.25, 8),
(9, 'Ciliegia', 5, 0.05, 9),
(10, 'Pesca', 4, 0.3, 10);



INSERT INTO ordini (id_ordine, id_prodotto, id_cliente, data_ordine, stato, quantita, prezzo_totale) VALUES
(1, 1, 1, '2023-01-01', 'Consegnato', 5, 10.0),
(2, 2, 2, '2023-01-05', 'In lavorazione', 10, 30.0),
(3, 3, 3, '2023-01-10', 'Spedito', 20, 20.0),
(4, 4, 4, '2023-01-15', 'Consegnato', 15, 60.0),
(5, 5, 5, '2023-02-01', 'Cancellato', 25, 50.0),
(6, 6, 6, '2023-02-10', 'Spedito', 30, 90.0),
(7, 7, 7, '2023-02-15', 'Consegnato', 50, 50.0),
(8, 8, 8, '2023-03-01', 'In lavorazione', 40, 120.0),
(9, 9, 9, '2023-03-10', 'Consegnato', 60, 300.0),
(10, 10, 10, '2023-03-20', 'Spedito', 35, 140.0);


