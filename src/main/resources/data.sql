CREATE DATABASE cineanalise;
use cineanalise;

CREATE TABLE IF NOT EXISTS filmes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    sinopse VARCHAR(2000),
    genero VARCHAR(100),
    ano INT
);

-- Criar tabela analises (caso necessário)
CREATE TABLE IF NOT EXISTS analises (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    filme_id BIGINT NOT NULL,
    texto VARCHAR(2000) NOT NULL,
    nota INT NOT NULL,
    FOREIGN KEY (filme_id) REFERENCES filmes(id) ON DELETE CASCADE,
    CONSTRAINT chk_nota CHECK (nota >= 1 AND nota <= 5)
);

INSERT INTO filmes (titulo, sinopse, genero, ano) VALUES
('O Sexto Sentido', 'Um psicólogo infantil tenta ajudar um menino que afirma ver pessoas mortas. Uma jornada emocionante que culmina em uma das reviravoltas mais icônicas do cinema.', 'Suspense/Drama', 1999),

('Ilha do Medo', 'Em 1954, o detetive Teddy Daniels investiga o desaparecimento de uma paciente em um hospital psiquiátrico em uma ilha isolada. Suas descobertas vão muito além do que ele imaginava.', 'Suspense/Thriller', 2010),

('Seven - Os Sete Crimes Capitais', 'Dois detetives caçam um serial killer que usa os sete pecados capitais como motivo para seus assassinatos meticulosamente planejados.', 'Suspense/Crime', 1995),

('O Silêncio dos Inocentes', 'Uma jovem agente do FBI busca a ajuda de um brilhante psicopata canibal para capturar outro assassino em série que está aterrorizando mulheres.', 'Suspense/Thriller', 1991),

('Cisne Negro', 'Uma bailarina perfeccionista da companhia de Nova York luta para manter a sanidade enquanto compete pela cobiçada posição principal em O Lago dos Cisnes.', 'Suspense/Drama', 2010),

('Garota Exemplar', 'No dia do quinto aniversário de casamento, uma mulher desaparece misteriosamente. Seu marido se torna o principal suspeito, mas nada é o que parece.', 'Suspense/Thriller', 2014),

('Psicose', 'Uma secretária rouba dinheiro de seu empregador e foge, parando em um motel isolado administrado por um jovem tímido sob o domínio de sua mãe.', 'Suspense/Terror', 1960),

('Corra!', 'Um jovem negro visita a família de sua namorada branca pela primeira vez, descobrindo segredos perturbadores que colocam sua vida em perigo.', 'Suspense/Terror', 2017),

('À Procura da Felicidade', 'Baseado em uma história real, Chris Gardner luta para criar seu filho pequeno enquanto enfrenta a pobreza e tenta se tornar um corretor de ações de sucesso.', 'Drama/Inspiração', 2006),

('Extraordinário', 'August Pullman, um menino com deformidade facial, enfrenta o bullying quando entra em uma escola regular pela primeira vez, ensinando a todos sobre bondade e aceitação.', 'Drama/Família/Inspiração', 2017),

('Coach Carter - Treino para a Vida', 'Um controverso treinador de basquete transforma um time perdedor e ensina lições valiosas sobre responsabilidade, educação e perseverança aos seus jogadores.', 'Drama/Esporte/Inspiração', 2005),

('Vida de Pi', 'Após um naufrágio, um jovem indiano sobrevive 227 dias em um bote salva-vidas no Pacífico com um tigre de Bengala, em uma jornada de fé e autoconhecimento.', 'Aventura/Drama/Inspiração', 2012),

('O Lado Bom da Vida', 'Após perder emprego e esposa, um homem com transtorno bipolar vai morar com os pais. Lá conhece uma jovem viúva com problemas próprios, e juntos se ajudam mutuamente.', 'Romance/Drama/Inspiração', 2012),

('Matrix', 'Um hacker descobre que a realidade como ele conhece é uma simulação criada por máquinas inteligentes que usam humanos como fonte de energia.', 'Ficção Científica/Ação', 1999),

('Inception', 'Um ladrão especializado em roubar segredos do subconsciente durante o sono recebe uma última missão: plantar uma ideia na mente de alguém.', 'Ficção Científica/Thriller', 2010),

('Interestelar', 'Uma equipe de astronautas viaja através de um buraco de minhoca em busca de um novo lar para a humanidade, enquanto o tempo se comporta de forma imprevisível.', 'Ficção Científica/Drama', 2014),

('Forrest Gump', 'A vida extraordinária de um homem simples que, sem querer, influencia momentos históricos importantes dos Estados Unidos nas décadas de 60, 70 e 80.', 'Drama/Romance', 1994),

('O Poderoso Chefão', 'O patriarca envelhecido de uma dinastia do crime organizado transfere o controle de seu império clandestino para seu filho relutante.', 'Drama/Crime', 1972),

('A Lista de Schindler', 'A história real de Oskar Schindler, um empresário alemão que salvou mais de mil judeus durante o Holocausto empregando-os em suas fábricas.', 'Drama/História', 1993),

('Parasita', 'Uma família pobre planeja se infiltrar em uma casa rica, desencadeando eventos que expõem as divisões de classe na sociedade sul-coreana moderna.', 'Drama/Suspense', 2019);


INSERT INTO analises (filme_id, texto, nota) VALUES
(1, 'Uma obra-prima do suspense psicológico! O twist final é um dos melhores da história do cinema. Bruce Willis está magistral, e Haley Joel Osment entrega uma das melhores performances infantis já vistas. A frase "Eu vejo pessoas mortas" se tornou icônica por um motivo.', 5),
(1, 'M. Night Shyamalan criou uma atmosfera perturbadora e emocionante. A cada revisão você descobre novos detalhes que estavam lá o tempo todo. A cinematografia é belíssima, com tons frios que intensificam a sensação de desconforto.', 5),
(1, 'Simplesmente brilhante! A reviravolta final muda completamente a perspectiva do filme. Vale muito a pena reassistir para pegar todas as pistas que foram deixadas ao longo do caminho.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(2, 'Scorsese e DiCaprio em grande forma! A atmosfera claustrofóbica da ilha, a fotografia sombria e a trilha sonora inquietante criam uma experiência cinematográfica memorável. O mistério vai se aprofundando até a revelação final devastadora.', 5),
(2, 'Um thriller psicológico complexo que exige atenção total do espectador. Leonardo DiCaprio entrega uma performance intensa e vulnerável. O final divide opiniões, mas é inegavelmente impactante.', 4),
(2, 'Excelente filme! A direção de Scorsese é impecável, criando uma tensão constante. A ambientação dos anos 50 está perfeita, e cada ator contribui para a atmosfera de paranoia crescente.', 5);

-- Análises para "Seven" (id=3)
INSERT INTO analises (filme_id, texto, nota) VALUES
(3, 'Um dos melhores thrillers policiais já feitos! A dupla Brad Pitt e Morgan Freeman funciona perfeitamente. O filme é sombrio, perturbador e te mantém no limite da cadeira até o último segundo. A cena final é devastadora.', 5),
(3, 'David Fincher em seu melhor! A fotografia escura e chuvosa, os crimes macabros baseados nos pecados capitais, e aquele final inesquecível. Kevin Spacey está assustadoramente bom como John Doe.', 5),
(3, 'Intenso do início ao fim! A construção dos crimes é meticulosa e perturbadora. O final é um dos mais chocantes do cinema. Um filme que fica na sua cabeça por dias.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(4, 'Anthony Hopkins cria um dos vilões mais memoráveis da história do cinema! Apesar de aparecer apenas 16 minutos em tela, Hannibal Lecter domina completamente o filme. Jodie Foster está excepcional como Clarice Starling.', 5),
(4, 'Perfeito em todos os aspectos! O roteiro é brilhante, a direção é magistral, e as atuações são de tirar o fôlego. Um thriller psicológico que continua relevante e assustador décadas depois.', 5),
(4, 'Obra-prima absoluta! Merecidamente ganhou os 5 principais Oscars. A química entre Hopkins e Foster é elétrica. Cada cena entre eles é uma aula de atuação.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(5, 'Darren Aronofsky cria um thriller psicológico perturbador sobre perfeccionismo e obsessão. Natalie Portman está absolutamente brilhante, entregando uma performance física e emocionalmente devastadora que lhe rendeu o Oscar merecido.', 5),
(5, 'Visualmente deslumbrante e psicologicamente intenso! A descida à loucura da protagonista é filmada de forma magistral. A fotografia e a trilha sonora intensificam a paranoia crescente.', 5),
(5, 'Um filme perturbador que explora os limites da busca pela perfeição. As cenas de ballet são lindas, mas a tensão psicológica é constante. Natalie Portman merece todos os elogios.', 4);

INSERT INTO analises (filme_id, texto, nota) VALUES
(6, 'David Fincher entrega outro thriller magistral! Rosamund Pike está fenomenal como Amy Dunne - uma das personagens mais complexas e perturbadoras do cinema recente. O filme subverte expectativas constantemente.', 5),
(6, 'Um thriller inteligente e imprevisível! A narrativa não-linear mantém o suspense o tempo todo. Rosamund Pike merecia ter ganho o Oscar - sua performance é assustadoramente boa.', 5),
(6, 'Excelente adaptação do livro! O filme analisa relacionamentos tóxicos de forma brilhante. Ben Affleck e Rosamund Pike estão perfeitos. A trilha sonora de Trent Reznor e Atticus Ross é fantástica.', 4);

INSERT INTO analises (filme_id, texto, nota) VALUES
(7, 'Hitchcock revolucionou o cinema com este clássico! A cena do chuveiro é uma das mais icônicas da história do cinema. Anthony Perkins cria um vilão inesquecível em Norman Bates.', 5),
(7, 'Um marco do cinema de suspense! Mesmo décadas depois, o filme mantém sua capacidade de surpreender e assustar. A direção de Hitchcock é magistral em cada frame.', 5),
(7, 'Obra-prima atemporal! A reviravolta continua impressionante. O filme estabeleceu diversos elementos que se tornaram padrão no gênero de terror psicológico.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(8, 'Jordan Peele estreia na direção com um filme brilhante que mistura terror, suspense e comentário social afiado. Daniel Kaluuya está excelente. O filme mantém a tensão o tempo todo.', 5),
(8, 'Um thriller de terror inteligente e original! Peele usa o gênero para fazer crítica social poderosa sobre racismo. Cada cena tem significado, e o final é satisfatório.', 5),
(9, 'Filme inovador que redefine o horror moderno! A atmosfera desconfortável desde o início, os simbolismos inteligentes e a atuação de Daniel Kaluuya tornam este filme essencial.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(9, 'Will Smith entrega sua melhor performance! A história real de Chris Gardner é inspiradora e emocionante. O relacionamento dele com seu filho (interpretado por seu filho real Jaden) é tocante. Um filme sobre perseverança e amor paternal.', 5),
(9, 'Impossível não se emocionar! O filme mostra a luta de um pai para dar uma vida melhor ao filho enquanto enfrenta a pobreza extrema. A cena do banheiro do metrô parte o coração. Motivador e real.', 5),
(9, 'Uma história verdadeiramente inspiradora! Will Smith está magistral, mostrando a vulnerabilidade e a determinação de Chris Gardner. Um lembrete poderoso de que com trabalho duro e perseverança, podemos superar qualquer obstáculo.', 5),
(9, 'Emocionante do início ao fim! O filme não romantiza a pobreza, mas mostra a dignidade na luta. A mensagem de nunca desistir dos seus sonhos é universal e atemporal.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(10, 'Um filme lindo sobre empatia, bondade e aceitação! Jacob Tremblay está incrível como Auggie. O filme ensina lições valiosas para todas as idades sobre não julgar pelas aparências. Chorei várias vezes!', 5),
(10, 'Emocionante e inspirador! A história mostra diferentes perspectivas, não só de Auggie, mas também de sua família e colegas. Julia Roberts e Owen Wilson estão ótimos como os pais dedicados.', 5),
(10, 'Um filme necessário sobre bullying e aceitação! A mensagem "Seja gentil, pois todos estão travando batalhas difíceis" ressoa profundamente. Perfeito para assistir em família.', 5),
(10, 'Lindo e emocionante! O filme mostra que a verdadeira beleza está na forma como tratamos os outros. Jacob Tremblay entrega uma performance tocante. Recomendo para todos!', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(11, 'Samuel L. Jackson está fantástico como o treinador duro mas justo! O filme mostra que educação é tão importante quanto esporte. As lições sobre responsabilidade e compromisso são universais.', 5),
(11, 'Baseado em uma história real inspiradora! Coach Carter prova que um professor/mentor dedicado pode mudar vidas. O filme equilibra bem cenas de basquete emocionantes com drama pessoal profundo.', 5),
(11, 'Motivacional e tocante! As cenas de basquete são bem filmadas, mas o coração do filme está nas lições de vida. A mensagem sobre a importância da educação é poderosa.', 4),
(11, 'Um dos melhores filmes sobre esportes e educação! Samuel L. Jackson comanda o filme com presença e autoridade. As histórias dos jogadores são emocionantes e reais.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(12, 'Ang Lee cria uma obra-prima visual e filosófica! A sobrevivência de Pi no oceano com um tigre é ao mesmo tempo literal e metafórica. Os efeitos visuais são deslumbrantes, especialmente a cena da baleia e do mar bioluminescente.', 5),
(12, 'Uma jornada espiritual linda! O filme explora temas de fé, sobrevivência e storytelling. Suraj Sharma está excelente como Pi. A cinematografia é de tirar o fôlego.', 5),
(12, 'Visualmente espetacular! A história questiona a natureza da verdade e da fé. O relacionamento entre Pi e o tigre Richard Parker é complexo e simbólico. Um filme que te faz pensar.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(13, 'Bradley Cooper e Jennifer Lawrence têm uma química incrível! O filme aborda saúde mental de forma sensível e realista. É engraçado, emocionante e profundamente humano.', 5),
(13, 'Uma história linda sobre pessoas imperfeitas tentando superar seus traumas! O elenco todo está excelente, especialmente Robert De Niro como o pai obsessado pelos Eagles. A cena da dança final é perfeita.', 5),
(13, 'Emocionante e real! O filme mostra que todos temos nossas batalhas, e que encontrar alguém que nos entende pode fazer toda diferença. Jennifer Lawrence merecia o Oscar.', 5),
(13, 'Um romance atípico e refrescante! Não romantiza doenças mentais mas mostra pessoas reais lidando com problemas reais. Engraçado, tocante e inspirador.', 4);

INSERT INTO analises (filme_id, texto, nota) VALUES
(14, 'Revolucionou o cinema de ficção científica! Os efeitos especiais eram completamente inovadores em 1999. A cena da bullet time se tornou icônica. Keanu Reeves está perfeito como Neo.', 5),
(14, 'Um dos filmes mais influentes de todos os tempos! A filosofia por trás da história sobre realidade simulada continua relevante. As cenas de ação são espetaculares.', 5),
(14, 'Obra-prima absoluta! A trama questiona a natureza da realidade de forma brilhante. A estética cyberpunk é perfeita, e a trilha sonora é fantástica.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(15, 'Christopher Nolan é um gênio! A trama de múltiplas camadas de sonhos é complexa mas brilhante. Leonardo DiCaprio entrega uma performance emocionante. O final ambíguo gera discussões até hoje.', 5),
(15, 'Visualmente deslumbrante e intelectualmente desafiador! A cena da cidade dobrando sobre si mesma é de tirar o fôlego. Hans Zimmer cria uma das melhores trilhas sonoras do cinema.', 5),
(15, 'Filme complexo que exige atenção total! Cada camada do sonho tem suas próprias regras e perigos. O elenco está perfeito, especialmente Tom Hardy. Requer múltiplas visualizações.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(16, 'Emocionalmente devastador e cientificamente fascinante! Matthew McConaughey está excelente. A representação visual dos buracos negros e da dilatação temporal é impressionante. A cena da "montanha de tempo" é de partir o coração.', 5),
(16, 'Nolan cria uma épica jornada espacial com coração! A relação pai-filha é o núcleo emocional do filme. Hans Zimmer entrega outra trilha sonora magistral, especialmente "Cornfield Chase" e "Mountains".', 5),
(16, 'Espetacular em todos os sentidos! A física do filme é surpreendentemente precisa. As cenas espaciais são de tirar o fôlego. O ato final no tesserato é complexo mas emocionante.', 5),
(16, 'Uma obra-prima da ficção científica moderna! Combina ciência real com emoção humana. A ideia de que o amor transcende dimensões é linda. Assista em IMAX se possível!', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(17, 'Tom Hanks entrega sua melhor performance! Forrest é um personagem inesquecível que nos ensina sobre bondade, amor e perseverança. O filme percorre décadas da história americana de forma brilhante.', 5),
(17, 'Emocionante do início ao fim! A história de Forrest e Jenny é tocante. O filme tem momentos engraçados, tristes e inspiradores. "A vida é como uma caixa de chocolates" se tornou uma frase icônica.', 5),
(17, 'Uma obra-prima atemporal! Tom Hanks cria um personagem puro e sincero que impacta todos ao seu redor. A trilha sonora é perfeita, capturando cada época retratada.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(18, 'Simplesmente o melhor filme de todos os tempos! Marlon Brando está magistral como Don Vito Corleone. A direção de Coppola é impecável. Cada cena é uma obra de arte. A trilha sonora é inesquecível.', 5),
(18, 'Uma obra-prima atemporal! A transformação de Michael Corleone de herói de guerra a chefe da máfia é fascinante. Al Pacino está perfeito. A fotografia de Gordon Willis é belíssima.', 5),
(18, 'O filme definitivo sobre máfia! O roteiro é perfeito, as atuações são soberbas em todos os níveis. As cenas icônicas são inúmeras. Um estudo sobre família, poder e lealdade.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(19, 'Spielberg cria sua obra-prima! Liam Neeson está magistral como Oskar Schindler. O filme é devastador mas necessário. A fotografia em preto e branco intensifica o horror do Holocausto. A cena da menina de vermelho é inesquecível.', 5),
(19, 'Um dos filmes mais importantes já feitos! Retrata o Holocausto com respeito e realismo. Ralph Fiennes está assustadoramente bom como o vilão Amon Goeth. Prepare-se para chorar.', 5),
(19, 'Emocionalmente arrasador e historicamente importante! O filme mostra o pior e o melhor da humanidade. A transformação de Schindler é bem construída. Um filme que todos deveriam assistir.', 5);

INSERT INTO analises (filme_id, texto, nota) VALUES
(20, 'Bong Joon-ho cria uma obra-prima sobre desigualdade social! O filme é imprevisível - começa como comédia, torna-se thriller e termina em tragédia. A direção é perfeita. Mereceu todos os Oscars que ganhou.', 5),
(20, 'Um filme que define uma era! A crítica à divisão de classes é afiada e universal. A cinematografia é deslumbrante - cada quadro é pensado meticulosamente. O simbolismo da casa é brilhante.', 5),
(20, 'Revolucionário! Mistura gêneros de forma magistral. O elenco está perfeito. O filme te mantém na dúvida sobre quem é realmente o "parasita". A reviravolta no meio do filme é chocante.', 5),
(20, 'Obra-prima do cinema contemporâneo! Bong Joon-ho usa o thriller como veículo para comentário social devastador. O filme funciona em múltiplos níveis. Impossível parar de pensar nele após assistir.', 5);

SELECT * FROM filmes ORDER BY ano DESC;

SELECT genero, COUNT(*) as total FROM filmes GROUP BY genero ORDER BY total DESC;


SELECT f.titulo, a.nota, a.texto 
FROM filmes f 
INNER JOIN analises a ON f.id = a.filme_id
ORDER BY f.titulo, a.nota ASC;

SELECT f.titulo, f.genero, ROUND(AVG(a.nota), 2) as media_notas, COUNT(a.id) as total_analises
FROM filmes f
LEFT JOIN analises a ON f.id = a.filme_id
GROUP BY f.id, f.titulo, f.genero
ORDER BY media_notas DESC, total_analises DESC;

SELECT f.titulo, ROUND(AVG(a.nota), 2) as media
FROM filmes f
INNER JOIN analises a ON f.id = a.filme_id
GROUP BY f.id, f.titulo
ORDER BY media DESC
LIMIT 5; 