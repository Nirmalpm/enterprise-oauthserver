package com.enterprise.oauthserver.dao;

import com.enterprise.oauthserver.model.UserEntity;

public interface OAuthDAOService {
	UserEntity getUserDetails(String emailId);
	UserEntity registerUser(UserEntity user);
	UserEntity registerCompletion(UserEntity user);
	UserEntity getUser(int id); 
}
