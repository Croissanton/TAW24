/**
 * @author
 * Cristian Ruiz Martín: 50%
 * Álvaro Acedo Espejo: 50%
 */

package es.uma.taw24.service;

import es.uma.taw24.DTO.RutinaSesion;
import es.uma.taw24.dao.RutinaRepository;
import es.uma.taw24.dao.RutinaSesionRepository;
import es.uma.taw24.dao.SesionRepository;
import es.uma.taw24.entity.RutinaEntity;
import es.uma.taw24.entity.RutinaSesionEntity;
import es.uma.taw24.entity.SesionEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RutinaSesionService extends DTOService<RutinaSesion, RutinaSesionEntity>{

    @Autowired
    private RutinaSesionRepository rutinaSesionRepository;
    @Autowired
    private RutinaRepository rutinaRepository;
    @Autowired
    private SesionRepository sesionRepository;

    public List<RutinaSesion> buscarRutinaSesion(Integer rutinaId) {
        List<RutinaSesionEntity> lista = this.rutinaSesionRepository.findByRutinaId(rutinaId);
        return this.entidadesADTO(lista);
    }

    public int contarRutinaSesionPorDia(Integer rutinaId, Short diaSemana) {
        return this.rutinaSesionRepository.countByRutinaIdAndDiaSemana(rutinaId, diaSemana);
    }

    public void guardar(RutinaSesion rutinaSesion){
        RutinaSesionEntity rutinaSesionEntity = this.rutinaSesionRepository.findByRutinaIdAndSesionId(rutinaSesion.getRutina().getId(), rutinaSesion.getSesion().getId());
        if(rutinaSesionEntity == null){
            rutinaSesionEntity = new RutinaSesionEntity();
        }
        RutinaEntity rutinaEntity = this.rutinaRepository.findById(rutinaSesion.getRutina().getId()).orElse(null);

        SesionEntity sesionEntity;
        if(rutinaSesion.getSesion().getId() == null){
            sesionEntity = new SesionEntity();
            sesionEntity.setCrosstraining(false);
            this.sesionRepository.save(sesionEntity);
        }else {
            sesionEntity = this.sesionRepository.findById(rutinaSesion.getSesion().getId()).orElse(null);
        }

        rutinaSesionEntity.setIdrutina(rutinaEntity);
        rutinaSesionEntity.setIdsesion(sesionEntity);
        rutinaSesionEntity.setDiadesemana(rutinaSesion.getDiadesemana());
        this.rutinaSesionRepository.save(rutinaSesionEntity);
    }

    public RutinaSesion buscarRutinaSesion(Integer idRutina, Integer idSesion) {
        return this.rutinaSesionRepository.findByRutinaIdAndSesionId(idRutina, idSesion).toDTO();
    }
}
