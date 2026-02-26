<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
            color: #64748b;
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
            color: #f8fafc;
            margin: 15px 0 5px;
            font-size: 1rem;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .marquee-book-info span {
            color: #94a3b8;
            font-size: 0.85rem;
        }

        .view-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 5px 15px;
            background: var(--primary);
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
            color: var(--bg);
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
            color: #27ae60;
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

    </style>
</head>
<body>

<nav>
    <a href="home" class="logo">StoryNest</a>
    <div class="user-menu">
        <span>Welcome, <strong>${currentUser.username}</strong></span>
        <a href="profile">Profile</a>
        <a href="logout" style="color: #b61503;">Logout</a>
    </div>
</nav>


<div class="container">

    <div class="marquee-container">
        <div class="marquee-content">
            <div class="quote-card">"A reader lives a thousand lives before he dies." <span>— G.R.R. Martin</span></div>
            <div class="quote-card">"Books are a uniquely portable magic." <span>— Stephen King</span></div>
            <div class="quote-card">"There is no friend as loyal as a book." <span>— Ernest Hemingway</span></div>
            <div class="quote-card">"Everything in the world exists to end up in a book." <span>— Stephane Mallarme</span></div>

            <div class="quote-card">"A reader lives a thousand lives before he dies." <span>— G.R.R. Martin</span></div>
            <div class="quote-card">"Books are a uniquely portable magic." <span>— Stephen King</span></div>
            <div class="quote-card">"There is no friend as loyal as a book." <span>— Ernest Hemingway</span></div>
            <div class="quote-card">"Everything in the world exists to end up in a book." <span>— Stephane Mallarme</span></div>
        </div>
    </div>
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
                        <a href="bookDetails?id=${book.bookId}" class="view-btn">View</a>
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
                        <a href="bookDetails?id=${book.bookId}" class="view-btn">View</a>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>

</body>

<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll('.quote-slide');

    function nextSlide() {
        // Remove 'active' from current slide
        slides[currentSlide].classList.remove('active');

        // Move to next index, or back to 0
        currentSlide = (currentSlide + 1) % slides.length;

        // Add 'active' to new slide
        slides[currentSlide].classList.add('active');
    }

    // Change slide every 5000ms (5 seconds)
    setInterval(nextSlide, 5000);
</script>
</html>