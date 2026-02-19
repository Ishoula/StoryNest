<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>StoryNest | Your Library</title>
    <style>
        :root { --primary: #27ae60; --dark: #2c3e50; --bg: #f8f9fa; }
        body { font-family: 'Segoe UI', sans-serif; background: var(--bg); margin: 0; }
        
        /* Navigation */
        nav { background: white; padding: 1rem 5%; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .logo { font-size: 1.5rem; font-weight: bold; color: var(--primary); text-decoration: none; }
        .user-menu a { margin-left: 15px; text-decoration: none; color: var(--dark); font-weight: 500; }

        .container { max-width: 1200px; margin: 2rem auto; padding: 0 20px; }
        
        /* Book Grid */
        .section-title { margin-bottom: 1.5rem; border-left: 5px solid var(--primary); padding-left: 15px; }
        .book-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 25px; }
        
        .book-card { background: white; border-radius: 10px; overflow: hidden; transition: transform 0.3s; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .book-card:hover { transform: translateY(-5px); }
        .book-cover { width: 100%; height: 280px; object-fit: cover; }
        .book-info { padding: 15px; }
        .book-title { font-size: 1.1rem; margin: 0; color: var(--dark); }
        .author-name { color: #7f8c8d; font-size: 0.9rem; margin: 5px 0; }
        
        .btn-read { display: block; text-align: center; background: var(--primary); color: white; padding: 10px; text-decoration: none; border-radius: 5px; margin-top: 10px; }
    </style>
</head>
<body>

<nav>
    <a href="home" class="logo">StoryNest</a>
    <div class="user-menu">
        <span>Welcome, <strong>${currentUser.username}</strong></span>
        <a href="profile">Profile</a>
        <a href="logout" style="color: #e74c3c;">Logout</a>
    </div>
</nav>

<div class="container">
    
    <c:if test="${not empty userProgress}">
        <h2 class="section-title">Continue Reading</h2>
        <div class="book-grid">
            <c:forEach var="item" items="${userProgress}">
                <div class="book-card">
                    <img src="${item.bookCover}" class="book-cover">
                    <div class="book-info">
                        <h3 class="book-title">${item.bookTitle}</h3>
                        <p class="author-name">Progress: ${item.scrollPosition}%</p>
                        <a href="reader?id=${item.bookId}" class="btn-read">Resume</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <hr style="margin: 3rem 0; opacity: 0.1;">
    </c:if>
    
    

    <h2 class="section-title">Explore Stories</h2>
    <div class="book-grid">
        <c:forEach var="book" items="${bookList}">
            <div class="book-card">
                <img src="${book.coverImageUrl}" class="book-cover" onerror="this.src='https://via.placeholder.com/200x280?text=No+Cover'">
                <div class="book-info">
                    <h3 class="book-title">${book.title}</h3>
                    <p class="author-name">By ${book.authorName}</p>
                    <a href="bookDetails?id=${book.bookId}" class="btn-read" style="background: #34495e;">Start Reading</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>