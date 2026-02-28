<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${chapter.title} | StoryNest</title>
    <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,700;1,400&family=Inter:wght@400;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #22c55e;
            --glass-border: rgba(255, 255, 255, 0.1);
            /* Default Dark Theme */
            --bg-color: #0f172a;
            --text-color: #e2e8f0;
            --meta-color: #94a3b8;
            --card-bg: rgba(30, 41, 59, 0.8);
        }

        /* Theme Variants */
        body.light-mode {
            --bg-color: #ffffff;
            --text-color: #1a1a1a;
            --meta-color: #64748b;
            --card-bg: rgba(241, 245, 249, 0.9);
            --glass-border: rgba(0, 0, 0, 0.1);
        }

        body.sepia-mode {
            --bg-color: #f4ecd8;
            --text-color: #5b4636;
            --meta-color: #8c786a;
            --card-bg: rgba(234, 224, 200, 0.9);
            --glass-border: rgba(91, 70, 54, 0.1);
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            transition: background 0.4s ease, color 0.4s ease;
            font-family: 'Inter', sans-serif;
        }

        /* --- Header / Settings --- */
        .reader-header {
            position: fixed;
            top: 0;
            width: 100%;
            padding: 15px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--glass-border);
            z-index: 100;
            box-sizing: border-box;
        }

        .back-link {
            text-decoration: none;
            color: var(--primary);
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .theme-switcher button {
            background: none;
            border: 1px solid var(--glass-border);
            color: var(--text-color);
            padding: 5px 12px;
            border-radius: 6px;
            cursor: pointer;
            margin-left: 5px;
            font-size: 0.8rem;
        }

        /* --- Reading Content --- */
        .reader-frame {
            max-width: 750px;
            margin: 0 auto;
            padding: 120px 25px 150px; /* Space for fixed header/footer */
        }

        .chapter-meta {
            text-align: center;
            margin-bottom: 60px;
        }

        .chapter-meta h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .chapter-meta span {
            color: var(--primary);
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 0.9rem;
            font-weight: 700;
        }

        .chapter-body {
            font-family: 'Lora', serif; /* Serif is king for long-form reading */
            font-size: 1.25rem;
            line-height: 2;
            letter-spacing: 0.01rem;
            text-align: justify;
        }

        .chapter-body p {
            margin-bottom: 2rem;
        }

        /* --- Floating Navigation --- */
        .reader-nav {
            position: fixed;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            background: var(--card-bg);
            backdrop-filter: blur(12px);
            padding: 12px 30px;
            border-radius: 50px;
            border: 1px solid var(--glass-border);
            display: flex;
            align-items: center;
            gap: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            z-index: 100;
        }

        .nav-link {
            color: var(--text-color);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: color 0.3s;
        }

        .nav-link:hover { color: var(--primary); }

        .nav-link.disabled {
            color: var(--meta-color);
            pointer-events: none;
            opacity: 0.3;
        }

        .order-indicator {
            color: var(--meta-color);
            font-size: 0.8rem;
            font-weight: 700;
            border-left: 1px solid var(--glass-border);
            border-right: 1px solid var(--glass-border);
            padding: 0 15px;
        }

        /* Progress Bar at the very top */
        #progress-bar {
            position: fixed;
            top: 0;
            left: 0;
            height: 4px;
            background: var(--primary);
            width: 0%;
            z-index: 101;
            transition: width 0.1s;
        }
    </style>
</head>
<body class="dark-mode">


    <div id="progress-bar"></div>

    <header class="reader-header">
        <a href="${pageContext.request.contextPath}/views/bookDetails?id=${chapter.bookId}" class="back-link">
            ← Library
        </a>

        <div class="theme-switcher">
            <button onclick="setTheme('light-mode')">Light</button>
            <button onclick="setTheme('sepia-mode')">Sepia</button>
            <button onclick="setTheme('dark-mode')">Dark</button>
        </div>
    </header>

    <div class="reader-frame">
        <div class="chapter-meta">
            <span>Chapter ${chapter.chapterSequence}</span>
            <h1>${chapter.title}</h1>
        </div>

        <div class="chapter-body">
            <%-- The content is rendered here. Ensure your DB content has <p> tags for best look --%>
            ${chapter.contentText}
        </div>
    </div>


    <nav class="reader-nav">
        <c:choose>
            <c:when test="${hasPrev}">
                <a href="${pageContext.request.contextPath}/views/reader?bookId=${chapter.bookId}&order=${chapter.chapterSequence - 1}" class="nav-link">Previous</a>
            </c:when>
            <c:otherwise>
                <span class="nav-link disabled">Previous</span>
            </c:otherwise>
        </c:choose>

        <div class="order-indicator">
            ${chapter.chapterSequence}
        </div>

        <c:choose>
            <c:when test="${hasNext}">
                <a href="${pageContext.request.contextPath}/views/reader?bookId=${chapter.bookId}&order=${chapter.chapterSequence + 1}" class="nav-link">Next Chapter</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/views/home" class="nav-link" style="color: var(--primary)">Finish Book</a>
            </c:otherwise>
        </c:choose>
    </nav>


    <script>
        // Theme Switching Logic
        function setTheme(theme) {
            document.body.className = theme;
            localStorage.setItem('storynest-theme', theme);
        }

        // Remember user's theme preference
        const savedTheme = localStorage.getItem('storynest-theme');
        if (savedTheme) {
            document.body.className = savedTheme;
        }

        // Reading Progress Logic
        window.onscroll = function() {
            let winScroll = document.body.scrollTop || document.documentElement.scrollTop;
            let height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            let scrolled = (winScroll / height) * 100;
            document.getElementById("progress-bar").style.width = scrolled + "%";
        };
        // Save progress when the user leaves the page
            window.addEventListener('beforeunload', function () {
                const scrollPercent = (window.scrollY / (document.documentElement.scrollHeight - window.innerHeight)) * 100;
                const bookId = "${chapter.book.bookId}";
                const order = "${chapter.chapterSequence}";

                // Use Beacon API to send data even if page is closing
                const url = `${pageContext.request.contextPath}/updateProgress?bookId=${bookId}&order=${order}&pos=${scrollPercent}`;
                navigator.sendBeacon(url);
            });
    </script>
</body>
</html>