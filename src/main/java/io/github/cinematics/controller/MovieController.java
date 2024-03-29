package io.github.cinematics.controller;

import io.github.cinematics.dao.ActorRepository;
import io.github.cinematics.dao.DirectorRepository;
import io.github.cinematics.dao.MovieRepository;
import io.github.cinematics.model.Actor;
import io.github.cinematics.model.Director;
import io.github.cinematics.model.Movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigInteger;
import java.util.List;

@Controller
public class MovieController {
	@Autowired
	private MovieRepository movieRepository;
	
	@Autowired
	private ActorRepository actorRepository;
	
	@Autowired
	private DirectorRepository directorRepository;
	
	@GetMapping("/")
	public String viewHomePage(Model model) {
		return "index";
	}
	
	@GetMapping("/find")
	public String showFindPage(Model model) {
		model.addAttribute("movie",new Movie());
		return "basicsearch";
	}
	
	
	@PostMapping("/find")
	public String basicResults(@ModelAttribute("movie") Movie movie,Model model) {
		List<Object[]>[] moviesList =movieRepository.findByMovieTitle(movie.getTitle());
		Object[] movies=new Object[moviesList.length];
		Object[] genres=new Object[moviesList.length];
		for(int i=0;i<moviesList.length;i++) {
			movies[i]=moviesList[i].get(0);
			genres[i]=moviesList[i].get(1);
		}
		
		model.addAttribute("movies", movies);
		model.addAttribute("genres", genres);
		return "basicsearch";
	}

	@GetMapping("/movie/{id}")
	public String movieDetails(@PathVariable("id") int id,Model model){
		List<Object[]> dls=movieRepository.findByMovieId(id);
		for(Object[] obj :dls) {
			model.addAttribute("quote",obj[0]);
			model.addAttribute("movie",obj[1]);
			model.addAttribute("company",obj[2]);
			model.addAttribute("actor",obj[3]);
			model.addAttribute("director",obj[4]);
			model.addAttribute("genre",obj[5]);
		}
		List<Object[]> dfs=movieRepository.findForProcedure(id);
		BigInteger a=BigInteger.ONE;
		BigInteger b=BigInteger.ONE;
		for(Object[] abj:dfs) {
			a=(BigInteger) abj[0];
			b=(BigInteger) abj[1];
		}
		List<Object[]>[] obj=movieRepository.checkProfitOrLoss(a.longValueExact(), b.longValueExact(),100L, "hello there");
		for(List<Object[]> dbj:obj){
			model.addAttribute("difference", dbj.get(0));
			model.addAttribute("strmessage", dbj.get(1));
		}

		return "movie";
	}
	
	@GetMapping("/findall")
	public String listAllMovies(Model model) {
		model.addAttribute("movie", new Movie());
		List<Object[]>[] moviesList =movieRepository.findByAllMovies();
		Object[] movies=new Object[moviesList.length];
		Object[] genres=new Object[moviesList.length];
		for(int i=0;i<moviesList.length;i++) {
			movies[i]=moviesList[i].get(0);
			genres[i]=moviesList[i].get(1);
		}
		
		model.addAttribute("movies", movies);
		model.addAttribute("genres", genres);
		return "basicsearch";
	}
	
	@GetMapping("/findactor")
	public String actorSearch(Model model) {
		model.addAttribute("actor", new Actor());
		return "actordetails";
	}
	
	@PostMapping("/findactor")
	public String actorDetails(@ModelAttribute("actor") Actor actor,Model model) {
		List<Object[]> act=actorRepository.findByActorName(actor.getName());
		for(Object[] o :act) {
			model.addAttribute("actordetails",o[0]);
			model.addAttribute("awards",o[1]);
		}
		return "actordetails";
	}
	
	@GetMapping("/finddirector")
	public String directorSearch(Model model) {
		model.addAttribute("director", new Director());
		return "directordetails";
	}
	
	@PostMapping("/finddirector")
	public String directorDetails(@ModelAttribute("director") Director director,Model model) {
		List<Object[]> dct=directorRepository.findByDirectorName(director.getName());
		for(Object[] o :dct) {
			model.addAttribute("directors",o[0]);
		}
		return "directordetails";
	}
	
	@GetMapping("/findadv")
	public String showAdvancedPage(Model model) {
		return "advsearch";
	}
	
	@PostMapping("/findadv")
	public String advancedResults(@RequestParam String title, @RequestParam String language, @RequestParam String genre, Model model) {
		List<Object[]>[] m=movieRepository.findByAdvancedSearch(title,language,genre);
		Object[] mves=new Object[m.length];
		Object[] gnres=new Object[m.length];
		for(int i=0;i<m.length;i++) {
			mves[i]=m[i].get(0);
			gnres[i]=m[i].get(1);
		}
		
		model.addAttribute("movies", mves);
		model.addAttribute("genres", gnres);
		return "advsearch";
	}
	
	@GetMapping("/findcustom")
	public String showCustomPage(Model model) {
		return "customsearch";
	}
	
	@PostMapping("/findactname")
	public String customActorResults(@RequestParam String actname, Model model) {
		List<Object[]>[] m=movieRepository.findByCustomActor(actname);
		Object[] mves=new Object[m.length];
		Object[] gnres=new Object[m.length];
		for(int i=0;i<m.length;i++) {
			mves[i]=m[i].get(0);
			gnres[i]=m[i].get(1);
		}
		
		model.addAttribute("movies", mves);
		model.addAttribute("genres", gnres);
		return "customsearch";
	}
	
	@PostMapping("/finddirectname")
	public String customDirectorResults(@RequestParam String directname, Model model) {
		List<Object[]>[] m=movieRepository.findByCustomDirector(directname);
		Object[] mves=new Object[m.length];
		Object[] gnres=new Object[m.length];
		for(int i=0;i<m.length;i++) {
			mves[i]=m[i].get(0);
			gnres[i]=m[i].get(1);
		}
		
		model.addAttribute("movies", mves);
		model.addAttribute("genres", gnres);
		return "customsearch";
	}
	
	@PostMapping("/findmovlang")
	public String customLanguageResults(@RequestParam String movlang, Model model) {
		List<Object[]>[] m=movieRepository.findByCustomLanguage(movlang);
		Object[] mves=new Object[m.length];
		Object[] gnres=new Object[m.length];
		for(int i=0;i<m.length;i++) {
			mves[i]=m[i].get(0);
			gnres[i]=m[i].get(1);
		}
		
		model.addAttribute("movies", mves);
		model.addAttribute("genres", gnres);
		return "customsearch";
	}
}

/*All production code comments
	3) used in viewHomePage():
		List<Movie> listMovies=movieRepository.findAll();
		model.addAttribute("greetings",listMovies); 
		
		Long a=new Long("560000000");
		Long b=new Long("720000000");
		HashMap<String,String> obj=movieRepository.checkProfitOrLoss(a, b);
		System.out.println(obj.size()+" "+obj.keySet()+" "+obj.values());
		Iterable<String> arr=obj.values();
		for(Object abj:arr) {
			System.out.println(abj);
		}
 
	2) 	used in showFindPage():
		@PostMapping("/find")
		public String searchMovie(@ModelAttribute("movie") Movie movie,Model model) {
		List<Object[]> m=movieRepository.findByMovie(movie.getTitle());
		for(Object o[]:m) {
		model.addAttribute("greetings",o[0]);
		model.addAttribute("wishes",o[1]);
		}
		return "result";
	}

 
	3) used in basicResults():
		List<Object[]> m=movieRepository.findByMovieTitle(movie.getTitle());
		for(Object o[]:m) {
			model.addAttribute("movies",o[0]);
			model.addAttribute("genres",o[1]);
		}
 

 	*/