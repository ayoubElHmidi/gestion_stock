CREATE table famille (
    id_famille int NOT NULL AUTO_INCREMENT PRIMARY key,
    nom_famille varchar(100),
    image_famille varchar(100),
    description_fam TEXT
);

create table categorie (
    id_categorie int not Null primary key auto_increment ,
    nom_categorie varchar(100), 
    image_categorie varchar(100),
    description_cat TEXT ,
    id_famille int ,
    Foreign Key (id_famille) REFERENCES famille(id_famille)
);

create table lot (
    id_lot int PRIMARY key not null ,
    date_fabrication date ,
    date_permition date 
);
create table Bon_Sortie (
    id_bon int primary key auto_increment not null ,
    date_sortie date ,
    heure_sortie time ,
    quantite float ,
    id_produit int ,
    FOREIGN KEY (id_produit) REFERENCES produit(id_produit)
)

CREATE Table produit (
    id_pro int primary key not null auto_increment ,
    nom_pro varchar(100) , 
    image_pro VARCHAR(100),
    marque_pro VARCHAR(50),
    prix_pro FLOAT ,
    date_entre date,
    qte_pro int ,
    type_pro varchar(20) ,
    description_pro TEXT ,
    instruction_utilisation VARCHAR(200),
    id_categorie int ,
    id_forniseur int ,
    id_lot INT
    FOREIGN KEY (id_categorie ) REFERENCES CATEGORIE(id_categorie ),
    FOREIGN KEY (id_forniseur ) REFERENCES forniseurs(id_forni),
    FOREIGN KEY (id_lot ) REFERENCES LOT(id_lot )
);
CREATE TABLE fournisseur (
    id_forni int PRIMARY key not null auto_increment ,
    nom_forni varchar(100),
    adresse_forni varchar(100),
    telephone_forni varchar(30),
    email_forni varchar(100),
    produit_fornire
    );
create TABLE Personnel (
    id_perso int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_perso varchar(100),
    prenom_perso varchar(100),
    adrs_perso VARCHAR(100),
    tele varchar(20),
    post varchar(30),
    login_perso varchar(50),
    password_perso varchar(50),
);
create table commande_achat(
    id_cmdA int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_commande DATE,
    id_forniseur int ,
    id_produit int ,
    FOREIGN KEY (id_forniseur) REFERENCES fournisseur(id_forni),
    FOREIGN KEY (id_produit) REFERENCES produit(id_pro)
);
create table detailCommande (
    id_detailComm int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_comdA int ,
    id_pro int ,
    qte int ,
    prixUniter FLOAT(8.2),
    prixTotal FLOAT(8.2),
    idSerieLot FLOAT(8.2),
    garentie date ,
    FOREIGN KEY (id_comdA) REFERENCES commande_achat(id_cmdA),
    FOREIGN KEY (id_pro) REFERENCES produit(id_pro)
);
create table facture_achat(
    id_fact int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numFact varchar(10),
    date_fact date,
    idForni int ,
    statu_paiement varchar(20) ,
    montantHT FLOAT(8.2),
    id_cmdA int ,
    FOREIGN KEY (id_cmdA) REFERENCES commande_achat(id_cmdA),
    FOREIGN KEY (idForni) REFERENCES fournisseur(id_forni)
);

create table livraison(
    id_livr int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date_livraison date,
    heure_livraison time,
    adresselivraison varchar(100),
    tel_contact varchar(30),
    id_cmdA int ,
    statu varchar(10) ,
    FOREIGN KEY (id_cmdA) REFERENCES commande_achat(id_cmdA)
);

create table detail_livreson(
    id_detLiv int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_livr int ,
    id_prod int ,
    id_facture int ,
    quantite int ,
    FOREIGN KEY (id_livr) REFERENCES livraison(id_livr),
    FOREIGN KEY (id_prod) REFERENCES produit(id_pro),
    FOREIGN KEY (id_facture) REFERENCES facture_achat(id_fact)
);
