-- 1 Consultas para insertar, modificar y eliminar un Customer, Staff y Actor:

-- Insertar un Customer
INSERT INTO public.customer (store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', 1, true, NOW(), NOW(), 1);

-- Modificar un Customer
UPDATE public.customer
SET first_name = 'Jane'
WHERE customer_id = 1;

-- Eliminar un Customer
DELETE FROM public.customer
WHERE customer_id = 1;

--insertar un Staff
INSERT INTO public.staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture)
VALUES ('John', 'Doe', 1, 'johndoe@example.com', 1, true, 'johndoe', 'password123', NOW(), null);

--Modificar un Staff
UPDATE public.staff
SET first_name = 'Jane'
WHERE staff_id = 1;

-- Eliminar un Staff
DELETE FROM public.staff
WHERE staff_id = 1;

--Insertar un Actor
INSERT INTO public.actor (first_name, last_name, last_update)
VALUES ('John', 'Doe', NOW());

--Modificar un Actor
UPDATE public.actor
SET first_name = 'Jane'
WHERE actor_id = 1;

-- Eliminar un Actor
DELETE FROM public.actor
WHERE actor_id = 1;

-- 2 Listar todas las "rental" con los datos del "customer" dado un año y mes:
SELECT rental.rental_id, rental.rental_date, rental.return_date, customer.*
FROM public.rental
JOIN public.customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2023
  AND EXTRACT(MONTH FROM rental.rental_date) = 6;


  
-- 3 Listar Número, Fecha (payment_date) y Total (amount) de todas las "payment":
SELECT payment_id, payment_date, amount
FROM public.payment;

-- 4 Listar todas las "film" del año 2006 que contengan un "rental_rate" mayor a 4.0:
SELECT *
FROM public.film
WHERE release_year = 2006
  AND rental_rate > 4.0;


