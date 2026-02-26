<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>StoryNest | Discover Your Next Favorite Book</title>
    <style>
      /* Base Styling */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Helvetica Neue", Arial, sans-serif;
      }

      :root {
        --primary: #daedff;
        
        --bg: #0f172a;
        --bg-main: #0f172a; 
        --dark: #0f172a;
      }

      * {
        box-sizing: border-box;
      }
      body {
        background: var(--bg);
        color: var(--text-main);
        font-family: "Inter", system-ui, sans-serif;
        margin: 0;
        line-height: 1.5;
      }

      /* Navbar */
      nav {
        background: #0f172a;
        padding: 1rem 5%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      .logo {
        font-size: 1.8rem;
        font-weight: 800;
        color: var(--primary);
        text-decoration: none;
      }

      .nav-links a {
        text-decoration: none;
        color: var(--primary);
        margin-left: 30px;
        font-weight: 500;
      }

      .btn-login {
        border: 2px solid var(--primary);
        padding: 8px 20px;
        border-radius: 20px;
        color: var(--primary) !important;
      }

      /* Hero Section */
      .hero {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 80px 10%;
        /* background: var(--bg); */
        min-height: 80vh;
      }

      .hero-text {
        flex: 1;
        padding-right: 50px;
      }

      .hero-text h1 {
        font-size: 3.5rem;
        line-height: 1.1;
        margin-bottom: 20px;
        color: var(--primary);
      }

      .hero-text p {
        font-size: 1.2rem;
        color: var(--primary);
        margin-bottom: 30px;
      }

      .cta-button {
        background: var(--primary);
        color: var(--bg);
        padding: 15px 35px;
        text-decoration: none;
        font-size: 1.1rem;
        border-radius: 5px;
        font-weight: bold;
        display: inline-block;
        transition: 0.3s;
      }

      .cta-button:hover {        
        transform: translateY(-2px);
        cursor: pointer;
      }

      .hero-image {
        flex: 1;
        text-align: right;
      }

      .hero-image img {
        max-width: 100%;
        border-radius: 15px;
        box-shadow: 20px 20px 0px var(--primary);
      }

      /* Features Section */
      .features {
        padding: 100px 10%;
        text-align: center;
      }

      .features h2 {
        font-size: 2.5rem;
        margin-bottom: 50px;
        color: var(--primary);
      }

      .feature-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 40px;
      }

      .feature-card {
        padding: 30px;
        border-radius: 10px;
        background: white;
        transition: 0.3s;
        color: var(--dark);
      }

      .feature-card p {
        color: #475569;
      }

      .feature-card:hover {
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
      }

      .feature-card i {
        font-size: 3rem;
        color: var(--primary);
        margin-bottom: 20px;
        display: block;
      }

      .feature-card h3 {
        margin-bottom: 15px;
      }

      /* Testimonial / Social Proof */
      .stats {
        background: var(--dark);
        color: white;
        padding: 60px 10%;
        display: flex;
        justify-content: space-around;
        text-align: center;
      }

      .stat-item h4 {
        font-size: 2.5rem;
        color: var(--primary);
      }

      /* Footer */
      footer {
        /* background: #eee; */
        padding: 50px 10%;
        text-align: center;
        color: #777;
      }

      @media (max-width: 768px) {
        .hero {
          flex-direction: column;
          text-align: center;
        }
        .hero-text {
          padding-right: 0;
          margin-bottom: 50px;
        }
        .hero-text h1 {
          font-size: 2.5rem;
        }
      }
    </style>
  </head>
  <body>
    <nav>
      <a href="#" class="logo">StoryNest</a>
      <div class="nav-links">
        <a href="#features">Features</a>
        <a href="#">Explore</a>
        <a href="./views/login.jsp" class="btn-login">Login</a>
      </div>
    </nav>

    <header class="hero">
      <div class="hero-text">
        <h1>Your stories, exactly where you left them.</h1>
        <p>
          StoryNest is the world's most intuitive reading platform. Filter by
          genre, track your progress automatically, and dive into a library
          built for you.
        </p>
        <a href="./views/signup.jsp" class="cta-button">Start Reading Free</a>
      </div>
      <div class="hero-image">
        <img
          src="https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=600&q=80"
          alt="Reading on StoryNest"
        />
      </div>
    </header>

    <section class="stats">
      <div class="stat-item">
        <h4>10k+</h4>
        <p>Books Available</p>
      </div>
      <div class="stat-item">
        <h4>50k+</h4>
        <p>Active Readers</p>
      </div>
      <div class="stat-item">
        <h4>100%</h4>
        <p>Progress Sync</p>
      </div>
    </section>

    <section class="features" id="features">
      <h2>Why StoryNest?</h2>
      <div class="feature-grid">
        <div class="feature-card">
          <h3>Smart Tracking</h3>
          <p>
            Never lose your page again. Our auto-save technology remembers your
            scroll position down to the exact paragraph.
          </p>
        </div>
        <div class="feature-card">
          <h3>Advanced Filtering</h3>
          <p>
            Find your next read by genre, author, or even reading time. Perfect
            for finding a story that fits your schedule.
          </p>
        </div>
        <div class="feature-card">
          <h3>Personal Library</h3>
          <p>
            Organize your collection, save favorites, and see your reading stats
            improve over time.
          </p>
        </div>
      </div>
    </section>

    <footer>
      <p>
        &copy; 2026 StoryNest. Designed for those who live a thousand lives
        before they die.
      </p>
    </footer>
  </body>
</html>
