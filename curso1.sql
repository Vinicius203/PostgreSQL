INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

select nome, idade, matriculado_em AS "matriculado em"
FROM aluno;

INSERT into aluno (nome) VALUES ('Vinícius Dias');
INSERT into aluno (nome) VALUES ('Nico Steppat');
INSERT into aluno (nome) VALUES ('João Roberto');
INSERT into aluno (nome) VALUES ('Diego');

select * from aluno WHERE nome LIKE 'Di_go';

select * from aluno WHERE cpf is NOT NULL;

select * from aluno WHERE idade BETWEEN 10 and 35;

CREATE TABLE curso (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1,'HTML');
INSERT INTO curso (id, nome) VALUES (2,'Javascript');

select * from curso;

DROP TABLE aluno;

CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinicius');

select * from aluno;
select * from curso;

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id),
	
	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

select * from aluno WHERE id = 1;
select * from curso WHERE id = 1;

select aluno.nome as aluno, curso.nome as curso from aluno 
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON aluno_curso.curso_id = curso.id;

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);

INSERT INTO aluno (nome) VALUES ('Nico');

INSERT INTO curso (id, nome) VALUES (3, 'CSS');

select aluno.nome as aluno, curso.nome as curso from aluno 
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON aluno_curso.curso_id = curso.id;

select aluno.nome as aluno, curso.nome as curso from aluno 
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON aluno_curso.curso_id = curso.id;

select aluno.nome as aluno, curso.nome as curso from aluno 
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON aluno_curso.curso_id = curso.id;

select aluno.nome as aluno, curso.nome as curso from aluno 
CROSS JOIN curso;

INSERT INTO aluno (nome) VALUES ('João');

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

select aluno.nome as aluno, curso.nome as curso from aluno 
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON aluno_curso.curso_id = curso.id;

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

select aluno.nome as aluno, curso.nome as curso, aluno.id as aluno_id from aluno 
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON aluno_curso.curso_id = curso.id;

UPDATE aluno SET id = 10 WHERE id = 2;


CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

select * from funcionarios ORDER BY nome DESC;
select * from funcionarios ORDER BY nome, matricula;

select * from funcionarios ORDER BY id LIMIT 3;
select * from funcionarios ORDER BY id LIMIT 3 OFFSET 1;

select COUNT(id), SUM(id), MAX(id), MIN(id), ROUND (AVG(id), 1) from funcionarios;

select nome, sobrenome, COUNT(id)
from funcionarios
GROUP BY nome, sobrenome
ORDER BY nome;

select curso.nome, COUNT(aluno.id) from curso
LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
-- WHERE curso.nome = 'Javascript'
GROUP BY 1
HAVING COUNT(aluno.id) > 1;

SELECT nome,
COUNT(id)
from funcionarios
GROUP BY nome
HAVING COUNT(id) = 1;
