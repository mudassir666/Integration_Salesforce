public class Spoonacular1 {
    
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
            system.debug('dataset '+results.get('data'));
            
            List<Object> animals = (List<Object>) results.get('data');
            
            
            List<Map<String,Object>> dataset = new List<Map<String,Object>>();
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
                dataset.add((Map<String,Object>)animal);
            }
            
             system.debug('dataset = '+dataset);
            system.debug('dataset*************** '+dataset[0].get('name'));
            
            for(Map<String,Object> data : dataset){
                system.debug(data.get('name'));
            }
            
           // List<Map<Object,Object>> dataset = (List<Map<Object,Object>>)results.get('data');
            
          //  for(Object sett:results.get('data')){
          //      system.debug('output '+ sett);
           // }
            
           /*
            List<Map<String,Object>> data = (List<Map<String,Object>>) results.get('data');
            System.debug('Received the following animals:');
            for(Map<String,Object> animal: data) {
                System.debug(animal);
            }*/
            
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
    
    
    public static void getUserFromGoRestApiWrapper(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public-api/users');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        system.debug('response code '+response.getStatusCode());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug('response '+response.getBody());
            WrapperUser results = (WrapperUser) JSON.deserialize(response.getBody(), WrapperUser.class);
            system.debug('Result -> '+results);
           system.debug('dataset '+results.data[0]);
            system.debug('dataset '+results.data[0].name);
            
            for(cls_data data : results.data){
                system.debug('Name : '+data.name);
            }
            
            
            
          //  List<Object> animals = (List<Object>) results.get('data');
            
            

            
            
        }
    }
    
    public class WrapperUser{
    @AuraEnabled
    public Integer code;
    @AuraEnabled
    public List<cls_data> data;
        
        
}
    
    class cls_data {
		public Integer id;	//4456242
		public String name;	//3test
		public String email;	//3test@gmail.com
		public String gender;	//male
		public String status;	//active
	}
}