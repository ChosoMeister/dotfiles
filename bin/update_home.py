import re

with open('/Users/mustafa/Documents/Git/Gitlab-Axon/axon.meet/services/frontend/src/pages/Home.css', 'r') as f:
    css = f.read()

# Header light fixes
css = css.replace('rgba(47, 69, 92, 0.92)', 'rgba(255, 255, 255, 0.98)')
css = css.replace('rgba(255, 255, 255, 0.08)', 'rgba(0, 0, 0, 0.06)')
css = css.replace('color: var(--white);\n}\n\n.header-logo img', 'color: var(--sapphire);\n}\n\n.header-logo img')
css = css.replace('filter: brightness(0) invert(1);', '/* original colors */')
css = css.replace('.logo-meet {\n    color: var(--white);', '.logo-meet {\n    color: var(--sapphire);')
css = css.replace('color: rgba(255, 255, 255, 0.7);', 'color: var(--text-body);')
css = css.replace('.nav-link:hover {\n    color: var(--white);', '.nav-link:hover {\n    color: var(--turquoise);')

# Hero arc and background
hero_target = """.hero {
    position: relative;
    padding: 72px 0 88px;
    overflow: hidden;
    background: linear-gradient(155deg, #364d63 0%, #2F455C 40%, #3a5570 100%);
    color: var(--white);
}

.hero-bg-shape {
    position: absolute;
    top: -180px;
    left: -100px;
    width: 460px;
    height: 460px;
    background: rgba(0, 197, 186, 0.07);
    border-radius: 50%;
    pointer-events: none;
    z-index: 0;
}

.hero-bg-shape-2 {
    position: absolute;
    bottom: -60px;
    right: -40px;
    width: 320px;
    height: 320px;
    background: rgba(255, 255, 255, 0.03);
    border-radius: 50%;
    pointer-events: none;
    z-index: 0;
}

.hero-inner {
    position: relative;
    z-index: 1;
    max-width: var(--inner-max);
    margin: 0 auto;
    padding: 0 32px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 56px;
    align-items: center;
}"""

hero_replacement = """.hero {
    position: relative;
    padding: 72px 0 88px;
    background: #FAFBFC;
    overflow: hidden;
    color: var(--white);
}

.hero-arc-bg {
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
    left: 0;
    background: #2F455C;
    clip-path: ellipse(65% 100% at 100% 50%);
    z-index: 0;
}

.hero-inner {
    position: relative;
    z-index: 1;
    max-width: var(--inner-max);
    margin: 0 auto;
    padding: 0 32px;
    display: grid;
    grid-template-columns: 1fr 1.1fr;
    gap: 64px;
    align-items: center;
}"""

css = css.replace(hero_target, hero_replacement)

# CTA sizes and chips
cta_target = """.cta-secondary {
    height: 46px;
    padding: 0 24px;
    background: transparent;
    color: var(--white);
    border: 1.5px solid rgba(255, 255, 255, 0.3);
    border-radius: 14px;
    font-family: inherit;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: border-color 0.2s ease, background 0.2s ease;
}"""

cta_replacement = """.cta-secondary {
    height: 54px;
    padding: 0 36px;
    background: transparent;
    color: var(--white);
    border: 1px solid rgba(255, 255, 255, 0.4);
    border-radius: 27px;
    font-family: inherit;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: border-color 0.2s ease, background 0.2s ease;
}"""
css = css.replace(cta_target, cta_replacement)

css = css.replace('color: var(--turquoise);\n    flex-shrink: 0;\n}', 'color: var(--white);\n    flex-shrink: 0;\n}')

# Mockup replacement
visual_start = css.find('.hero-visual {')
trust_start = css.find('/* ========== TRUST SECTION ========== */')

mockup_css = """.hero-visual {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    position: relative;
    width: 100%;
}

.mockup-window {
    width: 100%;
    max-width: 540px;
    background: var(--white);
    border-radius: 12px;
    box-shadow: 0 24px 48px rgba(33, 44, 60, 0.12), 0 0 0 1px rgba(0, 0, 0, 0.04);
    overflow: hidden;
}

.mockup-header-bar {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 12px 16px;
    border-bottom: 1px solid rgba(0, 0, 0, 0.06);
    background: #FFFFFF;
}

.mockup-header-bar .dot {
    width: 12px;
    height: 12px;
    border-radius: 50%;
}
.dot-red { background: #FF5E57; border: 1px solid #E0443E; }
.dot-yellow { background: #FFBD2E; border: 1px solid #DEA123; }
.dot-green { background: #28C840; border: 1px solid #1AAB29; }

.mockup-content {
    padding: 16px;
    background: #FFFFFF;
}

.mockup-grid {
    display: flex;
    gap: 12px;
    margin-bottom: 16px;
}

.mockup-grid-left {
    flex: 1;
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr 1fr;
    gap: 12px;
}

.mockup-grid-right {
    flex: 1;
    display: flex;
}

.mu-tile {
    border-radius: 8px;
    display: flex;
    align-items: flex-end;
    justify-content: center;
    overflow: hidden;
    position: relative;
    background: #F4F6F8;
    aspect-ratio: 1;
}

.mockup-grid-right .mu-tile {
    width: 100%;
    height: 100%;
    aspect-ratio: auto;
}

.mockup-pill-container {
    text-align: center;
    margin-top: 10px;
}

.mockup-pill-controls {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 16px;
}

.mu-ctrl {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: transform 0.2s ease;
    cursor: pointer;
}
.mu-ctrl:hover {
    transform: scale(1.05);
}

.mu-green {
    background: #00C5BA;
    color: white;
}

.mu-outline {
    background: #FFFFFF;
    border: 1.5px solid #E2E4E7;
    color: #4A5B6E;
}

.mu-ctrl svg {
    width: 20px;
    height: 20px;
}

@media (max-width: 992px) {
    .hero-arc-bg {
        clip-path: ellipse(150% 70% at 50% 0%);
    }
    .hero-inner {
        grid-template-columns: 1fr;
        text-align: center;
        gap: 40px;
    }
    .hero-visual {
        justify-content: center;
        order: 2;
    }
    .hero-ctas, .hero-chips {
        justify-content: center;
    }
}

"""

css = css[:visual_start] + mockup_css + css[trust_start:]

with open('/Users/mustafa/Documents/Git/Gitlab-Axon/axon.meet/services/frontend/src/pages/Home.css', 'w') as f:
    f.write(css)
