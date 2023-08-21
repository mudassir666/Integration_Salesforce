public class Spoonacular {
    
    // Const variable
    private static final String SPOONACULAR_API = 'https://api.spoonacular.com';
    private static final String API_KEY = 'e115ec43c7ff401ca69a2d7ef5af1af4';
    
    public static void getRandomReceipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            /*
// Deserialize the JSON string into collections of primitive data types.
Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
// Cast the values in the 'animals' key as a list
List<Object> animals = (List<Object>) results.get('animals');
System.debug('Received the following animals:');
for(Object animal: animals) {
System.debug(animal);
}
*/
            system.debug('response '+response.getBody());
        }
    }
    
    
    public static void getReceipe(string recipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug('response '+response.getBody());
        }
    }
    
    public static void getReceipeByIngredient(String ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug('response '+response.getBody());
        }
    }
    
    
    public static void getReceipeByNutrients(String minCarbs, String maxCarbs){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/findByNutrients?apiKey='+API_KEY+'&minCarbs='+minCarbs+'&maxCarbs='+maxCarbs);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug('response '+response.getBody());
        }
    }
    
    public static void getAutocompleteRecipeSearch(String recipe){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/autocomplete?apiKey='+API_KEY+'&query='+recipe);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug('response '+response.getBody());
        }
    }
    
    public static void extractRecipeFromWebsite(String url){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/extract?apiKey='+API_KEY+'&url='+url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug('response '+response.getBody());
        }
    }
    
    public static void getUserFromGoRestApi(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public-api/users');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug('response '+response.getBody());
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug(results.get('data'));
            
            List<Object> data = (List<Object>) results.get('data');
            System.debug('Received the following animals:');
            for(Object animal: data) {
                System.debug(animal);
            }
            
        }
    }
    
    public static void PostUserFromGoRestApi(String name, String email, String gender, String status){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public-api/users');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer 08297cb748a0662fd966038229552539538c091de802387b1e8cb1800fb01c63');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name": "' + name + '", "email": "' + email + '", "gender": "' + gender + '", "status": "' + status + '"}');
        system.debug(request.getBody());
        //'{"name": "Ammar","email": "Ammar@outlook.com","gender": "female","status": "active"}'
        HttpResponse response = http.send(request);
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug('response '+response.getBody());
        }
    }
}