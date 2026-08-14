---
permalink: /research/
title: "Research"
excerpt: ""
author_profile: false
classes: research-page
---
{% if site.google_scholar_stats_use_cdn %}
{% assign gsDataBaseUrl = "https://cdn.jsdelivr.net/gh/" | append: site.repository | append: "@" %}
{% else %}
{% assign gsDataBaseUrl = "https://raw.githubusercontent.com/" | append: site.repository | append: "/" %}
{% endif %}
{% assign url = gsDataBaseUrl | append: "google-scholar-stats/gs_data_shieldsio.json" %}

My research focuses on trustworthy AI systems, especially neuro-symbolic reasoning, spatial reasoning in large multimodal models, runtime monitoring for LLM agents, and formal safety verification for learning-enabled robotics.



<div class="paper-box"><div class="paper-box-image"><div><div class="badge">IROS 2026</div><img src="/images/PixPin_2026-06-19_16-42-37.png" alt="Safety-Constrained RL robot navigation" width="100%"></div></div>
<div class="paper-box-text" markdown="1">

[Safety-Constrained Reinforcement Learning with Post-Training Reachability Verification for Robot Navigation](https://arxiv.org/abs/2605.14174)
<a href="https://scholar.google.com/citations?view_op=view_citation&hl=zh-CN&user=mhRHe4oAAAAJ&citation_for_view=mhRHe4oAAAAJ:IjCSPb-OGe4C"><span class="show_paper_citations" data="mhRHe4oAAAAJ:IjCSPb-OGe4C"></span></a>
<a href="https://arxiv.org/abs/2605.14174"><img src="https://img.shields.io/badge/arXiv-2605.14174-b31b1b" alt="arXiv 2605.14174"></a>

Qisong He, **Xinmiao Huang**, Jinwei Hu, Zhuoyun Li, Yi Dong, Changshun Wu, Xiaowei Huang.

- Proposed a framework combining CVaR-constrained RL training with neural network reachability verification for safe robot navigation.
- Achieved 98.3% success rate across ten navigation scenarios with the highest safety verification rate.
</div>
</div>

<div class="paper-box"><div class="paper-box-image"><div><div class="badge">arXiv 2026</div><img src="/images/PrefixGuard_Motivation.png" alt="PrefixGuard motivation and online prefix-warning monitor" width="100%"></div></div>
<div class="paper-box-text" markdown="1">

[PrefixGuard: From LLM-Agent Traces to Online Failure-Warning Monitors](https://arxiv.org/pdf/2605.06455)
<a href="https://scholar.google.com/citations?view_op=view_citation&hl=zh-CN&user=mhRHe4oAAAAJ&citation_for_view=mhRHe4oAAAAJ:UeHWp8X0CEIC"><span class="show_paper_citations" data="mhRHe4oAAAAJ:UeHWp8X0CEIC"></span></a>
<a href="https://arxiv.org/pdf/2605.06455"><img src="https://img.shields.io/badge/arXiv-2605.06455-b31b1b.svg" alt="arXiv 2605.06455"></a>
<a href="https://shinmohuang.github.io/prefixguard_page/"><img src="https://img.shields.io/badge/Project-Page-blue" alt="Project page"></a>
<a href="https://github.com/shinmohuang/PrefixGuard"><img src="https://img.shields.io/badge/GitHub-Repo-black?logo=github" alt="GitHub repository"></a>

**Xinmiao Huang**, Jinwei Hu, Rajarshi Roy, Changshun Wu, Yi Dong, Xiaowei Huang.

- Preprint on arXiv (May 2026).
</div>
</div>

<div class="paper-box"><div class="paper-box-image"><div><div class="badge">ACL 2026 Oral</div><img src="/images/lying.png" alt="Lying with Truths cover" width="100%"></div></div>
<div class="paper-box-text" markdown="1">

[Lying with Truths: Open-Channel Multi-Agent Collusion for Belief Manipulation via Generative Montage](https://arxiv.org/pdf/2511.06168v2)
<a href="https://scholar.google.com/citations?view_op=view_citation&hl=zh-CN&user=mhRHe4oAAAAJ&citation_for_view=mhRHe4oAAAAJ:u-x6o8ySG0sC"><span class="show_paper_citations" data="mhRHe4oAAAAJ:u-x6o8ySG0sC"></span></a>
<a href="https://arxiv.org/pdf/2511.06168v2"><img src="https://img.shields.io/badge/arXiv-2511.06168v2-b31b1b.svg" alt="arXiv 2511.06168v2"></a>

Jinwei Hu, **Xinmiao Huang**, Youcheng Sun, Yi Dong, Xiaowei Huang.

- Accepted to the 64th Annual Meeting of the Association for Computational Linguistics (ACL 2026).
</div>
</div>

<div class="paper-box"><div class="paper-box-image"><div><div class="badge">ACL 2026</div><img src="/images/cotlens.png" alt="Chain-of-Thought as a Lens cover" width="100%"></div></div>
<div class="paper-box-text" markdown="1">

[Chain-of-Thought as a Lens: Evaluating Structured Reasoning Alignment between Human Preferences and Large Language Models](https://arxiv.org/pdf/2601.01685)
<a href="https://arxiv.org/pdf/2601.01685"><img src="https://img.shields.io/badge/arXiv-2601.01685-b31b1b.svg" alt="arXiv 2601.01685"></a>

Boxuan Wang, Zhuoyun Li, **Xinmiao Huang**, Xiaowei Huang, Yi Dong.

- Accepted to the 64th Annual Meeting of the Association for Computational Linguistics (ACL 2026).
</div>
</div>

<div class="paper-box"><div class="paper-box-image"><div><div class="badge">ICLR 2026</div><img src="/images/spatial-dise.png" alt="Spatial-DISE benchmark" width="100%"></div></div>
<div class="paper-box-text" markdown="1">

[Spatial-DISE: A Unified Benchmark for Evaluating Spatial Reasoning in Vision-Language Models](https://openreview.net/forum?id=bMINsPQpME)
<a href="https://scholar.google.co.uk/citations?view_op=view_citation&hl=zh-CN&user=mhRHe4oAAAAJ&citation_for_view=mhRHe4oAAAAJ:9yKSN-GCB0IC"><span class="show_paper_citations" data="mhRHe4oAAAAJ:9yKSN-GCB0IC"></span></a>
<a href="https://shinmohuang.github.io/spatialdise_page/"><img src="https://img.shields.io/badge/Project-Page-blue" alt="Project page"></a>
<a href="https://huggingface.co/collections/TACPS-liv/spatial-dise"><img src="https://img.shields.io/badge/%F0%9F%A4%97%20Hugging%20Face-yellow" alt="Hugging Face"></a>

**Xinmiao Huang**, Qisong He, Zhenglin Huang, Boxuan Wang, Zhuoyun Li, Guangliang Cheng, Yi Dong, Xiaowei Huang.

- Proposed a unified benchmark, Spatial-DISE, for evaluating spatial reasoning in Vision-Language Models (VLMs).
</div>
</div>

<div class="paper-box"><div class="paper-box-image"><div><div class="badge">Journal of Mine Automation. 2022(12)</div><img src="/images/2022100041-10.jpg" alt="Coal mine roadway mobile robot mapping" width="100%"></div></div>
<div class="paper-box-text" markdown="1">

[3D map construction of coal mine roadway mobile robot based on integrated factor graph optimization](http://www.gkzdh.cn/en/article/doi/10.13272/j.issn.1671-251x.2022100041)
<a href="https://scholar.google.com/citations?view_op=view_citation&hl=zh-CN&user=mhRHe4oAAAAJ&citation_for_view=mhRHe4oAAAAJ:u5HHmVD_uO8C"><span class="show_paper_citations" data="mhRHe4oAAAAJ:u5HHmVD_uO8C"></span></a>

ZOU Xiaoyu, **HUANG Xinmiao**, WANG Zhongbin, FANG Dongsheng, PAN Jie, SI Lei.

- Investigated different popular Lidar-SLAM methods and implemented them on a tracked robot with 3D Lidar and IMU.
- Developed a Lidar-SLAM method based on integrated factor graph optimization.
- Improved the precision and robustness of 3D map construction of coal mine roadways.
- Published one journal paper as the second author.
</div>
</div>
