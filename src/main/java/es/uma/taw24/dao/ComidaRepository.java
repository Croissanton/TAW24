package es.uma.taw24.dao;

import es.uma.taw24.entity.ComidaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface ComidaRepository extends JpaRepository<ComidaEntity, Integer> {

    @Query("SELECT c FROM ComidaEntity c " +
            "JOIN c.comidaMenus cm " +
            "JOIN cm.menu m " +
            "JOIN m.menuDias md " +
            "JOIN md.dia d " +
            "JOIN d.diaDietas dd " +
            "JOIN dd.dieta dt " +
            "JOIN dt.dietaUsuarios du " +
            "JOIN du.usuario u " +
            "WHERE u.id = :clienteId")
    List<ComidaEntity> findComidasByClienteId(@Param("clienteId") Long clienteId);

}
