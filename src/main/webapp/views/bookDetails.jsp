<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${book.title} | StoryNest</title>
    <style>
        :root {
            --primary: #daedff;
            --bg: #0f172a;
            --bg-main: #010d29; 
            --dark: #0f172a;
        }

        body {
            font-family: 'Segoe UI', Roboto, sans-serif;
            background-color: #fdfdfd;
            margin: 0;
            color: var(--dark);
            background: var(--bg);
        }

        nav {
            padding: 20px 5%;
            background: var(--bg);
            box-shadow: 0 2px 10px rgba(153, 153, 153, 0.05);
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
        .book-sidebar {
            flex: 0 0 320px;
        }

       

  .hero-image img {
    max-width: 100%;
    border-radius: 15px;
    /* Keeping your signature shadow */
    box-shadow: 20px 20px 0px var(--primary);
    
    /* 'linear' makes it a constant, steady clock-like spin */
    /* '10s' is the speed; increase for slower, decrease for faster */
    animation: clockSpin 10s linear infinite;
    
    /* This ensures the rotation happens from the exact center */
    transform-origin: center center;
}

@keyframes clockSpin {
    from {
        transform: rotate(0deg);
    }
    to {
        transform: rotate(360deg);
    }
}

       .book-content {
    flex: 1;
    padding-left: 20px; 
}
        .badge {
            background: var(--primary);
            color: var(--bg);
            padding: 6px 16px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 700;
            display: inline-block;
            margin-bottom: 15px;
        }

        h1 {
            font-size: 1.5rem;
            margin: 0 0 10px 0;
            color:var(--primary);
        }

        .author {
            font-size: 1.25rem;
            color: var(--primary);
            margin-bottom: 10px;
        }

        .synopsis-box {
            margin: 20px 0;
        }

        .synopsis-box h3 {
            color: var(--primary);
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }

        .synopsis-box p {
            line-height: 1.8;
            font-size: 1.1rem;
            color: var(--primary);
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
            color: var(--primary);
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
            color: #2d4d6b;
            font-style: italic;
            padding: 20px 0;
        }

      .hero-image {
    flex: 0 0 350px; /* Forces the image column to stay at 350px width */
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding-top: 20px;
}

      .hero-image img {
        width: 80%; 
        height: auto;
        border-radius: 15px;
        box-shadow: 20px 20px 0px var(--primary);
        animation: clockSpin 10s linear infinite;
        transform-origin: center center;
    }
    </style>
</head>
<body>

    <nav>
        <a href="home" class="back-btn">← Back to Library</a>
    </nav>

    <div class="container">
        <div class="hero-image">
            <img src="${book.coverImageUrl}" alt="${book.title}" 
                onerror="this.src='https://via.placeholder.com/320x450?text=No+Cover'">
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