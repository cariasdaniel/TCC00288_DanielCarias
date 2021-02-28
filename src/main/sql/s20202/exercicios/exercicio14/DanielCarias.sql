DO $$ BEGIN
    PERFORM drop_functions();
    PERFORM drop_tables();
END $$;

drop table if exists cliente cascade;
CREATE TABLE cliente ( 
cpf integer NOT NULL, 
nome character varying NOT NULL, 
CONSTRAINT cliente_pk PRIMARY KEY (cpf)); 

drop table if exists conta cascade;
CREATE TABLE conta ( 
agencia integer NOT NULL, 
numero integer NOT NULL, 
cliente integer NOT NULL, 
saldo real NOT NULL default 0, 
CONSTRAINT conta_pk PRIMARY KEY (agencia, numero), 
CONSTRAINT cliente_fk FOREIGN KEY (cliente) REFERENCES cliente (cpf));

drop table if exists movimentacao cascade;
CREATE TABLE movimentacao ( 
agencia integer NOT NULL, 
conta integer NOT NULL, 
data_hora timestamp NOT NULL default current_timestamp, 
valor real NOT NULL, 
descricao character varying NOT NULL, 
CONSTRAINT mov_pk PRIMARY KEY (conta,agencia,data_hora), 
cONSTRAINT conta_fk FOREIGN KEY (agencia,conta) REFERENCES conta (agencia, numero));

INSERT INTO cliente (cpf, nome) VALUES (438183524, 'Baccano');
INSERT INTO cliente (cpf, nome) VALUES (782645553, 'William');
INSERT INTO cliente (cpf, nome) VALUES (132135443, 'Baulo');
INSERT INTO cliente (cpf, nome) VALUES (153783453, 'Alessandra');
INSERT INTO cliente (cpf, nome) VALUES (135486865, 'Xarope');
INSERT INTO cliente (cpf, nome) VALUES (234865357, 'Fotocopia');
INSERT INTO cliente (cpf, nome) VALUES (169737999, 'Rolando Rocha');
INSERT INTO cliente (cpf, nome) VALUES (160372697, 'Pepopo');
INSERT INTO cliente (cpf, nome) VALUES (538966612, 'João');

INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (001, 1, 438183524, 12);
INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (001, 2, 782645553, 15465);
INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (001, 3, 132135443, 15500);
INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (002, 1, 153783453, 40000);
INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (002, 2, 135486865, 265.6);
INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (003, 1, 234865357, 23.5);
INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (003, 2, 169737999, -120);
INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (004, 1, 160372697, 3);
INSERT INTO conta (agencia, numero, cliente, saldo) VALUES (005, 1, 538966612, 666.66);

INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (001, 1, 665, 'Não');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (001, 1, 45, 'Sei');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (001, 2, 564, 'Dizer');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (001, 2, -45, 'O');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (001, 3, -400, 'Que');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (001, 2, -22, 'Mudou');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (001, 1, 21, 'Mas');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (002, 1, 5500, 'Nada');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (002, 1, -546, 'Esta');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (002, 1, 656, 'Igual');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (002, 2, 222, 'Numa');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (003, 1, -466, 'Noite');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (003, 2, 6877, 'Estranha');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (003, 2, -452, 'A');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (003, 2, 456, 'Gente');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (004, 1, 963, 'Se');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (005, 1, -78, 'Estranha');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (005, 1, 8879, 'E');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (005, 1, 3336, 'Fica');
INSERT INTO movimentacao (agencia, conta, valor, descricao) VALUES (005, 1, 666, 'Mal');
    

CREATE OR REPLACE FUNCTION controle() RETURNS integer AS $$
    declare
        ag_c integer;
        con_c integer;

        curs_c cursor for select * from conta;
        curs_m cursor for select * from movimentacao 
            where agencia = ag_c and conta = con_c;
        
    begin

        for c in curs_c loop
            ag_c = c.agencia;
            con_c = c.numero;

            for m in curs_m loop
                UPDATE conta SET saldo = conta.saldo + m.valor 
                    WHERE conta.agencia = m.agencia and conta.numero = m.conta;
            end loop;

        end loop;

        return 0;        
    end;
$$ LANGUAGE plpgsql;
