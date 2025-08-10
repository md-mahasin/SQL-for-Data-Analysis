# SQL-for-Data-Analysis
Ecommerce_SQL_Database — README
Project: Ecommerce_SQL_Database
Purpose: Provide a self-contained PostgreSQL demo e-commerce database with ~100 orders and supporting demo data, plus example queries that demonstrate SELECT/WHERE/ORDER BY/GROUP BY, INNER/LEFT/RIGHT JOIN, subqueries, aggregates (SUM, AVG), views, and index-based query optimization.
Author: (md mahasin) — update as needed

What this project contains
ecommercedb — single self-contained SQL script that:

Creates tables: customers, suppliers, categories, products, orders, order_items, reviews.
Inserts demo data (25 customers, 10 suppliers, 5 categories, 20 products, 100 orders, ~250 order_items, ~50 reviews) using generate_series() for realistic variety.
Creates analytic views: customer_lifetime_summary, product_sales_summary.
Creates indexes to optimize common queries.
Provides many example SQL queries demonstrating joins, subqueries, aggregates, window functions, and EXPLAIN comments.
