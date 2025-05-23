/**
 * @author
 * Cristian Ruiz Martín: 70%
 * Álvaro Acedo Espejo: 30%
 */

package es.uma.taw24.dao;

import es.uma.taw24.entity.RutinaSesionEntity;
import es.uma.taw24.entity.RutinaSesionIdEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RutinaSesionRepository extends JpaRepository<RutinaSesionEntity, Integer> {

    @Query("SELECT rs FROM RutinaSesionEntity rs WHERE rs.idrutina.id = :rutinaId ORDER BY rs.diadesemana")
    public List<RutinaSesionEntity> findByRutinaId(@Param("rutinaId") Integer rutinaId);

    @Query("SELECT COUNT(rs) FROM RutinaSesionEntity rs WHERE rs.idrutina.id = :rutinaId AND rs.diadesemana = :diaSemana")
    public Integer countByRutinaIdAndDiaSemana(@Param("rutinaId") Integer rutinaId, @Param("diaSemana") Short diaSemana);

    @Query("SELECT COUNT(rs) FROM RutinaSesionEntity rs WHERE rs.idrutina.id = :rutinaId")
    public Integer countByRutinaId(@Param("rutinaId") Integer rutinaId);

    @Query("SELECT rs FROM RutinaSesionEntity  rs where rs.id = :id")
    public RutinaSesionEntity findByRutinaSesionId(RutinaSesionIdEntity id);

    @Query("SELECT rs FROM RutinaSesionEntity rs WHERE rs.idrutina.id = :rutinaId AND rs.idsesion.id = :sesionId")
    public RutinaSesionEntity findByRutinaIdAndSesionId(@Param("rutinaId") Integer rutinaId, @Param("sesionId") Integer sesionId);

    @Query("SELECT rs FROM RutinaSesionEntity rs WHERE rs.idsesion.id = :id")
    public List<RutinaSesionEntity> findBySesionId(Integer id);

}
