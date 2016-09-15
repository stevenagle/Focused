package tests;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Feature;
import entities.FocusDetail;
import entities.Reviewer;

public class FocusDetailTest {

	private EntityManagerFactory emf;
    private EntityManager em;

    @Before
    public void setUp() throws Exception {
        emf = Persistence.
            createEntityManagerFactory("FocusedJPA");
        em = emf.createEntityManager();
    }

    @Test
    public void test() throws ParseException {
        
    	// TODO add info to focus_details table and test
    	// Tests won't work until table is populated
    	FocusDetail fd = em.find(FocusDetail.class, 1); 
        assertEquals("Awesome", fd.getDetails()); 
        
    
    }

    @After
    public void tearDown() throws Exception {
        em.close();
        emf.close();
    }
}
