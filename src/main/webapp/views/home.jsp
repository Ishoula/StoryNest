<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>StoryNest | Your Library</title>
    <style>
        :root {
             --primary: #daedff; 
             --dark: #2c3e50; 
             --bg: #0f172a;
             
            }
        body { 
            font-family: 'Segoe UI', 
            sans-serif; 
            background: var(--bg); 
            margin: 0; }

        /* Navigation */
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

        .user-menu span{
            color: var(--primary);

        }

        .container {
            max-width: 100%;
            margin: 2rem auto;
            padding: 0 20px;
            /* background:#44516b; */
        }

        .section-title {
            font-size: 1.6rem;
            color: #fff;
            margin: 2rem 0 1rem;
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

        .author-name {
            margin: 0 0 12px;
            color: #104a81;
            font-size: 0.9rem;
        }

        .btn-read {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 8px;
            text-decoration: none;
            background: var(--primary);
            color: white;
            font-weight: 700;
            font-size: 0.9rem;
        }

        /* Container hides the overflow */
        .book-marquee-container {
            width: 100%;
            overflow: hidden;

            padding: 60px 0;
            position: relative;
            border-radius: 20px;
            margin: 40px 0;
        }

        /* The actual moving row */
        .book-marquee-content {
            display: flex;
            width: max-content;
            animation: slideRight 40s linear infinite; /* Adjust time for speed */

        }

        /* Pause when the user wants to click a book */
        .book-marquee-content:hover {
            animation-play-state: paused;
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

        /* Keyframes to move exactly half the total width */
        @keyframes scrollBooks {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); }
        }

        /* Edge fading effect */
        .book-marquee-container::after {
            content: "";
            position: absolute;
            top: 0; right: 0; bottom: 0; left: 0;
            pointer-events: none;
        }

        /* Marquee */
        .marquee-container {
            width: 100%;
            overflow: hidden;
            padding: 40px 0;
            position: relative;
        }

        .marquee-content {
            display: flex;
            width: max-content; /* Vital: lets the row be as long as it needs to be */
            animation: slideLeft 30s linear infinite;
        }

        /* Pause on hover so people can actually read the quote! */
        .marquee-content:hover {
            animation-play-state: paused;
        }

        .quote-card {
            flex: 0 0 350px; /* Fixed width for each quote */
            margin: 0 20px;
            background: var(--primary);
            border-radius: 20px;
            padding: 30px;
            color: #104a81;
            font-size: 1.1rem;
            font-style: italic;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .quote-card span {
            display: block;
            margin-top: 15px;
            font-style: normal;
            font-weight: bold;
            color: var(--bg);
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        /* The Animation */

       @keyframes slideLeft {
           0% { transform: translateX(0); }
           100% { transform: translateX(-50%); }
       }

       @keyframes slideRight {
           0% { transform: translateX(-50%); }
           100% { transform: translateX(0); }
       }

        /* Gradient Fade on edges for that high-end look */
        .marquee-container::before,
        .marquee-container::after {
            content: "";
            position: absolute;
            top: 0;
            width: 150px;
            height: 100%;
            z-index: 2;
        }

        .welcome-container {
    display: flex;
    align-items: center;
    justify-content: center;
    background: var(--primary);
    border-radius: 20px;
    padding: 20px;
    margin: 0 auto 40px auto;  /* <-- add this */
    text-align: center;
    color: var(--bg);
    max-width: fit-content;
    animation: dance 2.5s ease-in-out infinite;
}



@keyframes dance {
    0% { transform: translateY(0) rotate(0deg); }
    25% { transform: translateY(-10px) rotate(-5deg); }
    50% { transform: translateY(0) rotate(5deg); }
    75% { transform: translateY(-10px) rotate(-5deg); }
    100% { transform: translateY(0) rotate(0deg); }
}

    </style>
</head>
<body>

<nav>
    <a href="${pageContext.request.contextPath}/" class="logo">StoryNest</a>
    <div class="user-menu">
        <a href="${pageContext.request.contextPath}/views/library"><i class="fas fa-book"></i></a>
        <a href="${pageContext.request.contextPath}/views/profile"><i class="fas fa-user"></i></a>
        <a href="${pageContext.request.contextPath}/views/logout" style="color: #b66e03;"><i class="fas fa-sign-out-alt"></i></a>
    </div>
</nav>


<div class="container">
    <c:if test="${param.added == '1'}">
        <div style="background: #14532d; color: #bbf7d0; padding: 10px 16px; border-radius: 8px; margin-bottom: 20px; max-width: 400px;">
            Book added to your library.
        </div>
    </c:if>
    <div class="welcome-container">
        <p>Another day to dwell between the lines</strong></p>
    </div>

    <div class="marquee-container">
        <div class="marquee-content">
            <div class="quote-card">“Between the pages, we find the parts of ourselves we couldn't name.” <span>— I.Shoula</span></div>
            <div class="quote-card">"A novel is a quiet conversation between two souls who may never meet." <span>— I.Shoula</span></div>
            <div class="quote-card">"There is no friend as loyal as a book." <span>— Ernest Hemingway</span></div>
            <div class="quote-card">"Everything in the world exists to end up in a book." <span>— Stephane Mallarme</span></div>

            <div class="quote-card">"A reader lives a thousand lives before he dies." <span>— G.R.R. Martin</span></div>
            <div class="quote-card">"Stories let us live a thousand lives without losing our own" <span>— I.Shoula</span></div>
            <div class="quote-card">"Books don't just tell stories — they awaken them." <span>— I.Shoula</span></div>
            <div class="quote-card">"Smart people consume content. Wise people process it.”" <span>— I.Shoula</span></div>
        </div>
    </div>
    <c:if test="${not empty userProgress}">
        <h2 class="section-title">Continue Reading</h2>
        <div class="book-grid">
            <c:forEach var="item" items="${userProgress}">
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
        <hr style="margin: 3rem 0; opacity: 0.1;">
    </c:if>



    <h2 class="section-title">Explore Stories</h2>
    <div class="book-marquee-container">
        <div class="book-marquee-content">

            <c:forEach var="book" items="${bookList}">
                <div class="marquee-book-card">
                    <div class="marquee-cover-wrapper">
                        <img src="${book.coverImageUrl}" alt="${book.title}" onerror="this.src='https://via.placeholder.com/200x280?text=No+Cover'">
                    </div>
                    <div class="marquee-book-info">
                        <h4>${book.title}</h4>
                        <span>${book.authorName}</span>
                        <a href="${pageContext.request.contextPath}/views/bookDetails?id=${book.bookId}" class="view-btn">View</a>
                    </div>
                </div>
            </c:forEach>

            <c:forEach var="book" items="${bookList}">
                <div class="marquee-book-card">
                    <div class="marquee-cover-wrapper">
                        <img src="${book.coverImageUrl}" alt="${book.title}" onerror="this.src='https://via.placeholder.com/200x280?text=No+Cover'">
                    </div>
                    <div class="marquee-book-info">
                        <h4>${book.title}</h4>
                        <span>${book.authorName}</span>
                        <a href="${pageContext.request.contextPath}/views/bookDetails?id=${book.bookId}" class="view-btn">View</a>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>

</body>

<script>
    // Typewriter effect
    function typewriter(element, text, speed = 100) {
        element.textContent = '';
        let index = 0;

        function type() {
            if (index < text.length) {
                element.textContent += text.charAt(index);
                index++;
                setTimeout(type, speed);
            }
        }

        type();
    }

    document.addEventListener('DOMContentLoaded', function() {
        const typewriterElement = document.getElementById('typewriter');
        if (typewriterElement) {
            typewriter(typewriterElement, typewriterElement.textContent, 75);
        }
    });

</script>
</html>