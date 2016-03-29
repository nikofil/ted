package gr.uoa.di.services;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import gr.uoa.di.models.User;
import gr.uoa.di.requests.LoginRequest;
import gr.uoa.di.requests.RegisterRequest;

@Controller
@RequestMapping(path = "/auth", method=RequestMethod.POST, produces="application/json", consumes="application/json")
public class Auth {
	@Autowired
	EntityManager em;

	@RequestMapping(path = "/register")
	@ResponseBody
	@Transactional
	public Map<String, String> register(@Valid @RequestBody RegisterRequest request) {
		if (!em.createQuery("select u from User u where u.username = ?", User.class).
				setParameter(1, request.getUsername()).getResultList().isEmpty())
			return Collections.singletonMap("error", "Username exists");
		
		User newUser = new User();
		newUser.setUsername(request.getUsername());
		newUser.setPassword(DigestUtils.sha1Hex(request.getPassword()));
		newUser.setName(request.getName());
		newUser.setSurname(request.getSurname());
		newUser.setEmail(request.getEmail());
		newUser.setPhone(request.getPhone());
		newUser.setAfm(request.getAfm());
		newUser.setLocation(request.getLocation());
		newUser.setLat(request.getLat());
		newUser.setLon(request.getLon());
		newUser.setCountry(request.getCountry());
		em.persist(newUser);
		
		return Collections.emptyMap();
	}
	
	@RequestMapping(path = "/login")
	@ResponseBody
	@Transactional
	public Object login(@Valid @RequestBody LoginRequest request) {
		List<User> userList = em.createQuery("select u from User u where u.username = ? and u.password = ?", User.class).
				setParameter(1, request.getUsername()).
				setParameter(2, DigestUtils.sha1Hex(request.getPassword())).
				getResultList();
		
		if (userList.isEmpty())
			return Collections.singletonMap("error", "Wrong credentials");
		
		return userList.get(0);
	}
}
