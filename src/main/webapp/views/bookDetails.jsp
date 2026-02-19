<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${book.title} | StoryNest</title>
    <style>
        :root {
            --primary: #27ae60;
            --dark: #2c3e50;
            --light-gray: #f8f9fa;
            --text-muted: #7f8c8d;
        }

        body {
            font-family: 'Segoe UI', Roboto, sans-serif;
            background-color: #fdfdfd;
            margin: 0;
            color: var(--dark);
        }

        /* Navigation */
        nav {
            padding: 20px 5%;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .back-btn {
            text-decoration: none;
            color: var(--primary);
            font-weight: 600;
            display: inline-flex;
            align-items: center;
        }

        .container {
            max-width: 1100px;
            margin: 60px auto;
            display: flex;
            gap: 60px;
            padding: 0 30px;
        }

        /* --- Bouncing Image Logic --- */
        .book-sidebar {
            flex: 0 0 320px;
        }

        .cover-wrapper {
            width: 100%;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
            /* This triggers the animation */
            animation: bounce 3s ease-in-out infinite;
        }

        .cover-wrapper img {
            width: 100%;
            display: block;
            transition: transform 0.3s ease;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }
        /* ---------------------------- */

        .book-content {
            flex: 1;
        }

        .badge {
            background: #eafaf1;
            color: var(--primary);
            padding: 6px 16px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 700;
            display: inline-block;
            margin-bottom: 15px;
        }

        h1 {
            font-size: 3rem;
            margin: 0 0 10px 0;
            color: #1a252f;
        }

        .author {
            font-size: 1.25rem;
            color: var(--text-muted);
            margin-bottom: 30px;
        }

        .synopsis-box {
            margin: 40px 0;
        }

        .synopsis-box h3 {
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }

        .synopsis-box p {
            line-height: 1.8;
            font-size: 1.1rem;
            color: #444;
        }

        /* Table of Contents Styling */
        .toc-card {
            background: #f1f3f5;
            border-radius: 12px;
            padding: 30px;
            margin-top: 30px;
        }

        .toc-header {
            font-weight: 700;
            font-size: 1.2rem;
            margin-bottom: 20px;
            display: block;
        }

        .chapter-link {
            display: flex;
            justify-content: space-between;
            padding: 15px;
            background: white;
            margin-bottom: 10px;
            border-radius: 8px;
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            transition: all 0.2s;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
        }

        .chapter-link:hover {
            transform: scale(1.01);
            color: var(--primary);
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .empty-state {
            color: #95a5a6;
            font-style: italic;
            padding: 20px 0;
        }
    </style>
</head>
<body>

    <nav>
        <a href="${pageContext.request.contextPath}/home" class="back-btn">← Back to Library</a>
    </nav>

    <div class="container">
        <div class="book-sidebar">
            <div class="cover-wrapper">
                <img src="${book.coverImageUrl}" alt="${book.title}" 
                     onerror="this.src='https://via.placeholder.com/320x450?text=No+Cover'">
            </div>
        </div>

        <div class="book-content">
            <span class="badge">${book.category}</span>
            <h1>${book.title}</h1>
            <p class="author">By <strong>${book.authorName}</strong></p>

            <div class="synopsis-box">
                <h3>Synopsis</h3>
                <p>${book.description}</p>
            </div>

            <div class="toc-card">
                <span class="toc-header">Table of Contents</span>
                
                <c:choose>
                    <c:when test="${not empty chapters}">
                        <c:forEach var="chap" items="${chapters}">
                            <a href="${pageContext.request.contextPath}/reader?chapterId=${chap.chapterId}" class="chapter-link">
                                <span>Chapter ${chap.chapterOrder}: ${chap.title}</span>
                                <span>▶</span>
                            </a>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            Coming soon: This story doesn't have chapters yet.
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

</body>
</html>