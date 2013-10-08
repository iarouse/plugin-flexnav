## Name
Flexnav - Responsive Multi-colors Slide nav/menu

## Features
- Responsive **Slide pattern** navigation, space-saving, sexy as hell.
- Build with **Less** CSS, easy to modify.
- **Light** and **Dark** theme, plus **multiple colors** support (with 9 preset schemes).
- Work well with **Bootstrap**, test on **2.3.2** and **3.0.0**
- Well documented, **with examples**.
- Build with love ❤
- Cross broswer.

## Tags
responsive menu, responsive navigation, light and dark, mutli-color, less, bootstrap, Slide pattern, CoffeeScript, elegant, beautiful 

## Some thoughts
Features:
- Two desktop style? Full screen length & boxed. (Just one for now)

Demo:
- icon: pin button + Google plus (4 colour circle) icon that I recently downloaded
- description like flat UI http://designmodo.com/flat/ Icon on left, title + desc on right.

## Changelog

- xx/xx/xxxx 1.1 Fix

- xx/xx/xxxx 1.0 Publish.

## Process
- **Design decided**. I spend too much time doubt about design.
	- Full width
	- Others refer to Flat UI Navbar (light and dark version) and Codrop - ResponsiveMultiLevelMenu

- **Build Style** with **Desktop First** approach.

- **Essential first**. Style polish later.

- Simple 'slide' pattern first, then add off-canvas pattern.

- add animation options, like fade, slide… use CSS animation instead of jQuery, since on mobile, webkit support CSS animation.
	- desktop animation
	- mobile animation
	
- Test it out, cross browser, mobile, online, bootstrap (2.3.2 and 3.0.0)

- Make docs and build examples (basic and advanced)

## Credits
- Flat UI

## Problems

---
Solved:

- transition effect on page load, which is not good. I should only transition when in, not out. **Solution** Put transition on hover state, not the 'base' state, therefore the transition only available on in, not out.
- seems problem not first mobile menu open click. It seems has something to do with 'nav_open' value
- click 'back', window reset to top. **Solution**: it's because of the the default anchor link event, use preventDefault to solve it :)
- menu reset on menu open problem (mobile), since menu open triggers a resize event. **Solution**: only reset when resize from mobile to desktop, not mobile to mobile
- li:first-child border-radius problem, since the first li is li.fn-back. **Solution**: use nth-child selector, IE9 supports it.
- from desktop to mobile, can not open sub menu bug.
	- when desktop, if I don't hover to show sub-ul, when resize to mobile, it works fine. If I do, then problem occur.
	- **Solution** (Just so so), use CSS hover to show menu instead of mouseenter and mouseleave. I have no clue why it breaks mobile nav when I already $li.off('mouseenter mouseleave')
- nav_open problem, should not reset it when window.resize from mobile to mobile


## Docs
- If you want to switch theme, say from light to dark: change @base, and change .fn-light 

## Next Nav
- Vertical Nav
- Use CSS to animate, with fallback to jQuery
- more jQuery plugin pattern to try.
	

