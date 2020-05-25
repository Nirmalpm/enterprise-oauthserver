package com.enterprise.oauthserver.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.enterprise.oauthserver.dao.OAuthDAOService;
import com.enterprise.oauthserver.model.CustomUser;
import com.enterprise.oauthserver.model.UserEntity;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private OAuthDAOService oAuthDAOService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = null;
		try {
			userEntity = oAuthDAOService.getUserDetails(username);
			if(userEntity != null && userEntity.getId() != 0 ) {
				CustomUser customUser = new CustomUser(userEntity);
				return customUser;
			}else {
				throw new UsernameNotFoundException("Username "+username+" was not found in the database");
			}
		}catch(Exception ex) {
			throw new UsernameNotFoundException("Username "+username+" was not found in the database");
		}
	}

}
