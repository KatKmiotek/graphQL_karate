package teas;

import com.intuit.karate.junit5.Karate;

class TeasRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("teas").relativeTo(getClass());
    }    

}
