package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class FocusedDaoImpl implements FocusedDbDao {
	
	@PersistenceContext
	private EntityManager em;
	
	//TODO Overriden methods from interface
}
