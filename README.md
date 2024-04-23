Original App Design Project 
===

# ModernStoic

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

ModernStoic is a mobile app designed to integrate the principles of Stoic philosophy into daily life. It features interactive journaling, daily quotes from Stoic texts, and information about Stoic philosophers and virtues. Users can also take quizzes to identify which Stoic virtues they may lack and design daily routines based on Stoic principles. The app translates ancient Stoic wisdom into modern contexts, providing users with actionable insights and recommendations for books on Stoicism.

### App Evaluation

- **Category:** Wellness / Self-improvement
- **Mobile:** ModernStoic leverages the mobile platform by providing daily notifications of Stoic quotes and reminders for journal entries, making Stoicism accessible anywhere and anytime. While it doesn't use advanced mobile features like the camera or location services, its value lies in its portability and the personal, immediate access to philosophical content.
- **Story:** The app tells a compelling story of connecting with ancient wisdom in modern times, appealing to those seeking personal growth and mental resilience. It frames Stoicism as a practical toolkit for facing daily challenges, which is highly relevant in today's fast-paced, stress-filled life.
- **Market:** There is a significant and growing interest in Stoic philosophy among people looking for ways to cope with stress and improve their lives. ModernStoic targets not only those already familiar with Stoicism but also newcomers, offering an engaging way to learn and apply its teachings.
- **Habit:** ModernStoic is designed to be habit-forming, with daily interactions encouraged through quotes, journaling prompts, and routine tracking. Users are engaged both by consuming content and actively reflecting on their experiences, making it part of their daily routine to seek wisdom and self-improvement.
- **Scope:** The scope of ModernStoic is clearly defined, focusing on delivering daily Stoic wisdom, interactive journaling, and virtue quizzes. The basic features are straightforward to implement, while additional AI functionalities for translating Stoic quotes can be added progressively. Even a simplified version of the app would be engaging and useful, making the project technically feasible and well-structured for development.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can navigate through history, journaling, virtues tabs
* App fetches daily quotes from an a Stoic Quote API and displays it
* User can navigate the "Four Virtues" tab in a pie chart form
    * User can access information on the four virtues
    * User can take a Stoic Virtue quiz that gives them a book reccomendation and advice
* User can access historical information about the Stoic philosophers and can click on the philosopher 
* Users can journal based off their quote


**Optional Nice-to-have Stories**

* User can maintain a journaling streak
* Nice and fluid animations
* AI interpretations of Stoic Quotes
* Notfications on journaling


### 2. Screen Archetypes

- [ ] Introductory Screen
* If first time user then displays some introductory information
* Displays navigation tabs
- [ ] Stream
* User can scroll the list of Stoic philosophers in cronological order
* User can scroll through their journaling list
* User can view daily quote
* User can take virtue quiz
- [ ] Detail
* User can click on virtues for more information
* User can click on Stoic philosopher for more information
- [ ] Creation
* User can add journal entries based upon the daily quote and and journaling prompt

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Daily quote Tab (Home)
* Journaling Tab
* Four Virtue Tab
* Historical list of Stoic philosophers tab

**Flow Navigation** (Screen to Screen)

- [ ] Daily Quote Tab
- [x] Journaling tab
- [ ] Four Virtue Tab
- [ ] Stoic History Tab

### 4. Sprints
* Sprint 1: Setup Introductory Screen, and all tabs
- [x] Introductory Screen (Launch Screen)
- [x] Daily Quote Tab
- [ ] Four Virtue Tab
- [ ] Stoic History Tab

* Sprint 2: Journaling Tab:
- [x] User can create journal entries with persistence 
- [x] Journal Entries are saved in table view

* Sprint 3: Daily Quote Tab
- [x] App fetches quotes from an API and displays the quote and author
- [x] User can refresh quotes to get another quote and author 

* Sprint 4: Four Virtues Tab
- [ ] Displays the four virtues in a cricle seperated into four quarters
- [ ] User can click on each one and access a detail view with more info and book reccomendatio.

* Sprint 5: Enhancing UI
- [ ] Make the UI look cleaner (fonts, background, etc)
- [ ] add animations to make app more fluid


## Wireframes

<img src= "https://html.scribdassets.com/3fz7acsum8cbperu/images/1-46fb52c74b.jpg" width=600>


## Video-Walkthrough (Current)
<div>
    <a href="https://www.loom.com/share/e6a310bc5ecf4cbf9075d7b2a4e5160f">
    </a>
    <a href="https://www.loom.com/share/e6a310bc5ecf4cbf9075d7b2a4e5160f">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/e6a310bc5ecf4cbf9075d7b2a4e5160f-with-play.gif">
    </a>
  </div>
  
## Video-Walkthrough (OLD)
<div>
    <a href="https://www.loom.com/share/de1f63089ff64b97a06c949959d05c81">
    </a>
    <a href="https://www.loom.com/share/de1f63089ff64b97a06c949959d05c81">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/de1f63089ff64b97a06c949959d05c81-with-play.gif">
    </a>
  </div>

## Schema 

[This section will be completed in Unit 9]

### Models

- Journal Cell
- Journal Table View
- DailyQuote

### Networking

- API request to fetch daily quotes
- Example: "text": "You live as though you were going to live for ever, at no time taking thought for your weakness, and you fail to note how much time has already passed by.",
    "author": "Seneca"

