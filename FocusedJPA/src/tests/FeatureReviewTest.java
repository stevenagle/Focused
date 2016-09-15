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
import entities.Product;
import entities.Reviewer;

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
        assertEquals("water bottle", f.getProduct().getName());
        
        Reviewer r = fr.getReviewer();
        assertEquals("M", r.getGender());
        
        
        
    }

    @After
    public void tearDown() throws Exception {
        em.close();
        emf.close();
    }
		
	}


