CREATE TABLE user (
  ID int(11) NOT NULL AUTO_INCREMENT,
  USERNAME varchar(10) NOT NULL,
  FIRSTNAME varchar(20) DEFAULT NULL,
  LASTNAME varchar(20) DEFAULT NULL,
  EMAIL_ID varchar(255) DEFAULT NULL,
  PASSWORD varchar(1000) DEFAULT NULL,
  ISACTIVE int(11) DEFAULT NULL,
  CREATED_DATE datetime NOT NULL,
  MODIFIED_DATE datetime DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY EMAIL_ID (EMAIL_ID)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

CREATE TABLE permission (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PERMISSION_NAME varchar(20) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE role (
  ID int(11) NOT NULL AUTO_INCREMENT,
  ROLE_NAME varchar(20) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE assign_user_to_role (
  ID int(11) NOT NULL AUTO_INCREMENT,
  USER_ID int(11) DEFAULT NULL,
  ROLE_ID int(11) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY USER_ID (USER_ID),
  KEY ROLE_ID (ROLE_ID),
  CONSTRAINT assign_user_to_role_ibfk_1 FOREIGN KEY (USER_ID) REFERENCES user (ID),
  CONSTRAINT assign_user_to_role_ibfk_2 FOREIGN KEY (ROLE_ID) REFERENCES role (ID)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE assign_permission_to_role (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PERMISSION_ID int(11) DEFAULT NULL,
  ROLE_ID int(11) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY PERMISSION_ID (PERMISSION_ID),
  KEY ROLE_ID (ROLE_ID),
  CONSTRAINT assign_permission_to_role_ibfk_1 FOREIGN KEY (PERMISSION_ID) REFERENCES permission (ID),
  CONSTRAINT assign_permission_to_role_ibfk_2 FOREIGN KEY (ROLE_ID) REFERENCES role (ID)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;



