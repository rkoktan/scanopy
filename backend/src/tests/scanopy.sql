--
-- PostgreSQL database dump
--

\restrict KbQWSDCLtZpy0fx173CtOKMY7yfqvJ1Kat77YXnv6xGjx8C665OwwuNVMYQdIOL

-- Dumped from database version 17.7
-- Dumped by pg_dump version 17.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_network_access DROP CONSTRAINT IF EXISTS user_network_access_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_network_access DROP CONSTRAINT IF EXISTS user_network_access_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_api_keys DROP CONSTRAINT IF EXISTS user_api_keys_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_api_keys DROP CONSTRAINT IF EXISTS user_api_keys_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_api_key_network_access DROP CONSTRAINT IF EXISTS user_api_key_network_access_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_api_key_network_access DROP CONSTRAINT IF EXISTS user_api_key_network_access_api_key_id_fkey;
ALTER TABLE IF EXISTS ONLY public.topologies DROP CONSTRAINT IF EXISTS topologies_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.tags DROP CONSTRAINT IF EXISTS tags_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.subnets DROP CONSTRAINT IF EXISTS subnets_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.shares DROP CONSTRAINT IF EXISTS shares_topology_id_fkey;
ALTER TABLE IF EXISTS ONLY public.shares DROP CONSTRAINT IF EXISTS shares_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.shares DROP CONSTRAINT IF EXISTS shares_created_by_fkey;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_host_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ports DROP CONSTRAINT IF EXISTS ports_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.ports DROP CONSTRAINT IF EXISTS ports_host_id_fkey;
ALTER TABLE IF EXISTS ONLY public.networks DROP CONSTRAINT IF EXISTS organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.invites DROP CONSTRAINT IF EXISTS invites_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.invites DROP CONSTRAINT IF EXISTS invites_created_by_fkey;
ALTER TABLE IF EXISTS ONLY public.interfaces DROP CONSTRAINT IF EXISTS interfaces_subnet_id_fkey;
ALTER TABLE IF EXISTS ONLY public.interfaces DROP CONSTRAINT IF EXISTS interfaces_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.interfaces DROP CONSTRAINT IF EXISTS interfaces_host_id_fkey;
ALTER TABLE IF EXISTS ONLY public.hosts DROP CONSTRAINT IF EXISTS hosts_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.groups DROP CONSTRAINT IF EXISTS groups_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.group_bindings DROP CONSTRAINT IF EXISTS group_bindings_group_id_fkey;
ALTER TABLE IF EXISTS ONLY public.group_bindings DROP CONSTRAINT IF EXISTS group_bindings_binding_id_fkey;
ALTER TABLE IF EXISTS ONLY public.entity_tags DROP CONSTRAINT IF EXISTS entity_tags_tag_id_fkey;
ALTER TABLE IF EXISTS ONLY public.discovery DROP CONSTRAINT IF EXISTS discovery_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.discovery DROP CONSTRAINT IF EXISTS discovery_daemon_id_fkey;
ALTER TABLE IF EXISTS ONLY public.daemons DROP CONSTRAINT IF EXISTS daemons_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.daemons DROP CONSTRAINT IF EXISTS daemons_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bindings DROP CONSTRAINT IF EXISTS bindings_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bindings DROP CONSTRAINT IF EXISTS bindings_port_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bindings DROP CONSTRAINT IF EXISTS bindings_network_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bindings DROP CONSTRAINT IF EXISTS bindings_interface_id_fkey;
ALTER TABLE IF EXISTS ONLY public.api_keys DROP CONSTRAINT IF EXISTS api_keys_network_id_fkey;
DROP TRIGGER IF EXISTS reassign_daemons_before_user_delete ON public.users;
DROP INDEX IF EXISTS public.idx_users_password_reset_token;
DROP INDEX IF EXISTS public.idx_users_organization;
DROP INDEX IF EXISTS public.idx_users_oidc_provider_subject;
DROP INDEX IF EXISTS public.idx_users_email_verification_token;
DROP INDEX IF EXISTS public.idx_users_email_lower;
DROP INDEX IF EXISTS public.idx_user_network_access_user;
DROP INDEX IF EXISTS public.idx_user_network_access_network;
DROP INDEX IF EXISTS public.idx_user_api_keys_user;
DROP INDEX IF EXISTS public.idx_user_api_keys_org;
DROP INDEX IF EXISTS public.idx_user_api_keys_key;
DROP INDEX IF EXISTS public.idx_user_api_key_network_access_network;
DROP INDEX IF EXISTS public.idx_user_api_key_network_access_key;
DROP INDEX IF EXISTS public.idx_topologies_network;
DROP INDEX IF EXISTS public.idx_tags_organization;
DROP INDEX IF EXISTS public.idx_tags_org_name;
DROP INDEX IF EXISTS public.idx_subnets_network;
DROP INDEX IF EXISTS public.idx_shares_topology;
DROP INDEX IF EXISTS public.idx_shares_network;
DROP INDEX IF EXISTS public.idx_shares_enabled;
DROP INDEX IF EXISTS public.idx_services_network;
DROP INDEX IF EXISTS public.idx_services_host_position;
DROP INDEX IF EXISTS public.idx_services_host_id;
DROP INDEX IF EXISTS public.idx_ports_number;
DROP INDEX IF EXISTS public.idx_ports_network;
DROP INDEX IF EXISTS public.idx_ports_host;
DROP INDEX IF EXISTS public.idx_organizations_stripe_customer;
DROP INDEX IF EXISTS public.idx_networks_owner_organization;
DROP INDEX IF EXISTS public.idx_invites_organization;
DROP INDEX IF EXISTS public.idx_invites_expires_at;
DROP INDEX IF EXISTS public.idx_interfaces_subnet;
DROP INDEX IF EXISTS public.idx_interfaces_network;
DROP INDEX IF EXISTS public.idx_interfaces_host_mac;
DROP INDEX IF EXISTS public.idx_interfaces_host;
DROP INDEX IF EXISTS public.idx_hosts_network;
DROP INDEX IF EXISTS public.idx_groups_network;
DROP INDEX IF EXISTS public.idx_group_bindings_group;
DROP INDEX IF EXISTS public.idx_group_bindings_binding;
DROP INDEX IF EXISTS public.idx_entity_tags_tag_id;
DROP INDEX IF EXISTS public.idx_entity_tags_entity;
DROP INDEX IF EXISTS public.idx_discovery_network;
DROP INDEX IF EXISTS public.idx_discovery_daemon;
DROP INDEX IF EXISTS public.idx_daemons_network;
DROP INDEX IF EXISTS public.idx_daemon_host_id;
DROP INDEX IF EXISTS public.idx_bindings_service;
DROP INDEX IF EXISTS public.idx_bindings_port;
DROP INDEX IF EXISTS public.idx_bindings_network;
DROP INDEX IF EXISTS public.idx_bindings_interface;
DROP INDEX IF EXISTS public.idx_api_keys_network;
DROP INDEX IF EXISTS public.idx_api_keys_key;
ALTER TABLE IF EXISTS ONLY tower_sessions.session DROP CONSTRAINT IF EXISTS session_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.user_network_access DROP CONSTRAINT IF EXISTS user_network_access_user_id_network_id_key;
ALTER TABLE IF EXISTS ONLY public.user_network_access DROP CONSTRAINT IF EXISTS user_network_access_pkey;
ALTER TABLE IF EXISTS ONLY public.user_api_keys DROP CONSTRAINT IF EXISTS user_api_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.user_api_keys DROP CONSTRAINT IF EXISTS user_api_keys_key_key;
ALTER TABLE IF EXISTS ONLY public.user_api_key_network_access DROP CONSTRAINT IF EXISTS user_api_key_network_access_pkey;
ALTER TABLE IF EXISTS ONLY public.user_api_key_network_access DROP CONSTRAINT IF EXISTS user_api_key_network_access_api_key_id_network_id_key;
ALTER TABLE IF EXISTS ONLY public.topologies DROP CONSTRAINT IF EXISTS topologies_pkey;
ALTER TABLE IF EXISTS ONLY public.tags DROP CONSTRAINT IF EXISTS tags_pkey;
ALTER TABLE IF EXISTS ONLY public.subnets DROP CONSTRAINT IF EXISTS subnets_pkey;
ALTER TABLE IF EXISTS ONLY public.shares DROP CONSTRAINT IF EXISTS shares_pkey;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_pkey;
ALTER TABLE IF EXISTS ONLY public.ports DROP CONSTRAINT IF EXISTS ports_pkey;
ALTER TABLE IF EXISTS ONLY public.ports DROP CONSTRAINT IF EXISTS ports_host_id_port_number_protocol_key;
ALTER TABLE IF EXISTS ONLY public.organizations DROP CONSTRAINT IF EXISTS organizations_pkey;
ALTER TABLE IF EXISTS ONLY public.networks DROP CONSTRAINT IF EXISTS networks_pkey;
ALTER TABLE IF EXISTS ONLY public.invites DROP CONSTRAINT IF EXISTS invites_pkey;
ALTER TABLE IF EXISTS ONLY public.interfaces DROP CONSTRAINT IF EXISTS interfaces_pkey;
ALTER TABLE IF EXISTS ONLY public.interfaces DROP CONSTRAINT IF EXISTS interfaces_host_id_subnet_id_ip_address_key;
ALTER TABLE IF EXISTS ONLY public.hosts DROP CONSTRAINT IF EXISTS hosts_pkey;
ALTER TABLE IF EXISTS ONLY public.groups DROP CONSTRAINT IF EXISTS groups_pkey;
ALTER TABLE IF EXISTS ONLY public.group_bindings DROP CONSTRAINT IF EXISTS group_bindings_pkey;
ALTER TABLE IF EXISTS ONLY public.group_bindings DROP CONSTRAINT IF EXISTS group_bindings_group_id_binding_id_key;
ALTER TABLE IF EXISTS ONLY public.entity_tags DROP CONSTRAINT IF EXISTS entity_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.entity_tags DROP CONSTRAINT IF EXISTS entity_tags_entity_id_entity_type_tag_id_key;
ALTER TABLE IF EXISTS ONLY public.discovery DROP CONSTRAINT IF EXISTS discovery_pkey;
ALTER TABLE IF EXISTS ONLY public.daemons DROP CONSTRAINT IF EXISTS daemons_pkey;
ALTER TABLE IF EXISTS ONLY public.bindings DROP CONSTRAINT IF EXISTS bindings_pkey;
ALTER TABLE IF EXISTS ONLY public.api_keys DROP CONSTRAINT IF EXISTS api_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.api_keys DROP CONSTRAINT IF EXISTS api_keys_key_key;
ALTER TABLE IF EXISTS ONLY public._sqlx_migrations DROP CONSTRAINT IF EXISTS _sqlx_migrations_pkey;
DROP TABLE IF EXISTS tower_sessions.session;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.user_network_access;
DROP TABLE IF EXISTS public.user_api_keys;
DROP TABLE IF EXISTS public.user_api_key_network_access;
DROP TABLE IF EXISTS public.topologies;
DROP TABLE IF EXISTS public.tags;
DROP TABLE IF EXISTS public.subnets;
DROP TABLE IF EXISTS public.shares;
DROP TABLE IF EXISTS public.services;
DROP TABLE IF EXISTS public.ports;
DROP TABLE IF EXISTS public.organizations;
DROP TABLE IF EXISTS public.networks;
DROP TABLE IF EXISTS public.invites;
DROP TABLE IF EXISTS public.interfaces;
DROP TABLE IF EXISTS public.hosts;
DROP TABLE IF EXISTS public.groups;
DROP TABLE IF EXISTS public.group_bindings;
DROP TABLE IF EXISTS public.entity_tags;
DROP TABLE IF EXISTS public.discovery;
DROP TABLE IF EXISTS public.daemons;
DROP TABLE IF EXISTS public.bindings;
DROP TABLE IF EXISTS public.api_keys;
DROP TABLE IF EXISTS public._sqlx_migrations;
DROP FUNCTION IF EXISTS public.reassign_daemons_on_user_delete();
DROP EXTENSION IF EXISTS pgcrypto;
DROP SCHEMA IF EXISTS tower_sessions;
--
-- Name: tower_sessions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tower_sessions;


ALTER SCHEMA tower_sessions OWNER TO postgres;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: reassign_daemons_on_user_delete(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.reassign_daemons_on_user_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    new_owner_id UUID;
BEGIN
    SELECT id INTO new_owner_id
    FROM users
    WHERE organization_id = OLD.organization_id
      AND permissions = 'Owner'
      AND id != OLD.id
    ORDER BY created_at ASC
    LIMIT 1;

    IF new_owner_id IS NOT NULL THEN
        UPDATE daemons
        SET user_id = new_owner_id
        WHERE user_id = OLD.id;
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION public.reassign_daemons_on_user_delete() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _sqlx_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._sqlx_migrations (
    version bigint NOT NULL,
    description text NOT NULL,
    installed_on timestamp with time zone DEFAULT now() NOT NULL,
    success boolean NOT NULL,
    checksum bytea NOT NULL,
    execution_time bigint NOT NULL
);


ALTER TABLE public._sqlx_migrations OWNER TO postgres;

--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_keys (
    id uuid NOT NULL,
    key text NOT NULL,
    network_id uuid NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used timestamp with time zone,
    expires_at timestamp with time zone,
    is_enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.api_keys OWNER TO postgres;

--
-- Name: bindings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bindings (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    service_id uuid NOT NULL,
    binding_type text NOT NULL,
    interface_id uuid,
    port_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT bindings_binding_type_check CHECK ((binding_type = ANY (ARRAY['Interface'::text, 'Port'::text]))),
    CONSTRAINT valid_binding CHECK ((((binding_type = 'Interface'::text) AND (interface_id IS NOT NULL) AND (port_id IS NULL)) OR ((binding_type = 'Port'::text) AND (port_id IS NOT NULL))))
);


ALTER TABLE public.bindings OWNER TO postgres;

--
-- Name: daemons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.daemons (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    host_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    last_seen timestamp with time zone NOT NULL,
    capabilities jsonb DEFAULT '{}'::jsonb,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    mode text DEFAULT '"Push"'::text,
    url text NOT NULL,
    name text,
    version text,
    user_id uuid NOT NULL
);


ALTER TABLE public.daemons OWNER TO postgres;

--
-- Name: discovery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discovery (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    daemon_id uuid NOT NULL,
    run_type jsonb NOT NULL,
    discovery_type jsonb NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.discovery OWNER TO postgres;

--
-- Name: entity_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entity_tags (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    entity_id uuid NOT NULL,
    entity_type character varying(50) NOT NULL,
    tag_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.entity_tags OWNER TO postgres;

--
-- Name: group_bindings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_bindings (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    group_id uuid NOT NULL,
    binding_id uuid NOT NULL,
    "position" integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.group_bindings OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    source jsonb NOT NULL,
    color text NOT NULL,
    edge_style text DEFAULT '"SmoothStep"'::text,
    group_type text NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: hosts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hosts (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    name text NOT NULL,
    hostname text,
    description text,
    source jsonb NOT NULL,
    virtualization jsonb,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    hidden boolean DEFAULT false
);


ALTER TABLE public.hosts OWNER TO postgres;

--
-- Name: interfaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interfaces (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    host_id uuid NOT NULL,
    subnet_id uuid NOT NULL,
    ip_address inet NOT NULL,
    mac_address macaddr,
    name text,
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.interfaces OWNER TO postgres;

--
-- Name: invites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invites (
    id uuid NOT NULL,
    organization_id uuid NOT NULL,
    permissions text NOT NULL,
    network_ids uuid[] NOT NULL,
    url text NOT NULL,
    created_by uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    send_to text
);


ALTER TABLE public.invites OWNER TO postgres;

--
-- Name: networks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.networks (
    id uuid NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    organization_id uuid NOT NULL
);


ALTER TABLE public.networks OWNER TO postgres;

--
-- Name: COLUMN networks.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.networks.organization_id IS 'The organization that owns and pays for this network';


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    stripe_customer_id text,
    plan jsonb NOT NULL,
    plan_status text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    onboarding jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.organizations OWNER TO postgres;

--
-- Name: TABLE organizations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.organizations IS 'Organizations that own networks and have Stripe subscriptions';


--
-- Name: COLUMN organizations.plan; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.organizations.plan IS 'The current billing plan for the organization (e.g., Community, Pro)';


--
-- Name: ports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ports (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    host_id uuid NOT NULL,
    port_number integer NOT NULL,
    protocol text NOT NULL,
    port_type text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ports_port_number_check CHECK (((port_number >= 0) AND (port_number <= 65535))),
    CONSTRAINT ports_protocol_check CHECK ((protocol = ANY (ARRAY['Tcp'::text, 'Udp'::text])))
);


ALTER TABLE public.ports OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name text NOT NULL,
    host_id uuid NOT NULL,
    service_definition text NOT NULL,
    virtualization jsonb,
    source jsonb NOT NULL,
    "position" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shares (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    topology_id uuid NOT NULL,
    network_id uuid NOT NULL,
    created_by uuid NOT NULL,
    name text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    expires_at timestamp with time zone,
    password_hash text,
    allowed_domains text[],
    options jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.shares OWNER TO postgres;

--
-- Name: subnets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subnets (
    id uuid NOT NULL,
    network_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    cidr text NOT NULL,
    name text NOT NULL,
    description text,
    subnet_type text NOT NULL,
    source jsonb NOT NULL
);


ALTER TABLE public.subnets OWNER TO postgres;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id uuid NOT NULL,
    organization_id uuid NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    color text NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: topologies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topologies (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    network_id uuid NOT NULL,
    name text NOT NULL,
    edges jsonb NOT NULL,
    nodes jsonb NOT NULL,
    options jsonb NOT NULL,
    hosts jsonb NOT NULL,
    subnets jsonb NOT NULL,
    services jsonb NOT NULL,
    groups jsonb NOT NULL,
    is_stale boolean,
    last_refreshed timestamp with time zone DEFAULT now() NOT NULL,
    is_locked boolean,
    locked_at timestamp with time zone,
    locked_by uuid,
    removed_hosts uuid[],
    removed_services uuid[],
    removed_subnets uuid[],
    removed_groups uuid[],
    parent_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    tags uuid[] DEFAULT '{}'::uuid[] NOT NULL,
    interfaces jsonb DEFAULT '[]'::jsonb NOT NULL,
    removed_interfaces uuid[] DEFAULT '{}'::uuid[],
    ports jsonb DEFAULT '[]'::jsonb NOT NULL,
    removed_ports uuid[] DEFAULT '{}'::uuid[],
    bindings jsonb DEFAULT '[]'::jsonb NOT NULL,
    removed_bindings uuid[] DEFAULT '{}'::uuid[]
);


ALTER TABLE public.topologies OWNER TO postgres;

--
-- Name: user_api_key_network_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_api_key_network_access (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    api_key_id uuid NOT NULL,
    network_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_api_key_network_access OWNER TO postgres;

--
-- Name: user_api_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_api_keys (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    key text NOT NULL,
    user_id uuid NOT NULL,
    organization_id uuid NOT NULL,
    permissions text DEFAULT 'Viewer'::text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    last_used timestamp with time zone,
    expires_at timestamp with time zone,
    is_enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.user_api_keys OWNER TO postgres;

--
-- Name: user_network_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_network_access (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    network_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_network_access OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    password_hash text,
    oidc_provider text,
    oidc_subject text,
    oidc_linked_at timestamp with time zone,
    email text NOT NULL,
    organization_id uuid NOT NULL,
    permissions text DEFAULT 'Member'::text NOT NULL,
    tags uuid[] DEFAULT '{}'::uuid[] NOT NULL,
    terms_accepted_at timestamp with time zone,
    email_verified boolean DEFAULT false NOT NULL,
    email_verification_token text,
    email_verification_expires timestamp with time zone,
    password_reset_token text,
    password_reset_expires timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.organization_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.organization_id IS 'The single organization this user belongs to';


--
-- Name: COLUMN users.permissions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.permissions IS 'User role within their organization: Owner, Member, Viewer';


--
-- Name: session; Type: TABLE; Schema: tower_sessions; Owner: postgres
--

CREATE TABLE tower_sessions.session (
    id text NOT NULL,
    data bytea NOT NULL,
    expiry_date timestamp with time zone NOT NULL
);


ALTER TABLE tower_sessions.session OWNER TO postgres;

--
-- Data for Name: _sqlx_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._sqlx_migrations (version, description, installed_on, success, checksum, execution_time) FROM stdin;
20251006215000	users	2026-01-15 23:10:23.102718+00	t	\\x4f13ce14ff67ef0b7145987c7b22b588745bf9fbb7b673450c26a0f2f9a36ef8ca980e456c8d77cfb1b2d7a4577a64d7	4760034
20251006215100	networks	2026-01-15 23:10:23.108724+00	t	\\xeaa5a07a262709f64f0c59f31e25519580c79e2d1a523ce72736848946a34b17dd9adc7498eaf90551af6b7ec6d4e0e3	5639798
20251006215151	create hosts	2026-01-15 23:10:23.114758+00	t	\\x6ec7487074c0724932d21df4cf1ed66645313cf62c159a7179e39cbc261bcb81a24f7933a0e3cf58504f2a90fc5c1962	4082303
20251006215155	create subnets	2026-01-15 23:10:23.1192+00	t	\\xefb5b25742bd5f4489b67351d9f2494a95f307428c911fd8c5f475bfb03926347bdc269bbd048d2ddb06336945b27926	4015469
20251006215201	create groups	2026-01-15 23:10:23.123663+00	t	\\x0a7032bf4d33a0baf020e905da865cde240e2a09dda2f62aa535b2c5d4b26b20be30a3286f1b5192bd94cd4a5dbb5bcd	4628522
20251006215204	create daemons	2026-01-15 23:10:23.128723+00	t	\\xcfea93403b1f9cf9aac374711d4ac72d8a223e3c38a1d2a06d9edb5f94e8a557debac3668271f8176368eadc5105349f	4754951
20251006215212	create services	2026-01-15 23:10:23.133898+00	t	\\xd5b07f82fc7c9da2782a364d46078d7d16b5c08df70cfbf02edcfe9b1b24ab6024ad159292aeea455f15cfd1f4740c1d	5143533
20251029193448	user-auth	2026-01-15 23:10:23.139456+00	t	\\xfde8161a8db89d51eeade7517d90a41d560f19645620f2298f78f116219a09728b18e91251ae31e46a47f6942d5a9032	7044558
20251030044828	daemon api	2026-01-15 23:10:23.14689+00	t	\\x181eb3541f51ef5b038b2064660370775d1b364547a214a20dde9c9d4bb95a1c273cd4525ef29e61fa65a3eb4fee0400	1681403
20251030170438	host-hide	2026-01-15 23:10:23.148904+00	t	\\x87c6fda7f8456bf610a78e8e98803158caa0e12857c5bab466a5bb0004d41b449004a68e728ca13f17e051f662a15454	1308323
20251102224919	create discovery	2026-01-15 23:10:23.150621+00	t	\\xb32a04abb891aba48f92a059fae7341442355ca8e4af5d109e28e2a4f79ee8e11b2a8f40453b7f6725c2dd6487f26573	12166206
20251106235621	normalize-daemon-cols	2026-01-15 23:10:23.163282+00	t	\\x5b137118d506e2708097c432358bf909265b3cf3bacd662b02e2c81ba589a9e0100631c7801cffd9c57bb10a6674fb3b	2151524
20251107034459	api keys	2026-01-15 23:10:23.165724+00	t	\\x3133ec043c0c6e25b6e55f7da84cae52b2a72488116938a2c669c8512c2efe72a74029912bcba1f2a2a0a8b59ef01dde	10161983
20251107222650	oidc-auth	2026-01-15 23:10:23.176273+00	t	\\xd349750e0298718cbcd98eaff6e152b3fb45c3d9d62d06eedeb26c75452e9ce1af65c3e52c9f2de4bd532939c2f31096	30148285
20251110181948	orgs-billing	2026-01-15 23:10:23.206828+00	t	\\x5bbea7a2dfc9d00213bd66b473289ddd66694eff8a4f3eaab937c985b64c5f8c3ad2d64e960afbb03f335ac6766687aa	12305412
20251113223656	group-enhancements	2026-01-15 23:10:23.219509+00	t	\\xbe0699486d85df2bd3edc1f0bf4f1f096d5b6c5070361702c4d203ec2bb640811be88bb1979cfe51b40805ad84d1de65	1111244
20251117032720	daemon-mode	2026-01-15 23:10:23.220915+00	t	\\xdd0d899c24b73d70e9970e54b2c748d6b6b55c856ca0f8590fe990da49cc46c700b1ce13f57ff65abd6711f4bd8a6481	1165085
20251118143058	set-default-plan	2026-01-15 23:10:23.222371+00	t	\\xd19142607aef84aac7cfb97d60d29bda764d26f513f2c72306734c03cec2651d23eee3ce6cacfd36ca52dbddc462f917	1513317
20251118225043	save-topology	2026-01-15 23:10:23.224235+00	t	\\x011a594740c69d8d0f8b0149d49d1b53cfbf948b7866ebd84403394139cb66a44277803462846b06e762577adc3e61a3	9679038
20251123232748	network-permissions	2026-01-15 23:10:23.234312+00	t	\\x161be7ae5721c06523d6488606f1a7b1f096193efa1183ecdd1c2c9a4a9f4cad4884e939018917314aaf261d9a3f97ae	3025342
20251125001342	billing-updates	2026-01-15 23:10:23.237711+00	t	\\xa235d153d95aeb676e3310a52ccb69dfbd7ca36bba975d5bbca165ceeec7196da12119f23597ea5276c364f90f23db1e	957585
20251128035448	org-onboarding-status	2026-01-15 23:10:23.238947+00	t	\\x1d7a7e9bf23b5078250f31934d1bc47bbaf463ace887e7746af30946e843de41badfc2b213ed64912a18e07b297663d8	1468383
20251129180942	nfs-consolidate	2026-01-15 23:10:23.24073+00	t	\\xb38f41d30699a475c2b967f8e43156f3b49bb10341bddbde01d9fb5ba805f6724685e27e53f7e49b6c8b59e29c74f98e	1341626
20251206052641	discovery-progress	2026-01-15 23:10:23.242563+00	t	\\x9d433b7b8c58d0d5437a104497e5e214febb2d1441a3ad7c28512e7497ed14fb9458e0d4ff786962a59954cb30da1447	1657417
20251206202200	plan-fix	2026-01-15 23:10:23.244542+00	t	\\x242f6699dbf485cf59a8d1b8cd9d7c43aeef635a9316be815a47e15238c5e4af88efaa0daf885be03572948dc0c9edac	953908
20251207061341	daemon-url	2026-01-15 23:10:23.245802+00	t	\\x01172455c4f2d0d57371d18ef66d2ab3b7a8525067ef8a86945c616982e6ce06f5ea1e1560a8f20dadcd5be2223e6df1	2502131
20251210045929	tags	2026-01-15 23:10:23.248731+00	t	\\xe3dde83d39f8552b5afcdc1493cddfeffe077751bf55472032bc8b35fc8fc2a2caa3b55b4c2354ace7de03c3977982db	9659513
20251210175035	terms	2026-01-15 23:10:23.258743+00	t	\\xe47f0cf7aba1bffa10798bede953da69fd4bfaebf9c75c76226507c558a3595c6bfc6ac8920d11398dbdf3b762769992	1015975
20251213025048	hash-keys	2026-01-15 23:10:23.260086+00	t	\\xfc7cbb8ce61f0c225322297f7459dcbe362242b9001c06cb874b7f739cea7ae888d8f0cfaed6623bcbcb9ec54c8cd18b	12311874
20251214050638	scanopy	2026-01-15 23:10:23.272741+00	t	\\x0108bb39832305f024126211710689adc48d973ff66e5e59ff49468389b75c1ff95d1fbbb7bdb50e33ec1333a1f29ea6	1602184
20251215215724	topo-scanopy-fix	2026-01-15 23:10:23.274745+00	t	\\xed88a4b71b3c9b61d46322b5053362e5a25a9293cd3c420c9df9fcaeb3441254122b8a18f58c297f535c842b8a8b0a38	796694
20251217153736	category rename	2026-01-15 23:10:23.275829+00	t	\\x03af7ec905e11a77e25038a3c272645da96014da7c50c585a25cea3f9a7579faba3ff45114a5e589d144c9550ba42421	1837124
20251218053111	invite-persistence	2026-01-15 23:10:23.278017+00	t	\\x21d12f48b964acfd600f88e70ceb14abd9cf2a8a10db2eae2a6d8f44cf7d20749f93293631e6123e92b7c3c1793877c2	5628052
20251219211216	create shares	2026-01-15 23:10:23.284018+00	t	\\x036485debd3536f9e58ead728f461b925585911acf565970bf3b2ab295b12a2865606d6a56d334c5641dcd42adeb3d68	7232059
20251220170928	permissions-cleanup	2026-01-15 23:10:23.291686+00	t	\\x632f7b6702b494301e0d36fd3b900686b1a7f9936aef8c084b5880f1152b8256a125566e2b5ac40216eaadd3c4c64a03	1702141
20251220180000	commercial-to-community	2026-01-15 23:10:23.293717+00	t	\\x26fc298486c225f2f01271d611418377c403183ae51daf32fef104ec07c027f2017d138910c4fbfb5f49819a5f4194d6	887384
20251221010000	cleanup subnet type	2026-01-15 23:10:23.294914+00	t	\\xb521121f3fd3a10c0de816977ac2a2ffb6118f34f8474ffb9058722abc0dc4cf5cbec83bc6ee49e79a68e6b715087f40	1041011
20251221020000	remove host target	2026-01-15 23:10:23.296317+00	t	\\x77b5f8872705676ca81a5704bd1eaee90b9a52b404bdaa27a23da2ffd4858d3e131680926a5a00ad2a0d7a24ba229046	1025744
20251221030000	user network access	2026-01-15 23:10:23.297693+00	t	\\x5c23f5bb6b0b8ca699a17eee6730c4197a006ca21fecc79136a5e5697b9211a81b4cd08ceda70dace6a26408d021ff3a	7588938
20251221040000	interfaces table	2026-01-15 23:10:23.305875+00	t	\\xf7977b6f1e7e5108c614397d03a38c9bd9243fdc422575ec29610366a0c88f443de2132185878d8e291f06a50a8c3244	10512490
20251221050000	ports table	2026-01-15 23:10:23.316736+00	t	\\xdf72f9306b405be7be62c39003ef38408115e740b120f24e8c78b8e136574fff7965c52023b3bc476899613fa5f4fe35	9682142
20251221060000	bindings table	2026-01-15 23:10:23.326826+00	t	\\x933648a724bd179c7f47305e4080db85342d48712cde39374f0f88cde9d7eba8fe5fafba360937331e2a8178dec420c4	11236647
20251221070000	group bindings	2026-01-15 23:10:23.338836+00	t	\\x697475802f6c42e38deee6596f4ba786b09f7b7cd91742fbc5696dd0f9b3ddfce90dd905153f2b1a9e82f959f5a88302	7198657
20251222020000	tag cascade delete	2026-01-15 23:10:23.346653+00	t	\\xabfb48c0da8522f5c8ea6d482eb5a5f4562ed41f6160a5915f0fd477c7dd0517aa84760ef99ab3a5db3e0f21b0c69b5f	1390578
20251223232524	network remove default	2026-01-15 23:10:23.348408+00	t	\\x7099fe4e52405e46269d7ce364050da930b481e72484ad3c4772fd2911d2d505476d659fa9f400c63bc287512d033e18	1408321
20251225100000	color enum	2026-01-15 23:10:23.35019+00	t	\\x62cecd9d79a49835a3bea68a7959ab62aa0c1aaa7e2940dec6a7f8a714362df3649f0c1f9313672d9268295ed5a1cfa9	1508919
20251227010000	topology snapshot migration	2026-01-15 23:10:23.352013+00	t	\\xc042591d254869c0e79c8b52a9ede680fd26f094e2c385f5f017e115f5e3f31ad155f4885d095344f2642ebb70755d54	5076678
20251228010000	user api keys	2026-01-15 23:10:23.357429+00	t	\\xa41adb558a5b9d94a4e17af3f16839b83f7da072dbeac9251b12d8a84c7bec6df008009acf246468712a975bb36bb5f5	12302415
20251230160000	daemon version and maintainer	2026-01-15 23:10:23.370178+00	t	\\xafed3d9f00adb8c1b0896fb663af801926c218472a0a197f90ecdaa13305a78846a9e15af0043ec010328ba533fca68f	3051812
20260103000000	service position	2026-01-15 23:10:23.373761+00	t	\\x19d00e8c8b300d1c74d721931f4d771ec7bc4e06db0d6a78126e00785586fdc4bcff5b832eeae2fce0cb8d01e12a7fb5	2137749
20260106000000	interface mac index	2026-01-15 23:10:23.37624+00	t	\\xa26248372a1e31af46a9c6fbdaef178982229e2ceeb90cc6a289d5764f87a38747294b3adf5f21276b5d171e42bdb6ac	2156814
20260106204402	entity tags junction	2026-01-15 23:10:23.378689+00	t	\\xf73c604f9f0b8db065d990a861684b0dbd62c3ef9bead120c68431c933774de56491a53f021e79f09801680152f5a08a	13199548
20260108033856	fix entity tags json format	2026-01-15 23:10:23.39226+00	t	\\x197eaa063d4f96dd0e897ad8fd96cc1ba9a54dda40a93a5c12eac14597e4dea4c806dd0a527736fb5807b7a8870d9916	1749610
20260110000000	email verification	2026-01-15 23:10:23.394364+00	t	\\xb8da8433f58ba4ce846b9fa0c2551795747a8473ad10266b19685504847458ea69d27a0ce430151cfb426f5f5fb6ac3a	3479393
20260114145808	daemon user fk set null	2026-01-15 23:10:23.398197+00	t	\\x57b060be9fc314d7c5851c75661ca8269118feea6cf7ee9c61b147a0e117c4d39642cf0d1acdf7a723a9a76066c1b8ff	1204098
\.


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_keys (id, key, network_id, name, created_at, updated_at, last_used, expires_at, is_enabled) FROM stdin;
92837f50-fc6f-4749-b7ae-5655264e6532	6483dfccb91f0535ade9f22da02fc040e0082c28f9fa21aa9e6bc0a03e21bb42	3e3bdb86-cfa2-47bd-8b82-d380874663b6	Integrated Daemon API Key	2026-01-15 23:10:29.09731+00	2026-01-15 23:10:29.09731+00	2026-01-15 23:12:28.425588+00	\N	t
\.


--
-- Data for Name: bindings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bindings (id, network_id, service_id, binding_type, interface_id, port_id, created_at, updated_at) FROM stdin;
5c8e8ad7-b4e1-48fb-8668-d5bf1c5e7173	3e3bdb86-cfa2-47bd-8b82-d380874663b6	97c5df4f-eb0b-4a5c-85d5-bc15ed1e4e0e	Port	e14d5018-8cf3-4a4e-9515-14b300d45b68	7f87ec26-d0a0-4539-a372-372d2f5bef34	2026-01-15 23:10:29.246285+00	2026-01-15 23:10:29.246285+00
ec71e8a8-ebd6-4f27-9e9d-c0011daa7742	3e3bdb86-cfa2-47bd-8b82-d380874663b6	362d42c7-98bc-4b73-91f4-a8900ae0b8ad	Port	3c45db88-b362-425b-b58f-469cae877896	de967853-c86c-4e28-a296-dfb24c7b42ba	2026-01-15 23:11:06.229814+00	2026-01-15 23:11:06.229814+00
917c9afc-6750-4dd4-a750-b97194eff8b7	3e3bdb86-cfa2-47bd-8b82-d380874663b6	bce8353b-7927-4593-bde0-731b3c6448f1	Port	7186fe86-eac4-407a-b1b1-861ccf9b351d	276985b6-7660-4640-9bb1-fd7ef6aa5dd9	2026-01-15 23:11:07.189156+00	2026-01-15 23:11:07.189156+00
b144879d-a061-4064-8761-58dbcac56538	3e3bdb86-cfa2-47bd-8b82-d380874663b6	46588cab-545e-4415-abb1-af40b6de52a6	Port	d8e83c86-78e9-4e91-bb42-0a85d368db5b	05d3880d-578c-45fd-9866-78c68b797844	2026-01-15 23:11:36.962422+00	2026-01-15 23:11:36.962422+00
5183e3f5-962d-4947-bb65-0ee40b1734fe	3e3bdb86-cfa2-47bd-8b82-d380874663b6	46588cab-545e-4415-abb1-af40b6de52a6	Port	d8e83c86-78e9-4e91-bb42-0a85d368db5b	c6de1b68-df0d-4d56-9553-0082e56fd9a1	2026-01-15 23:11:36.962424+00	2026-01-15 23:11:36.962424+00
2eb74cc2-3f46-449a-ae8c-45dd6da7e537	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2a2ed6bc-c0b2-4cf9-9d53-fc387d560e9c	Port	04ed19a1-8f0b-4617-b28c-d1be9853aa5f	b4a204fc-abe4-441b-875c-b655a9f38b3e	2026-01-15 23:11:43.867182+00	2026-01-15 23:11:43.867182+00
40630768-6d36-4fd7-abb3-f0c472531d85	3e3bdb86-cfa2-47bd-8b82-d380874663b6	0150d473-8e3b-4e83-bcd3-b1ca5aeed3a4	Port	04ed19a1-8f0b-4617-b28c-d1be9853aa5f	e9d662a7-e872-453a-b7c1-1f11392f7e15	2026-01-15 23:11:51.349088+00	2026-01-15 23:11:51.349088+00
d3760f5d-579b-4e83-9c87-3560a52d99c6	3e3bdb86-cfa2-47bd-8b82-d380874663b6	7b65dd25-17d4-4103-9729-b680a59bc3b6	Port	04ed19a1-8f0b-4617-b28c-d1be9853aa5f	52595cbc-0ee1-46b8-8aea-fa6b7e212209	2026-01-15 23:11:58.018096+00	2026-01-15 23:11:58.018096+00
01f0272c-689f-4f99-b8e8-63aae2c2c0d4	3e3bdb86-cfa2-47bd-8b82-d380874663b6	03a8d101-23e7-4bd5-acd0-0f03c138373b	Port	04ed19a1-8f0b-4617-b28c-d1be9853aa5f	58643923-e96d-412a-8da1-6d07ac9ce6ac	2026-01-15 23:11:58.018476+00	2026-01-15 23:11:58.018476+00
\.


--
-- Data for Name: daemons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.daemons (id, network_id, host_id, created_at, last_seen, capabilities, updated_at, mode, url, name, version, user_id) FROM stdin;
316500c6-088a-4c75-816a-1fc3d772d496	3e3bdb86-cfa2-47bd-8b82-d380874663b6	04565a18-a7dd-4906-bbf6-270194a74469	2026-01-15 23:10:29.20695+00	2026-01-15 23:12:11.027012+00	{"has_docker_socket": false, "interfaced_subnet_ids": ["855151ac-fcf5-4092-aee2-a91284a1c931"]}	2026-01-15 23:10:29.20695+00	"Push"	http://172.25.0.4:60073	scanopy-daemon	0.13.6	c678fd83-ae33-41bf-af41-f70cc9b11959
\.


--
-- Data for Name: discovery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discovery (id, network_id, daemon_id, run_type, discovery_type, name, created_at, updated_at) FROM stdin;
ad9d195e-767a-4cc8-a55c-426ebad0baa2	3e3bdb86-cfa2-47bd-8b82-d380874663b6	316500c6-088a-4c75-816a-1fc3d772d496	{"type": "Scheduled", "enabled": true, "last_run": null, "cron_schedule": "0 0 0 * * *"}	{"type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469"}	Self Report	2026-01-15 23:10:29.217145+00	2026-01-15 23:10:29.217145+00
51db8898-9761-4dc6-9a35-f9e0600f9e2c	3e3bdb86-cfa2-47bd-8b82-d380874663b6	316500c6-088a-4c75-816a-1fc3d772d496	{"type": "Scheduled", "enabled": true, "last_run": null, "cron_schedule": "0 0 0 * * *"}	{"type": "Network", "subnet_ids": null, "host_naming_fallback": "BestService"}	Network Discovery	2026-01-15 23:10:29.225346+00	2026-01-15 23:10:29.225346+00
51800cf0-37e9-4953-a258-0c8fe578f515	3e3bdb86-cfa2-47bd-8b82-d380874663b6	316500c6-088a-4c75-816a-1fc3d772d496	{"type": "Historical", "results": {"error": null, "phase": "Complete", "progress": 100, "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "session_id": "67e5ab07-816c-4a64-8a1f-92c9187c124e", "started_at": "2026-01-15T23:10:29.224853315Z", "finished_at": "2026-01-15T23:10:29.369898505Z", "discovery_type": {"type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469"}}}	{"type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469"}	Self Report	2026-01-15 23:10:29.224853+00	2026-01-15 23:10:29.373982+00
9973c3a6-a31c-486a-ad02-c290380e8b52	3e3bdb86-cfa2-47bd-8b82-d380874663b6	316500c6-088a-4c75-816a-1fc3d772d496	{"type": "Historical", "results": {"error": null, "phase": "Complete", "progress": 100, "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "session_id": "a63060ff-80b7-416f-afa1-50394c950e51", "started_at": "2026-01-15T23:10:29.390259720Z", "finished_at": "2026-01-15T23:12:28.424177317Z", "discovery_type": {"type": "Network", "subnet_ids": null, "host_naming_fallback": "BestService"}}}	{"type": "Network", "subnet_ids": null, "host_naming_fallback": "BestService"}	Network Discovery	2026-01-15 23:10:29.390259+00	2026-01-15 23:12:28.427708+00
\.


--
-- Data for Name: entity_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entity_tags (id, entity_id, entity_type, tag_id, created_at) FROM stdin;
\.


--
-- Data for Name: group_bindings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_bindings (id, group_id, binding_id, "position", created_at) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, network_id, name, description, created_at, updated_at, source, color, edge_style, group_type) FROM stdin;
80976cd9-2d05-4768-9f64-20c419387ebb	3e3bdb86-cfa2-47bd-8b82-d380874663b6		\N	2026-01-15 23:12:28.441474+00	2026-01-15 23:12:28.441474+00	{"type": "Manual"}	Yellow	"SmoothStep"	RequestPath
\.


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hosts (id, network_id, name, hostname, description, source, virtualization, created_at, updated_at, hidden) FROM stdin;
04565a18-a7dd-4906-bbf6-270194a74469	3e3bdb86-cfa2-47bd-8b82-d380874663b6	scanopy-daemon	326068a7caa8	\N	{"type": "Discovery", "metadata": [{"date": "2026-01-15T23:10:29.246269265Z", "type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496"}]}	null	2026-01-15 23:10:29.200663+00	2026-01-15 23:10:29.200663+00	f
ced2a82d-de5a-4f59-9e2a-afd2c170b587	3e3bdb86-cfa2-47bd-8b82-d380874663b6	scanopy-postgres-dev-1.scanopy_scanopy-dev	scanopy-postgres-dev-1.scanopy_scanopy-dev	\N	{"type": "Discovery", "metadata": [{"date": "2026-01-15T23:10:50.864552795Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	null	2026-01-15 23:10:50.864553+00	2026-01-15 23:10:50.864553+00	f
5ec27aa2-c980-4dc5-82e8-79c1267e2356	3e3bdb86-cfa2-47bd-8b82-d380874663b6	scanopy-server-1.scanopy_scanopy-dev	scanopy-server-1.scanopy_scanopy-dev	\N	{"type": "Discovery", "metadata": [{"date": "2026-01-15T23:11:06.342055193Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	null	2026-01-15 23:11:06.342056+00	2026-01-15 23:11:06.342056+00	f
8001b3a4-eef7-40c3-8264-4315e8af47f5	3e3bdb86-cfa2-47bd-8b82-d380874663b6	homeassistant-discovery.scanopy_scanopy-dev	homeassistant-discovery.scanopy_scanopy-dev	\N	{"type": "Discovery", "metadata": [{"date": "2026-01-15T23:11:21.642532688Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	null	2026-01-15 23:11:21.642534+00	2026-01-15 23:11:21.642534+00	f
1e4ecfb5-c7a0-4da6-aa96-23391dff955c	3e3bdb86-cfa2-47bd-8b82-d380874663b6	runnervmmtnos	runnervmmtnos	\N	{"type": "Discovery", "metadata": [{"date": "2026-01-15T23:11:43.088519238Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	null	2026-01-15 23:11:43.08852+00	2026-01-15 23:11:43.08852+00	f
\.


--
-- Data for Name: interfaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interfaces (id, network_id, host_id, subnet_id, ip_address, mac_address, name, "position", created_at, updated_at) FROM stdin;
e14d5018-8cf3-4a4e-9515-14b300d45b68	3e3bdb86-cfa2-47bd-8b82-d380874663b6	04565a18-a7dd-4906-bbf6-270194a74469	855151ac-fcf5-4092-aee2-a91284a1c931	172.25.0.4	c6:d5:c8:a7:08:df	eth0	0	2026-01-15 23:10:29.225136+00	2026-01-15 23:10:29.225136+00
3c45db88-b362-425b-b58f-469cae877896	3e3bdb86-cfa2-47bd-8b82-d380874663b6	ced2a82d-de5a-4f59-9e2a-afd2c170b587	855151ac-fcf5-4092-aee2-a91284a1c931	172.25.0.6	12:e5:0e:37:5f:85	\N	0	2026-01-15 23:10:50.864523+00	2026-01-15 23:10:50.864523+00
7186fe86-eac4-407a-b1b1-861ccf9b351d	3e3bdb86-cfa2-47bd-8b82-d380874663b6	5ec27aa2-c980-4dc5-82e8-79c1267e2356	855151ac-fcf5-4092-aee2-a91284a1c931	172.25.0.3	da:82:99:ec:16:01	\N	0	2026-01-15 23:11:06.342024+00	2026-01-15 23:11:06.342024+00
d8e83c86-78e9-4e91-bb42-0a85d368db5b	3e3bdb86-cfa2-47bd-8b82-d380874663b6	8001b3a4-eef7-40c3-8264-4315e8af47f5	855151ac-fcf5-4092-aee2-a91284a1c931	172.25.0.5	7a:3a:02:30:77:ca	\N	0	2026-01-15 23:11:21.642502+00	2026-01-15 23:11:21.642502+00
04ed19a1-8f0b-4617-b28c-d1be9853aa5f	3e3bdb86-cfa2-47bd-8b82-d380874663b6	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	855151ac-fcf5-4092-aee2-a91284a1c931	172.25.0.1	0a:41:67:06:34:cc	\N	0	2026-01-15 23:11:43.088482+00	2026-01-15 23:11:43.088482+00
\.


--
-- Data for Name: invites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invites (id, organization_id, permissions, network_ids, url, created_by, created_at, updated_at, expires_at, send_to) FROM stdin;
\.


--
-- Data for Name: networks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.networks (id, name, created_at, updated_at, organization_id) FROM stdin;
3e3bdb86-cfa2-47bd-8b82-d380874663b6	My Network	2026-01-15 23:10:29.039283+00	2026-01-15 23:10:29.039283+00	8bf13987-2ec3-4cfd-89f3-5bedbc73fa64
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizations (id, name, stripe_customer_id, plan, plan_status, created_at, updated_at, onboarding) FROM stdin;
8bf13987-2ec3-4cfd-89f3-5bedbc73fa64	My Organization	\N	{"rate": "Month", "type": "Community", "base_cents": 0, "trial_days": 0}	active	2026-01-15 23:10:29.028906+00	2026-01-15 23:10:29.028906+00	["OnboardingModalCompleted", "FirstDaemonRegistered", "FirstApiKeyCreated"]
\.


--
-- Data for Name: ports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ports (id, network_id, host_id, port_number, protocol, port_type, created_at, updated_at) FROM stdin;
7f87ec26-d0a0-4539-a372-372d2f5bef34	3e3bdb86-cfa2-47bd-8b82-d380874663b6	04565a18-a7dd-4906-bbf6-270194a74469	60073	Tcp	Custom	2026-01-15 23:10:29.246068+00	2026-01-15 23:10:29.246068+00
de967853-c86c-4e28-a296-dfb24c7b42ba	3e3bdb86-cfa2-47bd-8b82-d380874663b6	ced2a82d-de5a-4f59-9e2a-afd2c170b587	5432	Tcp	PostgreSQL	2026-01-15 23:11:06.229804+00	2026-01-15 23:11:06.229804+00
276985b6-7660-4640-9bb1-fd7ef6aa5dd9	3e3bdb86-cfa2-47bd-8b82-d380874663b6	5ec27aa2-c980-4dc5-82e8-79c1267e2356	60072	Tcp	Custom	2026-01-15 23:11:07.189145+00	2026-01-15 23:11:07.189145+00
05d3880d-578c-45fd-9866-78c68b797844	3e3bdb86-cfa2-47bd-8b82-d380874663b6	8001b3a4-eef7-40c3-8264-4315e8af47f5	8123	Tcp	Custom	2026-01-15 23:11:36.962411+00	2026-01-15 23:11:36.962411+00
c6de1b68-df0d-4d56-9553-0082e56fd9a1	3e3bdb86-cfa2-47bd-8b82-d380874663b6	8001b3a4-eef7-40c3-8264-4315e8af47f5	18555	Tcp	Custom	2026-01-15 23:11:36.962417+00	2026-01-15 23:11:36.962417+00
b4a204fc-abe4-441b-875c-b655a9f38b3e	3e3bdb86-cfa2-47bd-8b82-d380874663b6	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	60072	Tcp	Custom	2026-01-15 23:11:43.867171+00	2026-01-15 23:11:43.867171+00
e9d662a7-e872-453a-b7c1-1f11392f7e15	3e3bdb86-cfa2-47bd-8b82-d380874663b6	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	8123	Tcp	Custom	2026-01-15 23:11:51.349077+00	2026-01-15 23:11:51.349077+00
52595cbc-0ee1-46b8-8aea-fa6b7e212209	3e3bdb86-cfa2-47bd-8b82-d380874663b6	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	22	Tcp	Ssh	2026-01-15 23:11:58.018086+00	2026-01-15 23:11:58.018086+00
58643923-e96d-412a-8da1-6d07ac9ce6ac	3e3bdb86-cfa2-47bd-8b82-d380874663b6	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	5435	Tcp	Custom	2026-01-15 23:11:58.018472+00	2026-01-15 23:11:58.018472+00
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, network_id, created_at, updated_at, name, host_id, service_definition, virtualization, source, "position") FROM stdin;
97c5df4f-eb0b-4a5c-85d5-bc15ed1e4e0e	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:10:29.246289+00	2026-01-15 23:10:29.246289+00	Scanopy Daemon	04565a18-a7dd-4906-bbf6-270194a74469	"Scanopy Daemon"	null	{"type": "DiscoveryWithMatch", "details": {"reason": {"data": "Scanopy Daemon self-report", "type": "reason"}, "confidence": "Certain"}, "metadata": [{"date": "2026-01-15T23:10:29.246288771Z", "type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496"}]}	0
362d42c7-98bc-4b73-91f4-a8900ae0b8ad	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:11:06.229818+00	2026-01-15 23:11:06.229818+00	PostgreSQL	ced2a82d-de5a-4f59-9e2a-afd2c170b587	"PostgreSQL"	null	{"type": "DiscoveryWithMatch", "details": {"reason": {"data": ["Generic service", [{"data": "Port 5432/tcp is open", "type": "reason"}]], "type": "container"}, "confidence": "NotApplicable"}, "metadata": [{"date": "2026-01-15T23:11:06.229798912Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	0
bce8353b-7927-4593-bde0-731b3c6448f1	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:11:07.18916+00	2026-01-15 23:11:07.18916+00	Scanopy Server	5ec27aa2-c980-4dc5-82e8-79c1267e2356	"Scanopy Server"	null	{"type": "DiscoveryWithMatch", "details": {"reason": {"data": "Response for 172.25.0.3:60072/api/health contained \\"scanopy\\" in body", "type": "reason"}, "confidence": "High"}, "metadata": [{"date": "2026-01-15T23:11:07.189138525Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	0
46588cab-545e-4415-abb1-af40b6de52a6	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:11:36.962427+00	2026-01-15 23:11:36.962427+00	Unclaimed Open Ports	8001b3a4-eef7-40c3-8264-4315e8af47f5	"Unclaimed Open Ports"	null	{"type": "DiscoveryWithMatch", "details": {"reason": {"data": ["Generic service", [{"data": "Has unbound open ports", "type": "reason"}]], "type": "container"}, "confidence": "NotApplicable"}, "metadata": [{"date": "2026-01-15T23:11:36.962405920Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	0
2a2ed6bc-c0b2-4cf9-9d53-fc387d560e9c	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:11:43.867185+00	2026-01-15 23:11:43.867185+00	Scanopy Server	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	"Scanopy Server"	null	{"type": "DiscoveryWithMatch", "details": {"reason": {"data": "Response for 172.25.0.1:60072/api/health contained \\"scanopy\\" in body", "type": "reason"}, "confidence": "High"}, "metadata": [{"date": "2026-01-15T23:11:43.867165147Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	0
0150d473-8e3b-4e83-bcd3-b1ca5aeed3a4	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:11:51.349092+00	2026-01-15 23:11:51.349092+00	Home Assistant	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	"Home Assistant"	null	{"type": "DiscoveryWithMatch", "details": {"reason": {"data": "Response for 172.25.0.1:8123/ contained \\"home assistant\\" in body", "type": "reason"}, "confidence": "High"}, "metadata": [{"date": "2026-01-15T23:11:51.349071625Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	1
7b65dd25-17d4-4103-9729-b680a59bc3b6	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:11:58.018101+00	2026-01-15 23:11:58.018101+00	SSH	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	"SSH"	null	{"type": "DiscoveryWithMatch", "details": {"reason": {"data": ["Generic service", [{"data": "Port 22/tcp is open", "type": "reason"}]], "type": "container"}, "confidence": "NotApplicable"}, "metadata": [{"date": "2026-01-15T23:11:58.018081019Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	2
03a8d101-23e7-4bd5-acd0-0f03c138373b	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:11:58.018478+00	2026-01-15 23:11:58.018478+00	Unclaimed Open Ports	1e4ecfb5-c7a0-4da6-aa96-23391dff955c	"Unclaimed Open Ports"	null	{"type": "DiscoveryWithMatch", "details": {"reason": {"data": ["Generic service", [{"data": "Has unbound open ports", "type": "reason"}]], "type": "container"}, "confidence": "NotApplicable"}, "metadata": [{"date": "2026-01-15T23:11:58.018470629Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}	3
\.


--
-- Data for Name: shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shares (id, topology_id, network_id, created_by, name, is_enabled, expires_at, password_hash, allowed_domains, options, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subnets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subnets (id, network_id, created_at, updated_at, cidr, name, description, subnet_type, source) FROM stdin;
adcf2baf-b0e8-4989-b5bc-8e56c0175e44	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:10:29.040756+00	2026-01-15 23:10:29.040756+00	"0.0.0.0/0"	Internet	This subnet uses the 0.0.0.0/0 CIDR as an organizational container for services running on the internet (e.g., public DNS servers, cloud services, etc.).	Internet	{"type": "System"}
8f3a4ec2-7e35-4e9b-b977-365f8c54767f	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:10:29.040761+00	2026-01-15 23:10:29.040761+00	"0.0.0.0/0"	Remote Network	This subnet uses the 0.0.0.0/0 CIDR as an organizational container for hosts on remote networks (e.g., mobile connections, friend's networks, public WiFi, etc.).	Remote	{"type": "System"}
855151ac-fcf5-4092-aee2-a91284a1c931	3e3bdb86-cfa2-47bd-8b82-d380874663b6	2026-01-15 23:10:29.225106+00	2026-01-15 23:10:29.225106+00	"172.25.0.0/28"	172.25.0.0/28	\N	Lan	{"type": "Discovery", "metadata": [{"date": "2026-01-15T23:10:29.225104456Z", "type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496"}]}
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, organization_id, name, description, created_at, updated_at, color) FROM stdin;
018c4d24-4ae9-47c4-89e2-b756b01a18f2	8bf13987-2ec3-4cfd-89f3-5bedbc73fa64	New Tag	\N	2026-01-15 23:12:28.450694+00	2026-01-15 23:12:28.450694+00	Yellow
\.


--
-- Data for Name: topologies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topologies (id, network_id, name, edges, nodes, options, hosts, subnets, services, groups, is_stale, last_refreshed, is_locked, locked_at, locked_by, removed_hosts, removed_services, removed_subnets, removed_groups, parent_id, created_at, updated_at, tags, interfaces, removed_interfaces, ports, removed_ports, bindings, removed_bindings) FROM stdin;
6060073e-b5d5-43c5-b8d9-9fb7db38fbb4	3e3bdb86-cfa2-47bd-8b82-d380874663b6	My Topology	[]	[]	{"local": {"no_fade_edges": false, "hide_edge_types": [], "left_zone_title": "Infrastructure", "hide_resize_handles": false}, "request": {"hide_ports": false, "hide_service_categories": [], "show_gateway_in_left_zone": true, "group_docker_bridges_by_host": true, "left_zone_service_categories": ["DNS", "ReverseProxy"], "hide_vm_title_on_docker_container": false}}	[{"id": "04565a18-a7dd-4906-bbf6-270194a74469", "name": "scanopy-daemon", "tags": [], "hidden": false, "source": {"type": "Discovery", "metadata": [{"date": "2026-01-15T23:10:29.246269265Z", "type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496"}]}, "hostname": "326068a7caa8", "created_at": "2026-01-15T23:10:29.200663Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:10:29.200663Z", "description": null, "virtualization": null}, {"id": "ced2a82d-de5a-4f59-9e2a-afd2c170b587", "name": "scanopy-postgres-dev-1.scanopy_scanopy-dev", "tags": [], "hidden": false, "source": {"type": "Discovery", "metadata": [{"date": "2026-01-15T23:10:50.864552795Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "hostname": "scanopy-postgres-dev-1.scanopy_scanopy-dev", "created_at": "2026-01-15T23:10:50.864553Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:10:50.864553Z", "description": null, "virtualization": null}, {"id": "5ec27aa2-c980-4dc5-82e8-79c1267e2356", "name": "scanopy-server-1.scanopy_scanopy-dev", "tags": [], "hidden": false, "source": {"type": "Discovery", "metadata": [{"date": "2026-01-15T23:11:06.342055193Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "hostname": "scanopy-server-1.scanopy_scanopy-dev", "created_at": "2026-01-15T23:11:06.342056Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:06.342056Z", "description": null, "virtualization": null}, {"id": "8001b3a4-eef7-40c3-8264-4315e8af47f5", "name": "homeassistant-discovery.scanopy_scanopy-dev", "tags": [], "hidden": false, "source": {"type": "Discovery", "metadata": [{"date": "2026-01-15T23:11:21.642532688Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "hostname": "homeassistant-discovery.scanopy_scanopy-dev", "created_at": "2026-01-15T23:11:21.642534Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:21.642534Z", "description": null, "virtualization": null}, {"id": "1e4ecfb5-c7a0-4da6-aa96-23391dff955c", "name": "runnervmmtnos", "tags": [], "hidden": false, "source": {"type": "Discovery", "metadata": [{"date": "2026-01-15T23:11:43.088519238Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "hostname": "runnervmmtnos", "created_at": "2026-01-15T23:11:43.088520Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:43.088520Z", "description": null, "virtualization": null}]	[{"id": "adcf2baf-b0e8-4989-b5bc-8e56c0175e44", "cidr": "0.0.0.0/0", "name": "Internet", "tags": [], "source": {"type": "System"}, "created_at": "2026-01-15T23:10:29.040756Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:10:29.040756Z", "description": "This subnet uses the 0.0.0.0/0 CIDR as an organizational container for services running on the internet (e.g., public DNS servers, cloud services, etc.).", "subnet_type": "Internet"}, {"id": "8f3a4ec2-7e35-4e9b-b977-365f8c54767f", "cidr": "0.0.0.0/0", "name": "Remote Network", "tags": [], "source": {"type": "System"}, "created_at": "2026-01-15T23:10:29.040761Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:10:29.040761Z", "description": "This subnet uses the 0.0.0.0/0 CIDR as an organizational container for hosts on remote networks (e.g., mobile connections, friend's networks, public WiFi, etc.).", "subnet_type": "Remote"}, {"id": "855151ac-fcf5-4092-aee2-a91284a1c931", "cidr": "172.25.0.0/28", "name": "172.25.0.0/28", "tags": [], "source": {"type": "Discovery", "metadata": [{"date": "2026-01-15T23:10:29.225104456Z", "type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496"}]}, "created_at": "2026-01-15T23:10:29.225106Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:10:29.225106Z", "description": null, "subnet_type": "Lan"}]	[{"id": "97c5df4f-eb0b-4a5c-85d5-bc15ed1e4e0e", "name": "Scanopy Daemon", "tags": [], "source": {"type": "DiscoveryWithMatch", "details": {"reason": {"data": "Scanopy Daemon self-report", "type": "reason"}, "confidence": "Certain"}, "metadata": [{"date": "2026-01-15T23:10:29.246288771Z", "type": "SelfReport", "host_id": "04565a18-a7dd-4906-bbf6-270194a74469", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496"}]}, "host_id": "04565a18-a7dd-4906-bbf6-270194a74469", "bindings": [{"id": "5c8e8ad7-b4e1-48fb-8668-d5bf1c5e7173", "type": "Port", "port_id": "7f87ec26-d0a0-4539-a372-372d2f5bef34", "created_at": "2026-01-15T23:10:29.246285Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "97c5df4f-eb0b-4a5c-85d5-bc15ed1e4e0e", "updated_at": "2026-01-15T23:10:29.246285Z", "interface_id": "e14d5018-8cf3-4a4e-9515-14b300d45b68"}], "position": 0, "created_at": "2026-01-15T23:10:29.246289Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:10:29.246289Z", "virtualization": null, "service_definition": "Scanopy Daemon"}, {"id": "362d42c7-98bc-4b73-91f4-a8900ae0b8ad", "name": "PostgreSQL", "tags": [], "source": {"type": "DiscoveryWithMatch", "details": {"reason": {"data": ["Generic service", [{"data": "Port 5432/tcp is open", "type": "reason"}]], "type": "container"}, "confidence": "NotApplicable"}, "metadata": [{"date": "2026-01-15T23:11:06.229798912Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "host_id": "ced2a82d-de5a-4f59-9e2a-afd2c170b587", "bindings": [{"id": "ec71e8a8-ebd6-4f27-9e9d-c0011daa7742", "type": "Port", "port_id": "de967853-c86c-4e28-a296-dfb24c7b42ba", "created_at": "2026-01-15T23:11:06.229814Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "362d42c7-98bc-4b73-91f4-a8900ae0b8ad", "updated_at": "2026-01-15T23:11:06.229814Z", "interface_id": "3c45db88-b362-425b-b58f-469cae877896"}], "position": 0, "created_at": "2026-01-15T23:11:06.229818Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:06.229818Z", "virtualization": null, "service_definition": "PostgreSQL"}, {"id": "bce8353b-7927-4593-bde0-731b3c6448f1", "name": "Scanopy Server", "tags": [], "source": {"type": "DiscoveryWithMatch", "details": {"reason": {"data": "Response for 172.25.0.3:60072/api/health contained \\"scanopy\\" in body", "type": "reason"}, "confidence": "High"}, "metadata": [{"date": "2026-01-15T23:11:07.189138525Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "host_id": "5ec27aa2-c980-4dc5-82e8-79c1267e2356", "bindings": [{"id": "917c9afc-6750-4dd4-a750-b97194eff8b7", "type": "Port", "port_id": "276985b6-7660-4640-9bb1-fd7ef6aa5dd9", "created_at": "2026-01-15T23:11:07.189156Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "bce8353b-7927-4593-bde0-731b3c6448f1", "updated_at": "2026-01-15T23:11:07.189156Z", "interface_id": "7186fe86-eac4-407a-b1b1-861ccf9b351d"}], "position": 0, "created_at": "2026-01-15T23:11:07.189160Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:07.189160Z", "virtualization": null, "service_definition": "Scanopy Server"}, {"id": "46588cab-545e-4415-abb1-af40b6de52a6", "name": "Unclaimed Open Ports", "tags": [], "source": {"type": "DiscoveryWithMatch", "details": {"reason": {"data": ["Generic service", [{"data": "Has unbound open ports", "type": "reason"}]], "type": "container"}, "confidence": "NotApplicable"}, "metadata": [{"date": "2026-01-15T23:11:36.962405920Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "host_id": "8001b3a4-eef7-40c3-8264-4315e8af47f5", "bindings": [{"id": "b144879d-a061-4064-8761-58dbcac56538", "type": "Port", "port_id": "05d3880d-578c-45fd-9866-78c68b797844", "created_at": "2026-01-15T23:11:36.962422Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "46588cab-545e-4415-abb1-af40b6de52a6", "updated_at": "2026-01-15T23:11:36.962422Z", "interface_id": "d8e83c86-78e9-4e91-bb42-0a85d368db5b"}, {"id": "5183e3f5-962d-4947-bb65-0ee40b1734fe", "type": "Port", "port_id": "c6de1b68-df0d-4d56-9553-0082e56fd9a1", "created_at": "2026-01-15T23:11:36.962424Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "46588cab-545e-4415-abb1-af40b6de52a6", "updated_at": "2026-01-15T23:11:36.962424Z", "interface_id": "d8e83c86-78e9-4e91-bb42-0a85d368db5b"}], "position": 0, "created_at": "2026-01-15T23:11:36.962427Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:36.962427Z", "virtualization": null, "service_definition": "Unclaimed Open Ports"}, {"id": "2a2ed6bc-c0b2-4cf9-9d53-fc387d560e9c", "name": "Scanopy Server", "tags": [], "source": {"type": "DiscoveryWithMatch", "details": {"reason": {"data": "Response for 172.25.0.1:60072/api/health contained \\"scanopy\\" in body", "type": "reason"}, "confidence": "High"}, "metadata": [{"date": "2026-01-15T23:11:43.867165147Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "host_id": "1e4ecfb5-c7a0-4da6-aa96-23391dff955c", "bindings": [{"id": "2eb74cc2-3f46-449a-ae8c-45dd6da7e537", "type": "Port", "port_id": "b4a204fc-abe4-441b-875c-b655a9f38b3e", "created_at": "2026-01-15T23:11:43.867182Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "2a2ed6bc-c0b2-4cf9-9d53-fc387d560e9c", "updated_at": "2026-01-15T23:11:43.867182Z", "interface_id": "04ed19a1-8f0b-4617-b28c-d1be9853aa5f"}], "position": 0, "created_at": "2026-01-15T23:11:43.867185Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:43.867185Z", "virtualization": null, "service_definition": "Scanopy Server"}, {"id": "0150d473-8e3b-4e83-bcd3-b1ca5aeed3a4", "name": "Home Assistant", "tags": [], "source": {"type": "DiscoveryWithMatch", "details": {"reason": {"data": "Response for 172.25.0.1:8123/ contained \\"home assistant\\" in body", "type": "reason"}, "confidence": "High"}, "metadata": [{"date": "2026-01-15T23:11:51.349071625Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "host_id": "1e4ecfb5-c7a0-4da6-aa96-23391dff955c", "bindings": [{"id": "40630768-6d36-4fd7-abb3-f0c472531d85", "type": "Port", "port_id": "e9d662a7-e872-453a-b7c1-1f11392f7e15", "created_at": "2026-01-15T23:11:51.349088Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "0150d473-8e3b-4e83-bcd3-b1ca5aeed3a4", "updated_at": "2026-01-15T23:11:51.349088Z", "interface_id": "04ed19a1-8f0b-4617-b28c-d1be9853aa5f"}], "position": 1, "created_at": "2026-01-15T23:11:51.349092Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:51.349092Z", "virtualization": null, "service_definition": "Home Assistant"}, {"id": "7b65dd25-17d4-4103-9729-b680a59bc3b6", "name": "SSH", "tags": [], "source": {"type": "DiscoveryWithMatch", "details": {"reason": {"data": ["Generic service", [{"data": "Port 22/tcp is open", "type": "reason"}]], "type": "container"}, "confidence": "NotApplicable"}, "metadata": [{"date": "2026-01-15T23:11:58.018081019Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "host_id": "1e4ecfb5-c7a0-4da6-aa96-23391dff955c", "bindings": [{"id": "d3760f5d-579b-4e83-9c87-3560a52d99c6", "type": "Port", "port_id": "52595cbc-0ee1-46b8-8aea-fa6b7e212209", "created_at": "2026-01-15T23:11:58.018096Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "7b65dd25-17d4-4103-9729-b680a59bc3b6", "updated_at": "2026-01-15T23:11:58.018096Z", "interface_id": "04ed19a1-8f0b-4617-b28c-d1be9853aa5f"}], "position": 2, "created_at": "2026-01-15T23:11:58.018101Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:58.018101Z", "virtualization": null, "service_definition": "SSH"}, {"id": "03a8d101-23e7-4bd5-acd0-0f03c138373b", "name": "Unclaimed Open Ports", "tags": [], "source": {"type": "DiscoveryWithMatch", "details": {"reason": {"data": ["Generic service", [{"data": "Has unbound open ports", "type": "reason"}]], "type": "container"}, "confidence": "NotApplicable"}, "metadata": [{"date": "2026-01-15T23:11:58.018470629Z", "type": "Network", "daemon_id": "316500c6-088a-4c75-816a-1fc3d772d496", "subnet_ids": null, "host_naming_fallback": "BestService"}]}, "host_id": "1e4ecfb5-c7a0-4da6-aa96-23391dff955c", "bindings": [{"id": "01f0272c-689f-4f99-b8e8-63aae2c2c0d4", "type": "Port", "port_id": "58643923-e96d-412a-8da1-6d07ac9ce6ac", "created_at": "2026-01-15T23:11:58.018476Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "service_id": "03a8d101-23e7-4bd5-acd0-0f03c138373b", "updated_at": "2026-01-15T23:11:58.018476Z", "interface_id": "04ed19a1-8f0b-4617-b28c-d1be9853aa5f"}], "position": 3, "created_at": "2026-01-15T23:11:58.018478Z", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:11:58.018478Z", "virtualization": null, "service_definition": "Unclaimed Open Ports"}]	[{"id": "80976cd9-2d05-4768-9f64-20c419387ebb", "name": "", "tags": [], "color": "Yellow", "source": {"type": "Manual"}, "created_at": "2026-01-15T23:12:28.441474Z", "edge_style": "SmoothStep", "group_type": "RequestPath", "network_id": "3e3bdb86-cfa2-47bd-8b82-d380874663b6", "updated_at": "2026-01-15T23:12:28.441474Z", "binding_ids": [], "description": null}]	t	2026-01-15 23:10:29.093709+00	f	\N	\N	{e030cbea-784e-44a4-974e-67b2da565ecf,b20c8e1c-e4ab-4c2a-8257-d1493f3fa3c3,be4e503e-54c9-4e08-a718-2a8f80c55301}	{e57aabe6-10ba-4cfc-bec8-4d1724919553}	{f8d2aa83-e484-45e3-b511-a7c56fc2ab74}	{d4d9c03e-aa2f-41ef-8d96-77b8fa63cbca}	\N	2026-01-15 23:10:29.044794+00	2026-01-15 23:10:29.044794+00	{}	[]	{}	[]	{}	[]	{}
\.


--
-- Data for Name: user_api_key_network_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_api_key_network_access (id, api_key_id, network_id, created_at) FROM stdin;
\.


--
-- Data for Name: user_api_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_api_keys (id, key, user_id, organization_id, permissions, name, created_at, updated_at, last_used, expires_at, is_enabled) FROM stdin;
\.


--
-- Data for Name: user_network_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_network_access (id, user_id, network_id, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, updated_at, password_hash, oidc_provider, oidc_subject, oidc_linked_at, email, organization_id, permissions, tags, terms_accepted_at, email_verified, email_verification_token, email_verification_expires, password_reset_token, password_reset_expires) FROM stdin;
c678fd83-ae33-41bf-af41-f70cc9b11959	2026-01-15 23:10:29.032607+00	2026-01-15 23:10:29.032607+00	$argon2id$v=19$m=19456,t=2,p=1$CVvoLnPt/DsaVZ+cX01R+g$cfhg3dFHz5XGpVOwKyiuoxMnDwjQrU2p2F78+qoMfWc	\N	\N	\N	user@gmail.com	8bf13987-2ec3-4cfd-89f3-5bedbc73fa64	Owner	{}	\N	t	\N	\N	\N	\N
df74c0a4-ad14-4ec5-b245-15c14c61eced	2026-01-15 23:12:29.877463+00	2026-01-15 23:12:29.877463+00	\N	\N	\N	\N	user@example.com	8bf13987-2ec3-4cfd-89f3-5bedbc73fa64	Owner	{}	\N	f	\N	\N	\N	\N
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: tower_sessions; Owner: postgres
--

COPY tower_sessions.session (id, data, expiry_date) FROM stdin;
mHatXniE_ORRuCpVrWD33A	\\x93c410dcf760ad552ab851e4fc84785ead769881a7757365725f6964d92463363738666438332d616533332d343162662d616634312d66373063633962313139353999cd07ea16170a1dce0e02ce88000000	2026-01-22 23:10:29.235064+00
tcvfDOZ7QWlbyMMpNdVWIQ	\\x93c4102156d53529c3c85b69417be60cdfcbb582ad70656e64696e675f736574757082a86e6574776f726b739182a46e616d65aa4d79204e6574776f726baa6e6574776f726b5f6964d92464373036663562392d353761322d346432642d616434322d323264616363633630376361a86f72675f6e616d65af4d79204f7267616e697a6174696f6ea7757365725f6964d92463363738666438332d616533332d343162662d616634312d66373063633962313139353999cd07ea16170c1dce01d92248000000	2026-01-22 23:12:29.031007+00
\.


--
-- Name: _sqlx_migrations _sqlx_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._sqlx_migrations
    ADD CONSTRAINT _sqlx_migrations_pkey PRIMARY KEY (version);


--
-- Name: api_keys api_keys_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_key_key UNIQUE (key);


--
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: bindings bindings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bindings
    ADD CONSTRAINT bindings_pkey PRIMARY KEY (id);


--
-- Name: daemons daemons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daemons
    ADD CONSTRAINT daemons_pkey PRIMARY KEY (id);


--
-- Name: discovery discovery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discovery
    ADD CONSTRAINT discovery_pkey PRIMARY KEY (id);


--
-- Name: entity_tags entity_tags_entity_id_entity_type_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_tags
    ADD CONSTRAINT entity_tags_entity_id_entity_type_tag_id_key UNIQUE (entity_id, entity_type, tag_id);


--
-- Name: entity_tags entity_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_tags
    ADD CONSTRAINT entity_tags_pkey PRIMARY KEY (id);


--
-- Name: group_bindings group_bindings_group_id_binding_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_bindings
    ADD CONSTRAINT group_bindings_group_id_binding_id_key UNIQUE (group_id, binding_id);


--
-- Name: group_bindings group_bindings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_bindings
    ADD CONSTRAINT group_bindings_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: hosts hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- Name: interfaces interfaces_host_id_subnet_id_ip_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interfaces
    ADD CONSTRAINT interfaces_host_id_subnet_id_ip_address_key UNIQUE (host_id, subnet_id, ip_address);


--
-- Name: interfaces interfaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interfaces
    ADD CONSTRAINT interfaces_pkey PRIMARY KEY (id);


--
-- Name: invites invites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: networks networks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.networks
    ADD CONSTRAINT networks_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: ports ports_host_id_port_number_protocol_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ports
    ADD CONSTRAINT ports_host_id_port_number_protocol_key UNIQUE (host_id, port_number, protocol);


--
-- Name: ports ports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ports
    ADD CONSTRAINT ports_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: shares shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT shares_pkey PRIMARY KEY (id);


--
-- Name: subnets subnets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subnets
    ADD CONSTRAINT subnets_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: topologies topologies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topologies
    ADD CONSTRAINT topologies_pkey PRIMARY KEY (id);


--
-- Name: user_api_key_network_access user_api_key_network_access_api_key_id_network_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_api_key_network_access
    ADD CONSTRAINT user_api_key_network_access_api_key_id_network_id_key UNIQUE (api_key_id, network_id);


--
-- Name: user_api_key_network_access user_api_key_network_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_api_key_network_access
    ADD CONSTRAINT user_api_key_network_access_pkey PRIMARY KEY (id);


--
-- Name: user_api_keys user_api_keys_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_api_keys
    ADD CONSTRAINT user_api_keys_key_key UNIQUE (key);


--
-- Name: user_api_keys user_api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_api_keys
    ADD CONSTRAINT user_api_keys_pkey PRIMARY KEY (id);


--
-- Name: user_network_access user_network_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_network_access
    ADD CONSTRAINT user_network_access_pkey PRIMARY KEY (id);


--
-- Name: user_network_access user_network_access_user_id_network_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_network_access
    ADD CONSTRAINT user_network_access_user_id_network_id_key UNIQUE (user_id, network_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: tower_sessions; Owner: postgres
--

ALTER TABLE ONLY tower_sessions.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: idx_api_keys_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_api_keys_key ON public.api_keys USING btree (key);


--
-- Name: idx_api_keys_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_api_keys_network ON public.api_keys USING btree (network_id);


--
-- Name: idx_bindings_interface; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bindings_interface ON public.bindings USING btree (interface_id);


--
-- Name: idx_bindings_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bindings_network ON public.bindings USING btree (network_id);


--
-- Name: idx_bindings_port; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bindings_port ON public.bindings USING btree (port_id);


--
-- Name: idx_bindings_service; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bindings_service ON public.bindings USING btree (service_id);


--
-- Name: idx_daemon_host_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_daemon_host_id ON public.daemons USING btree (host_id);


--
-- Name: idx_daemons_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_daemons_network ON public.daemons USING btree (network_id);


--
-- Name: idx_discovery_daemon; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_discovery_daemon ON public.discovery USING btree (daemon_id);


--
-- Name: idx_discovery_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_discovery_network ON public.discovery USING btree (network_id);


--
-- Name: idx_entity_tags_entity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_entity_tags_entity ON public.entity_tags USING btree (entity_id, entity_type);


--
-- Name: idx_entity_tags_tag_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_entity_tags_tag_id ON public.entity_tags USING btree (tag_id);


--
-- Name: idx_group_bindings_binding; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_bindings_binding ON public.group_bindings USING btree (binding_id);


--
-- Name: idx_group_bindings_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_bindings_group ON public.group_bindings USING btree (group_id);


--
-- Name: idx_groups_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_groups_network ON public.groups USING btree (network_id);


--
-- Name: idx_hosts_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_hosts_network ON public.hosts USING btree (network_id);


--
-- Name: idx_interfaces_host; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_interfaces_host ON public.interfaces USING btree (host_id);


--
-- Name: idx_interfaces_host_mac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_interfaces_host_mac ON public.interfaces USING btree (host_id, mac_address) WHERE (mac_address IS NOT NULL);


--
-- Name: idx_interfaces_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_interfaces_network ON public.interfaces USING btree (network_id);


--
-- Name: idx_interfaces_subnet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_interfaces_subnet ON public.interfaces USING btree (subnet_id);


--
-- Name: idx_invites_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_invites_expires_at ON public.invites USING btree (expires_at);


--
-- Name: idx_invites_organization; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_invites_organization ON public.invites USING btree (organization_id);


--
-- Name: idx_networks_owner_organization; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_networks_owner_organization ON public.networks USING btree (organization_id);


--
-- Name: idx_organizations_stripe_customer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_organizations_stripe_customer ON public.organizations USING btree (stripe_customer_id);


--
-- Name: idx_ports_host; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ports_host ON public.ports USING btree (host_id);


--
-- Name: idx_ports_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ports_network ON public.ports USING btree (network_id);


--
-- Name: idx_ports_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ports_number ON public.ports USING btree (port_number);


--
-- Name: idx_services_host_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_services_host_id ON public.services USING btree (host_id);


--
-- Name: idx_services_host_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_services_host_position ON public.services USING btree (host_id, "position");


--
-- Name: idx_services_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_services_network ON public.services USING btree (network_id);


--
-- Name: idx_shares_enabled; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shares_enabled ON public.shares USING btree (is_enabled) WHERE (is_enabled = true);


--
-- Name: idx_shares_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shares_network ON public.shares USING btree (network_id);


--
-- Name: idx_shares_topology; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shares_topology ON public.shares USING btree (topology_id);


--
-- Name: idx_subnets_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_subnets_network ON public.subnets USING btree (network_id);


--
-- Name: idx_tags_org_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_tags_org_name ON public.tags USING btree (organization_id, name);


--
-- Name: idx_tags_organization; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tags_organization ON public.tags USING btree (organization_id);


--
-- Name: idx_topologies_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_topologies_network ON public.topologies USING btree (network_id);


--
-- Name: idx_user_api_key_network_access_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_api_key_network_access_key ON public.user_api_key_network_access USING btree (api_key_id);


--
-- Name: idx_user_api_key_network_access_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_api_key_network_access_network ON public.user_api_key_network_access USING btree (network_id);


--
-- Name: idx_user_api_keys_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_api_keys_key ON public.user_api_keys USING btree (key);


--
-- Name: idx_user_api_keys_org; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_api_keys_org ON public.user_api_keys USING btree (organization_id);


--
-- Name: idx_user_api_keys_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_api_keys_user ON public.user_api_keys USING btree (user_id);


--
-- Name: idx_user_network_access_network; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_network_access_network ON public.user_network_access USING btree (network_id);


--
-- Name: idx_user_network_access_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_network_access_user ON public.user_network_access USING btree (user_id);


--
-- Name: idx_users_email_lower; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_users_email_lower ON public.users USING btree (lower(email));


--
-- Name: idx_users_email_verification_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_email_verification_token ON public.users USING btree (email_verification_token) WHERE (email_verification_token IS NOT NULL);


--
-- Name: idx_users_oidc_provider_subject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_users_oidc_provider_subject ON public.users USING btree (oidc_provider, oidc_subject) WHERE ((oidc_provider IS NOT NULL) AND (oidc_subject IS NOT NULL));


--
-- Name: idx_users_organization; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_organization ON public.users USING btree (organization_id);


--
-- Name: idx_users_password_reset_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_password_reset_token ON public.users USING btree (password_reset_token) WHERE (password_reset_token IS NOT NULL);


--
-- Name: users reassign_daemons_before_user_delete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER reassign_daemons_before_user_delete BEFORE DELETE ON public.users FOR EACH ROW EXECUTE FUNCTION public.reassign_daemons_on_user_delete();


--
-- Name: api_keys api_keys_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: bindings bindings_interface_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bindings
    ADD CONSTRAINT bindings_interface_id_fkey FOREIGN KEY (interface_id) REFERENCES public.interfaces(id) ON DELETE CASCADE;


--
-- Name: bindings bindings_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bindings
    ADD CONSTRAINT bindings_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: bindings bindings_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bindings
    ADD CONSTRAINT bindings_port_id_fkey FOREIGN KEY (port_id) REFERENCES public.ports(id) ON DELETE CASCADE;


--
-- Name: bindings bindings_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bindings
    ADD CONSTRAINT bindings_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: daemons daemons_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daemons
    ADD CONSTRAINT daemons_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: daemons daemons_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.daemons
    ADD CONSTRAINT daemons_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: discovery discovery_daemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discovery
    ADD CONSTRAINT discovery_daemon_id_fkey FOREIGN KEY (daemon_id) REFERENCES public.daemons(id) ON DELETE CASCADE;


--
-- Name: discovery discovery_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discovery
    ADD CONSTRAINT discovery_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: entity_tags entity_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entity_tags
    ADD CONSTRAINT entity_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: group_bindings group_bindings_binding_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_bindings
    ADD CONSTRAINT group_bindings_binding_id_fkey FOREIGN KEY (binding_id) REFERENCES public.bindings(id) ON DELETE CASCADE;


--
-- Name: group_bindings group_bindings_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_bindings
    ADD CONSTRAINT group_bindings_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- Name: groups groups_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: hosts hosts_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: interfaces interfaces_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interfaces
    ADD CONSTRAINT interfaces_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.hosts(id) ON DELETE CASCADE;


--
-- Name: interfaces interfaces_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interfaces
    ADD CONSTRAINT interfaces_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: interfaces interfaces_subnet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interfaces
    ADD CONSTRAINT interfaces_subnet_id_fkey FOREIGN KEY (subnet_id) REFERENCES public.subnets(id) ON DELETE CASCADE;


--
-- Name: invites invites_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invites
    ADD CONSTRAINT invites_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: invites invites_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invites
    ADD CONSTRAINT invites_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: networks organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.networks
    ADD CONSTRAINT organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: ports ports_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ports
    ADD CONSTRAINT ports_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.hosts(id) ON DELETE CASCADE;


--
-- Name: ports ports_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ports
    ADD CONSTRAINT ports_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: services services_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.hosts(id) ON DELETE CASCADE;


--
-- Name: services services_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: shares shares_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT shares_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: shares shares_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT shares_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: shares shares_topology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT shares_topology_id_fkey FOREIGN KEY (topology_id) REFERENCES public.topologies(id) ON DELETE CASCADE;


--
-- Name: subnets subnets_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subnets
    ADD CONSTRAINT subnets_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: tags tags_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: topologies topologies_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topologies
    ADD CONSTRAINT topologies_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: user_api_key_network_access user_api_key_network_access_api_key_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_api_key_network_access
    ADD CONSTRAINT user_api_key_network_access_api_key_id_fkey FOREIGN KEY (api_key_id) REFERENCES public.user_api_keys(id) ON DELETE CASCADE;


--
-- Name: user_api_key_network_access user_api_key_network_access_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_api_key_network_access
    ADD CONSTRAINT user_api_key_network_access_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: user_api_keys user_api_keys_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_api_keys
    ADD CONSTRAINT user_api_keys_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: user_api_keys user_api_keys_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_api_keys
    ADD CONSTRAINT user_api_keys_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_network_access user_network_access_network_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_network_access
    ADD CONSTRAINT user_network_access_network_id_fkey FOREIGN KEY (network_id) REFERENCES public.networks(id) ON DELETE CASCADE;


--
-- Name: user_network_access user_network_access_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_network_access
    ADD CONSTRAINT user_network_access_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict KbQWSDCLtZpy0fx173CtOKMY7yfqvJ1Kat77YXnv6xGjx8C665OwwuNVMYQdIOL

