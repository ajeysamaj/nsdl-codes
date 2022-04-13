drop table if exists api_audit;
drop table if exists api_audit_error;

create table api_audit(
	id varchar(50) not null,
	remote_host varchar(50) not null,
	message_id varchar(50) not null,
	transaction_id varchar(50) not null,
	buyer_id varchar(150),
	seller_id varchar(150),
	action varchar(50) not null,
	domain varchar(50) not null,
	core_version varchar(50) not null,
	created_on timestamp(6) not null,
	json json not null,
	status varchar(1) not null,
	headers text,
	type varchar(10) not null,
	CONSTRAINT pk_api_audit PRIMARY KEY(id)
);

create table api_audit_error(
	id varchar(50) not null,
	schema_class varchar(50) not null,
	error text,
	json json not null,
	created_on timestamp(6) not null,
	CONSTRAINT pk_api_audit_error PRIMARY KEY(id)
);

commit;

-- some changes
--ALTER TABLE api_audit DROP CONSTRAINT pk_api_audit;
--ALTER TABLE api_audit ADD CONSTRAINT pk_api_audit PRIMARY KEY(message_id, transaction_id);

--ALTER TABLE api_audit ADD COLUMN headers text not null;