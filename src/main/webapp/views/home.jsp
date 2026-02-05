<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>StoryNest | Your Digital Bookshelf</title>
    <style>
        /* Base Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f4f7f6;
            color: #333;
            line-height: 1.6;
        }

        /* Navigation */
        nav {
            background: #2c3e50;
            color: white;
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        nav .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ecf0f1;
            text-decoration: none;
        }

        nav ul {
            display: flex;
            list-style: none;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            color: #bdc3c7;
            text-decoration: none;
            transition: 0.3s;
        }

        nav ul li a:hover {
            color: white;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding: 0 20px;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        /* Search Form Section */
        .search-container {
            background: white;
            padding: 30px;
            width: 80%;
            max-width: 800px;
            margin: -50px auto 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .search-form {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .search-form input, .search-form select {
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            flex: 1;
            min-width: 150px;
        }

        .search-form button {
            padding: 12px 25px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .search-form button:hover {
            background-color: #219150;
        }

        /* Content Sections */
        .section-title {
            width: 80%;
            margin: 20px auto;
            font-size: 1.5rem;
            color: #2c3e50;
            border-left: 5px solid #27ae60;
            padding-left: 15px;
        }

        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 25px;
            width: 80%;
            margin: 0 auto 50px;
        }

        .book-card {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }

        .book-card:hover {
            transform: translateY(-5px);
        }

        .book-card img {
            width: 100%;
            height: 280px;
            object-fit: cover;
        }

        .book-info {
            padding: 15px;
        }

        .book-title {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .progress-bar-bg {
            background: #eee;
            height: 8px;
            border-radius: 4px;
            margin-top: 10px;
        }

        .progress-bar-fill {
            background: #27ae60;
            height: 100%;
            border-radius: 4px;
        }

        footer {
            text-align: center;
            padding: 40px;
            background: #2c3e50;
            color: #bdc3c7;
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <nav>
        <a href="#" class="logo">StoryNest</a>
        <ul>
            <li><a href="#">My Library</a></li>
            <li><a href="#">Browse</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </nav>

    <div class="hero">
        <h1>Welcome back, Reader</h1>
        <p>Pick up exactly where you left off.</p>
    </div>

    <div class="search-container">
        <form action="searchBooks.jsp" method="GET" class="search-form">
            <input type="text" name="query" placeholder="Search by title or author...">
            
            <select name="genre">
                <option value="">All Genres</option>
                <option value="fantasy">Fantasy</option>
                <option value="sci-fi">Sci-Fi</option>
                <option value="mystery">Mystery</option>
            </select>

            <select name="length">
                <option value="">Any Length</option>
                <option value="short">Short (&lt; 20k words)</option>
                <option value="medium">Medium (20k-70k)</option>
                <option value="long">Long (70k+)</option>
            </select>

            <button type="submit">Search</button>
        </form>
    </div>

    <h2 class="section-title">Continue Reading</h2>
    <div class="book-grid">
        <div class="book-card">
            <img src="https://via.placeholder.com/200x280?text=Great+Gatsby" alt="Book Cover">
            <div class="book-info">
                <span class="book-title">The Great Gatsby</span>
                <small>Chapter 4</small>
                <div class="progress-bar-bg">
                    <div class="progress-bar-fill" style="width: 45%;"></div>
                </div>
            </div>
        </div>

        <div class="book-card">
            <img src="https://via.placeholder.com/200x280?text=1984" alt="Book Cover">
            <div class="book-info">
                <span class="book-title">1984</span>
                <small>Chapter 12</small>
                <div class="progress-bar-bg">
                    <div class="progress-bar-fill" style="width: 80%;"></div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 StoryNest Reading Platform. All rights reserved.</p>
    </footer>

</body>
</html>