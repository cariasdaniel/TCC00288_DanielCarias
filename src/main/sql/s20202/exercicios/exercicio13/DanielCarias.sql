DO $$ BEGIN
    PERFORM drop_functions();
    PERFORM drop_tables();
END $$;

drop table if exists campeonato cascade; 
CREATE TABLE campeonato ( 
    codigo text NOT NULL, 
    nome TEXT NOT NULL, 
    ano integer not null, 
    CONSTRAINT campeonato_pk PRIMARY KEY (codigo)); 

drop table if exists time_ cascade; 
CREATE TABLE time_ ( 
    sigla text NOT NULL, 
    nome TEXT NOT NULL, 
    CONSTRAINT time_pk PRIMARY KEY (sigla)); 

drop table if exists jogo cascade; 
CREATE TABLE jogo ( 
    campeonato text not null, 
    numero integer NOT NULL, 
    time1 text NOT NULL, 
    time2 text NOT NULL, 
    gols1 integer not null, 
    gols2 integer not null, 
    data_ date not null, 
    CONSTRAINT jogo_pk PRIMARY KEY (campeonato,numero), 
    CONSTRAINT jogo_campeonato_fk FOREIGN KEY (campeonato) REFERENCES campeonato (codigo), 
    CONSTRAINT jogo_time_fk1 FOREIGN KEY (time1) REFERENCES time_ (sigla), 
    CONSTRAINT jogo_time_fk2 FOREIGN KEY (time2) REFERENCES time_ (sigla)); 

INSERT INTO campeonato (codigo, nome, ano)
VALUES ('001', 'Camboinhas Soccer', '2001');
INSERT INTO campeonato (codigo, nome, ano)
VALUES ('002', 'Só os bons', '2001');
INSERT INTO campeonato (codigo, nome, ano)
VALUES ('003', 'Dois reais', '2013');

INSERT INTO time_ (sigla, nome) VALUES ('FLA', 'Flamensgo');
INSERT INTO time_ (sigla, nome) VALUES ('BRO', 'Bromance');
INSERT INTO time_ (sigla, nome) VALUES ('SIK', 'Sikarios da Beirada');
INSERT INTO time_ (sigla, nome) VALUES ('PNG', 'Peingeimin');
INSERT INTO time_ (sigla, nome) VALUES ('CRR', 'Correria');

INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '1', 'FLA', 'BRO', '0', '1', '2001-05-02');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '2', 'FLA', 'SIK', '2', '5', '2001-05-02');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '3', 'PNG', 'FLA', '4', '4', '2001-05-03');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '4', 'CRR', 'FLA', '3', '4', '2001-05-03');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '5', 'BRO', 'SIK', '5', '0', '2001-05-04');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '6', 'BRO', 'PNG', '2', '0', '2001-05-04');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '7', 'CRR', 'BRO', '4', '3', '2001-05-05');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '8', 'SIK', 'PNG', '1', '0', '2001-05-05');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '9', 'SIK', 'CRR', '2', '1', '2001-05-06');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('001', '10', 'PNG', 'CRR', '4', '2', '2001-05-06');

INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '1', 'FLA', 'BRO', '0', '0', '2001-07-02');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '2', 'FLA', 'SIK', '4', '3', '2001-07-02');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '3', 'PNG', 'FLA', '5', '4', '2001-07-03');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '4', 'CRR', 'FLA', '0', '4', '2001-07-03');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '5', 'BRO', 'SIK', '2', '3', '2001-07-04');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '6', 'BRO', 'PNG', '1', '3', '2001-07-04');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '7', 'CRR', 'BRO', '3', '3', '2001-07-05');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '8', 'SIK', 'PNG', '1', '5', '2001-07-05');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '9', 'SIK', 'CRR', '1', '1', '2001-07-06');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('002', '10', 'PNG', 'CRR', '2', '3', '2001-07-06');

INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('003', '1', 'FLA', 'BRO', '6', '0', '2013-07-02');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('003', '2', 'FLA', 'SIK', '4', '2', '2013-07-02');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('003', '3', 'PNG', 'FLA', '4', '3', '2013-07-03');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('003', '4', 'BRO', 'SIK', '2', '3', '2013-07-04');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('003', '5', 'BRO', 'PNG', '5', '1', '2013-07-04');
INSERT INTO jogo (campeonato, numero, time1, time2, gols1, gols2, data_) 
VALUES ('003', '6', 'SIK', 'PNG', '2', '2', '2013-07-05');


CREATE OR REPLACE FUNCTION classificacao (c text, p1 int, p2 int) 
    RETURNS table (time_sgl text, pontos int, num_vitorias int) AS $$

    declare
        p record;

    begin
        drop table if exists rank cascade; 
        create table rank (
            t text not null, 
            pontos integer not null, 
            vitorias integer not null,
            constraint rank_pk primary key (t),
            CONSTRAINT rank_time_fk1 FOREIGN KEY (t) REFERENCES time_ (sigla));

        for p in (select time1, time2, gols1, gols2 from jogo where campeonato = c) loop
            if p.gols1 > p.gols2 then
                insert into rank (t, pontos, vitorias) 
                        values (p.time1, 3, 1)
                        ON CONFLICT (t) DO UPDATE  
                        set    pontos = rank.pontos+3,
                                vitorias= rank.vitorias+1 
                        where  rank.t = p.time1;
            elsif p.gols2 > p.gols1 then
                insert into rank (t, pontos, vitorias) 
                        values (p.time2, 3, 1)
                        ON CONFLICT (t) DO UPDATE  
                        set    pontos = rank.pontos+3,
                                vitorias= rank.vitorias+1 
                        where  rank.t = p.time2;
            else
                insert into rank (t, pontos, vitorias) 
                        values (p.time1, 1, 0)
                        ON CONFLICT (t) DO UPDATE  
                        set    pontos = rank.pontos+1 
                        where  rank.t = p.time1;

                insert into rank (t, pontos, vitorias) 
                        values (p.time2, 1, 0)
                        ON CONFLICT (t) DO UPDATE  
                        set    pontos = rank.pontos+1 
                        where  rank.t = p.time2;
            end if;
        end loop;
        return query select * from rank order by pontos desc, vitorias desc;
    end;
$$ LANGUAGE plpgsql;

