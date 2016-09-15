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
import entities.FeatureReview;

public class FeatureReviewTest {

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
        FeatureReview fr = em.find(FeatureReview.class, 1); 
        assertEquals("Awesome", fr.getComment()); 
        
        Feature f = fr.getFeature();
        assertEquals("plastic container", f.getDetails());
        assertEquals("test", f.getProduct());
        
        
    }

    @After
    public void tearDown() throws Exception {
        em.close();
        emf.close();
    }
		
	}


