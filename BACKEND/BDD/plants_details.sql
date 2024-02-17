-- get especies toxicas para mascotas
select especies.nombre, mascotas.mascota from especies_toxicas_para_mascotas
inner join especies
on id_especie = especie_id
inner join mascotas
on id_mascota = mascota_id
order by especies.nombre ASC;

-- get plagas que afectan plantas
select e.nombre, p.nombre_plaga, tp.tipo_plaga from especies_has_plagas ehp
inner join especies e
on ehp.especie_id = e.id_especie
inner join plagas p
on ehp.plaga_id = id_plaga
inner join tipos_plagas tp
on p.tipos_plagas_id_tipos_plagas = tp.id_tipos_plagas
order by e.nombre asc;

SELECT JSON_ARRAYAGG( provincia) AS provincia FROM provincias;

-- get climas from usuario
select u.usuario, pv.provincia, rg.region, c.clima from usuarios u
inner join provincias_has_region pr
on pr.provincia_id = u.id_provincias
inner join region_has_climas rc
on pr.region_id = rc.region_id
inner join provincias pv
on pr.provincia_id = pv.id_provincias
inner join region rg
on rc.region_id = rg.id_region
inner join climas c
on c.id_clima = rc.clima_id
;

select * from provincias;

-- store procedures
select * from especies;
select * from especies_has_climas;
-- getCardsInfo

SELECT  
	es.id_especie,
    es.nombre,
	fm.familia,
    tp.tipo_planta,
    c.clima,
    clp.clasificacion_planta,
    ra.requerimiento_agua,
    rl.requerimiento_luz,
    col.color,
    es.toxica_para_mascotas,
    r.region,
    ritc.ritmo_crecimiento,
    t.temporada,
    tc.temperatura,
    su.suelo
from especies es
inner join familia fm
on fm.id_familia = es.familia_id
inner join tipos_planta tp
on tp.id_tipo_planta = es.tipo_planta_id
inner join especies_has_climas cl
on es.id_especie = cl.especie_id
inner join climas c
on c.id_clima = clima_id
inner join clasificacion_planta clp
on clp.id_clasificacion_planta = es.clasificacion_planta_id
inner join requerimientos_agua ra
on ra.id_requerimientos_agua = es.requerimientos_agua_id
inner join requerimientos_luz rl
on rl.id_requerimiento_luz = es.requerimiento_luz_id
inner join colores col
on col.id_color = es.color_id
inner join region_has_climas rhc
on c.id_clima = rhc.clima_id
inner join region r
on r.id_region = rhc.region_id
inner join ritmos_crecimiento ritc
on ritc.id_ritmo_crecimiento = es.ritmo_crecimiento_id
inner join temporadas t
on t.id_temporada = es.temporada_id
inner join temperaturas tc
on tc.id_temperatura = es.temperatura_id
inner join especies_has_suelos ehs
on ehs.especie_id = es.id_especie
inner join suelos su
on su.id_suelo = ehs.suelo_id
;

select * from region r
inner join region_has_climas rhc
on r.id_region = rhc.region_id
inner join especies_has_climas ehc
on ehc.clima_id = rhc.clima_id
;
select * from climas;

SELECT 
    es.nombre,
    (
        SELECT JSON_ARRAYAGG(pr.provincia)
            FROM (
                SELECT DISTINCT pr.provincia
                FROM provincias pr
                INNER JOIN provincias_has_region phr ON pr.id_provincias = phr.provincia_id
                INNER JOIN region rg ON phr.region_id = rg.id_region
                INNER JOIN region_has_climas rhc ON rg.id_region = rhc.region_id
                INNER JOIN especies_has_climas ehc ON rhc.clima_id = ehc.clima_id
                WHERE ehc.especie_id = es.id_especie and 1
            ) pr
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
    WHERE es.toxica_para_mascotas = 1
	order by es.nombre
;

call getFilterByToxicity (0);

CALL getCards();

SELECT 
    es.nombre,
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
    (
        SELECT JSON_ARRAYAGG(cl.clima)
        FROM climas cl
        INNER JOIN especies_has_climas ehc ON cl.id_clima = ehc.clima_id
        WHERE ehc.especie_id = es.id_especie and cl.clima = "Cálido Húmedo"
    ) AS climas,
	tpp.tipo_planta,
    es.toxica_para_mascotas
FROM 
    especies es
    INNER JOIN tipos_planta tpp  ON es.tipo_planta_id = tpp.id_tipo_planta
    where
        (
        SELECT JSON_ARRAYAGG(cl.clima)
        FROM climas cl
        INNER JOIN especies_has_climas ehc ON cl.id_clima = ehc.clima_id
        WHERE ehc.especie_id = es.id_especie and cl.clima = "Cálido Húmedo"
    ) IS NOT NULL
    and
    (
        SELECT JSON_ARRAYAGG(pr.provincia)
        FROM provincias pr
        INNER JOIN provincias_has_region phr ON pr.id_provincias = phr.provincia_id
        INNER JOIN region rg ON phr.region_id = rg.id_region
        INNER JOIN region_has_climas rhc ON rg.id_region = rhc.region_id
        INNER JOIN especies_has_climas ehc ON rhc.clima_id = ehc.clima_id
        WHERE ehc.especie_id = es.id_especie and pr.provincia = "Tucumán"
    ) IS NOT NULL
order by es.nombre
;

select  * from tipos_planta;


-- filtros

-- getFiltro (provincia), (tipo de clima), (tipo de planta)
-- filtrarPorVariable
-- getByID
-- getAllCards
-- getFavoritos
-- setFavoritos
-- updateUser
-- deleteUser + trigger deleteAllFavoritos
-- createUser
-- login?? como lo hacemo e

-- group_concat(",",Connection_type) as connecttion_type
-- SELECT JSON_ARRAYAGG( provincia) AS provincia FROM provincias;
