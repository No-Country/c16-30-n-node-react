DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`(
IN username VARCHAR(50),
IN province VARCHAR(50),
IN passInsert VARCHAR(50)
)
BEGIN



INSERT INTO usuarios (usuario, id_provincias, pass) VALUES (
															username,
                                                            (
																SELECT pr.id_provincias FROM provincias pr
                                                                WHERE pr.provincia = province
                                                            ),
                                                            passInsert);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteFav`(
IN username VARCHAR(50),
IN especieIdOut INT
)
BEGIN

DELETE FROM usuarios_favoritos_especies ufe WHERE ufe.especie_id = especieIdOut and ufe.usuario_id = (SELECT u.id_usuario from usuarios u where u.usuario = username);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUser`(
IN userName VARCHAR(50)
)
BEGIN


DELETE FROM usuarios WHERE usuario = userName;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getById`(
IN id INT
)
BEGIN
SELECT 
    es.nombre,
    es.nombre_cientifico,
    fm.familia,
	tpp.tipo_planta,
    cp.clasificacion_planta,
    cl.color,
    rl.requerimiento_luz,
    ra.requerimiento_agua,
    rc.ritmo_crecimiento,
    es.tiempo_fructificacion,
    tmp.temporada AS temporada_siembra,
    d.duracion,
    (
		SELECT JSON_ARRAYAGG(pl.nombre_plaga)
			FROM(
				SELECT DISTINCT pl.nombre_plaga
                FROM plagas pl
                INNER JOIN especies_has_plagas ehp ON pl.id_plaga = ehp.plaga_id
                WHERE es.id_especie = ehp.especie_id
                )pl
	) AS plagas,
    (
        SELECT JSON_ARRAYAGG(pr.provincia)
            FROM (
                SELECT DISTINCT pr.provincia
                FROM provincias pr
                INNER JOIN provincias_has_region phr ON pr.id_provincias = phr.provincia_id
                INNER JOIN region rg ON phr.region_id = rg.id_region
                INNER JOIN region_has_climas rhc ON rg.id_region = rhc.region_id
                INNER JOIN especies_has_climas ehc ON rhc.clima_id = ehc.clima_id
                WHERE ehc.especie_id = es.id_especie
            ) pr
    ) AS provincias,
    t.temperatura,
    (
        SELECT JSON_ARRAYAGG(cl.clima)
        FROM climas cl
        INNER JOIN especies_has_climas ehc ON cl.id_clima = ehc.clima_id
        WHERE ehc.especie_id = es.id_especie
    ) AS climas,
    es.toxica_para_mascotas,
    (    
		SELECT JSON_ARRAYAGG(msc.mascota)
			FROM (
            SELECT msc.mascota
            FROM mascotas msc
            INNER JOIN especies_toxicas_para_mascotas etm ON etm.mascota_id = msc.id_mascota
            WHERE es.id_especie = etm.especie_id
		)msc
    ) AS mascotas_susceptibles
FROM 
    especies es
    INNER JOIN tipos_planta tpp  ON es.tipo_planta_id = tpp.id_tipo_planta
    INNER JOIN clasificacion_planta cp ON es.clasificacion_planta_id = cp.id_clasificacion_planta
    INNER JOIN familia fm ON es.familia_id = fm.id_familia
    INNER JOIN requerimientos_luz rl ON es.requerimiento_luz_id = rl.id_requerimiento_luz
    INNER JOIN requerimientos_agua ra ON ra.id_requerimientos_agua = es.requerimientos_agua_id
    INNER JOIN temperaturas t ON es.temperatura_id = t.id_temperatura
    INNER JOIN colores cl ON es.color_id = cl.id_color
    INNER JOIN duraciones d ON es.duracion_id = d.id_duraciones
    INNER JOIN temporadas tmp ON es.temporada_id = tmp.id_temporada
    INNER JOIN ritmos_crecimiento rc ON es.ritmo_crecimiento_id = rc.id_ritmo_crecimiento
    where
    es.id_especie = id
order by es.nombre
;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCards`()
BEGIN
SELECT 
    es.nombre,
    (
        SELECT JSON_ARRAYAGG(pr.provincia)
        FROM provincias pr
        INNER JOIN provincias_has_region phr ON pr.id_provincias = phr.provincia_id
        INNER JOIN region rg ON phr.region_id = rg.id_region
        INNER JOIN region_has_climas rhc ON rg.id_region = rhc.region_id
        INNER JOIN especies_has_climas ehc ON rhc.clima_id = ehc.clima_id
        WHERE ehc.especie_id = es.id_especie
    ) AS provincias,
    (
        SELECT JSON_ARRAYAGG(cl.clima)
        FROM climas cl
        INNER JOIN especies_has_climas ehc ON cl.id_clima = ehc.clima_id
        WHERE ehc.especie_id = es.id_especie
    ) AS climas,
	tpp.tipo_planta,
    es.toxica_para_mascotas
FROM 
    especies es
    INNER JOIN tipos_planta tpp  ON es.tipo_planta_id = tpp.id_tipo_planta
;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFavs`(
IN usuario VARCHAR(50)
)
BEGIN
SELECT es.id_especie, es.nombre from usuarios u 
INNER JOIN especies es
INNER JOIN usuarios_favoritos_especies ufe
where u.usuario = usuario and es.id_especie = ufe.especie_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(
IN username VARCHAR(50),
IN passInsert VARCHAR(50)
)
BEGIN
SELECT * FROM usuarios where usuario = username and pass = passInsert;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `setFavs`(
IN usuario VARCHAR(50),
IN plantaId INT
)
BEGIN

INSERT INTO usuarios_favoritos_especies VALUES (
												(select u.id_usuario from usuarios u where u.usuario = usuario),
												plantaId
												);
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `setUser`(
IN username VARCHAR(50),
IN passInsert VARCHAR(50)
)
BEGIN

INSERT INTO usuarios (usuario, pass) VALUES (username, passInsert);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser`(
IN userId INT,
IN userName VARCHAR(50),
IN province VARCHAR(50),
IN passInsert VARCHAR (50)
)
BEGIN

IF userName IS NOT NULL THEN
UPDATE usuarios SET usuario = userName WHERE id_usuario = userId;
END IF;

IF province IS NOT NULL THEN
UPDATE usuarios SET id_provincias = (SELECT pr.id_provincias FROM provincias pr WHERE pr.provincia = province) WHERE id_usuario = userId;
END IF;

IF passInsert IS NOT NULL THEN
UPDATE usuarios SET pass = passInsert WHERE id_usuario = userId;
END IF;


END$$
DELIMITER ;
