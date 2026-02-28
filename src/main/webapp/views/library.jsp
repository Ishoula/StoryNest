<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>StoryNest | My Library</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #daedff;
            --dark: #2c3e50;
            --bg: #0f172a;
        }

        .marquee-book-card {
            flex: 0 0 220px;
            margin: 0 25px;
            background: var(--primary);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 15px;
            transition: transform 0.3s ease, background 0.3s ease;
            text-align: center;
        }

        .marquee-book-card:hover {
            transform: scale(1.05);
        }

        .marquee-cover-wrapper img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .marquee-book-info h4 {
            color: var(--bg);
            margin: 15px 0 5px;
            font-size: 1rem;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .marquee-book-info span {
            color: #243f64;
            font-size: 0.85rem;
        }

        .view-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 5px 15px;
            background: var(--bg);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 0.8rem;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: var(--bg);
            margin: 0;
        }

        /* Navigation (aligned with home.jsp) */
        nav {
            background: #0f172a;
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--primary);
            text-decoration: none;
        }
        .user-menu a {
            margin-left: 15px;
            text-decoration: none;
            color: var(--primary);
            font-weight: 500;
        }

        .container {
            max-width: 100%;
            margin: 2rem auto;
            padding: 0 20px;
        }

        .section-title {
            font-size: 1.6rem;
            color: #fff;
            margin: 0 0 1.5rem;
        }

        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
        }

        .book-card {
            background: var(--primary);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            display: flex;
            flex-direction: column;
        }

        .book-cover {
            width: 100%;
            height: 280px;
            object-fit: cover;
            background: #e5e7eb;
        }

        .book-info {
            padding: 14px 16px 18px;
        }

        .book-title {
            margin: 0 0 6px;
            font-size: 1.05rem;
            color: var(--dark);
        }

        .meta {
            margin: 0 0 8px;
            color: #104a81;
            font-size: 0.9rem;
        }

        .btn-read {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 8px;
            text-decoration: none;
            background: var(--bg);
            color: white;
            font-weight: 700;
            font-size: 0.9rem;
        }

        .empty-state {
            color: #e5e7eb;
            font-style: italic;
            margin-top: 2rem;
        }
    </style>
</head>
<body>

<nav>
    <a href="${pageContext.request.contextPath}/" class="logo">StoryNest</a>
    <div class="user-menu">
        <a href="${pageContext.request.contextPath}/views/library"><i class="fas fa-book"></i></a>
        <a href="${pageContext.request.contextPath}/views/profile"><i class="fas fa-user"></i></a>
        <a href="${pageContext.request.contextPath}/views/logout" style="color: #b66e03;">
            <i class="fas fa-sign-out-alt"></i>
        </a>
    </div>
</nav>

<div class="container">
    <h2 class="section-title">Your Shelf</h2>

    <c:choose>
        <c:when test="${empty userLibrary}">
            <div class="empty-state">
                You haven't added any books to your library yet.
            </div>
        </c:when>
        <c:otherwise>
            <div class="book-grid">
                <c:forEach var="item" items="${userLibrary}">
                    <div class="marquee-book-card">
                        <div class="marquee-cover-wrapper">
                            <img src="${item.bookCover}"
                                 alt="${item.bookTitle}"
                                 onerror="this.src='https://via.placeholder.com/200x280?text=No+Cover'">
                        </div>
                        <div class="marquee-book-info">
                            <h4>${item.bookTitle}</h4>
                            <span>Progress: ${item.scrollPosition}%</span>
                            <a href="${pageContext.request.contextPath}/views/reader?id=${item.bookId}"
                               class="view-btn">
                                Resume
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>