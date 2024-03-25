-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.cities
(
    id smallint NOT NULL,
    name character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.company_staff_verifications
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    is_approved boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    approval_date time with time zone,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.company_staffs
(
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public.email_activations
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    activation_code character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    is_activated boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    expiration_date timestamp with time zone NOT NULL,
    activation_date timestamp with time zone,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.employer_updates
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    company_staff_id integer,
    company_name character varying(100) NOT NULL,
    website character varying(100) NOT NULL,
    corporate_email character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_approved boolean NOT NULL,
    is_deleted boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.employers
(
    user_id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    website character varying(100) NOT NULL,
    corporate_email character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public.job_adverts
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employer_id integer NOT NULL,
    job_position_id integer NOT NULL,
    city_id integer NOT NULL,
    description character varying NOT NULL,
    min_salary integer,
    max_salary integer,
    number_of_open_positions integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    application_deadline timestamp with time zone,
    is_active boolean NOT NULL,
    is_deleted boolean NOT NULL,
    working_type_id smallint,
    working_time_id smallint,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.job_positions
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    is_deleted boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.job_seeker_cv_educations
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    job_seeker_cv_id integer NOT NULL,
    school_name character varying(100) NOT NULL,
    department_name character varying(100) NOT NULL,
    start_date date NOT NULL,
    graduation_date date,
    created_at timestamp with time zone NOT NULL,
    PRIMARY KEY (id)
);

-- CREATE TABLE IF NOT EXISTS public.job_seeker_cv_experiences
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     job_seeker_cv_id integer NOT NULL,
--     job_position_id integer NOT NULL,
--     workplace_name character varying(100) NOT NULL,
--     start_date date NOT NULL,
--     quit_date date,
--     created_at timestamp with time zone NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.job_seeker_cv_images
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     job_seeker_cv_id integer NOT NULL,
--     url character varying NOT NULL,
--     created_at timestamp with time zone NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.job_seeker_cv_languages
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     job_seeker_cv_id integer NOT NULL,
--     language_id character(2) NOT NULL,
--     level smallint NOT NULL,
--     created_at timestamp with time zone NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.job_seeker_cv_skills
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     job_seeker_cv_id integer NOT NULL,
--     name character varying(100) NOT NULL,
--     created_at timestamp with time zone NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.job_seeker_cv_web_sites
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     job_seeker_cv_id integer NOT NULL,
--     web_site_id smallint NOT NULL,
--     address character varying(200) NOT NULL,
--     created_at timestamp with time zone NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.job_seeker_cvs
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     job_seeker_id integer NOT NULL,
--     cover_letter character varying(300) NOT NULL,
--     created_at timestamp with time zone NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.job_seekers
-- (
--     user_id integer NOT NULL,
--     first_name character varying(50) NOT NULL,
--     last_name character varying(50) NOT NULL,
--     identity_number character(11) NOT NULL,
--     birth_date date NOT NULL,
--     cv_id integer,
--     PRIMARY KEY (user_id)
-- );

-- CREATE TABLE IF NOT EXISTS public.job_seekers_favorite_job_adverts
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     job_seeker_id integer NOT NULL,
--     job_advert_id integer NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS public.languages
-- (
--     id character(2) NOT NULL,
--     name character varying(50) NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.mernis_activations
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     user_id integer NOT NULL,
--     is_approved boolean NOT NULL,
--     created_at timestamp with time zone NOT NULL,
--     approval_date time with time zone,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.users
-- (
--     id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     email character varying(100) NOT NULL,
--     password character varying(100) NOT NULL,
--     created_at timestamp with time zone NOT NULL,
--     is_active boolean NOT NULL,
--     is_deleted boolean NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.web_sites
-- (
--     id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
--     name character varying(50) NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.working_times
-- (
--     id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
--     name character varying(50) NOT NULL,
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS public.working_types
-- (
--     id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
--     id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
--     name character varying(50) NOT NULL,
--     PRIMARY KEY (id)
-- );

ALTER TABLE public.company_staff_verifications
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.company_staffs
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.email_activations
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employer_updates
    ADD FOREIGN KEY (user_id)
    REFERENCES public.employers (user_id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (city_id)
    REFERENCES public.cities (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (user_id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (working_time_id)
    REFERENCES public.working_times (id)
    NOT VALID;


ALTER TABLE public.job_adverts
    ADD FOREIGN KEY (working_type_id)
    REFERENCES public.working_types (id)
    NOT VALID;


ALTER TABLE public.job_seeker_cv_educations
    ADD FOREIGN KEY (job_seeker_cv_id)
    REFERENCES public.job_seeker_cvs (id)
    NOT VALID;


ALTER TABLE public.job_seeker_cv_experiences
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.job_seeker_cv_experiences
    ADD FOREIGN KEY (job_seeker_cv_id)
    REFERENCES public.job_seeker_cvs (id)
    NOT VALID;


ALTER TABLE public.job_seeker_cv_images
    ADD FOREIGN KEY (job_seeker_cv_id)
    REFERENCES public.job_seeker_cvs (id)
    NOT VALID;


ALTER TABLE public.job_seeker_cv_languages
    ADD FOREIGN KEY (job_seeker_cv_id)
    REFERENCES public.job_seeker_cvs (id)
    NOT VALID;


ALTER TABLE public.job_seeker_cv_languages
    ADD FOREIGN KEY (language_id)
    REFERENCES public.languages (id)
    NOT VALID;


ALTER TABLE public.job_seeker_cv_skills
    ADD FOREIGN KEY (job_seeker_cv_id)
    REFERENCES public.job_seeker_cvs (id)
    NOT VALID;


-- ALTER TABLE public.job_seeker_cv_web_sites
--     ADD FOREIGN KEY (job_seeker_cv_id)
--     REFERENCES public.job_seeker_cvs (id)
--     NOT VALID;


ALTER TABLE public.job_seeker_cv_web_sites
    ADD FOREIGN KEY (web_site_id)
    REFERENCES public.web_sites (id)
    NOT VALID;


ALTER TABLE public.job_seeker_cvs
    ADD FOREIGN KEY (job_seeker_id)
    REFERENCES public.job_seekers (user_id)
    NOT VALID;


ALTER TABLE public.job_seekers
    ADD FOREIGN KEY (cv_id)
    REFERENCES public.job_seeker_cvs (id)
    NOT VALID;


ALTER TABLE public.job_seekers
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.job_seekers_favorite_job_adverts
    ADD FOREIGN KEY (job_advert_id)
    REFERENCES public.job_adverts (id)
    NOT VALID;


ALTER TABLE public.job_seekers_favorite_job_adverts
    ADD FOREIGN KEY (job_seeker_id)
    REFERENCES public.job_seekers (user_id)
    NOT VALID;


ALTER TABLE public.mernis_activations
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;

END;
