---
layout: home
title: Home
nav_order: 1
permalink: /
---

Working with AI to organize my thoughts and practices towards an application and interview for a management position at my company.

# Management Interview Ramp Up Documentation

Welcome to the documentation for the Management Interview Ramp Up.  Documentation of my thoughts and practice in preparing an application and interview for management.

## About This Project

This ramp-up allows users to:
- Ramp Up to an application and interview for management

## Project Status
{: .fs-5 }

Want to know where we are in ramp-up? Check our [Project Plan & Status]({{ '/docs/project-plan-and-status' | relative_url }}) page to see our current progress, upcoming milestones, and ramp-up roadmap.

[View Project Status]({{ '/docs/project-plan-and-status' | relative_url }}){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }

## Latest ramp-up Update
{: .fs-5 }

{% assign latest_entry = site.html_pages | where: "parent", "ramp-up-journal" | sort: "date" | reverse | first %}
{% if latest_entry %}
### [{{ latest_entry.title }}]({{ latest_entry.url | relative_url }})
**Date:** {{ latest_entry.date | date: "%B %d, %Y" }}

{{ latest_entry.excerpt | truncate: 150 }}

[View latest update]({{ latest_entry.url | relative_url }}){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[ramp-up-journal]({{ '/docs/ramp-up-journal' | relative_url }}){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
{% else %}
ramp-up-journal entries coming soon!

[ramp-up-journal]({{ '/docs/ramp-up-journal' | relative_url }}){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
{% endif %}

