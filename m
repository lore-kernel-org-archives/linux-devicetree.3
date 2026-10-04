Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F143AE18C
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131493; cv=none; b=XqJH0LirtsQvFh8SBG5e2JnkT3VGKvZwXxSgtzSUnJw8HKsqTfwaj13EN3+uduwfVKiv7SAEwjZcdqEGkQ9l5Mfc3bVh2CjMfJxfq6rRf0mjX2xp8kIKxVt3Itb8rMVCUiH1O7quTve+ZQbnSm4zU+asQpWA62H+FO6xyCM6iNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131493; c=relaxed/simple;
	bh=S+ZkZYvED8iboTlDX+3mawlJCZBnQtlH4XISGdo7vmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P6A19Md4ct4YL6mvuZEzffMwKPcRSxhRgWKW8Uxue/nlpzYfvtyMgEl44qfplhwlMipAZ6j6QPb1tzwxZccHBnDjt1dVFvX05nf/wBX154q89B/eqVY610wC0NK1SNw+JSaroOUOvNvHl0/ocfBAsUwX1FDbbs4GJVXRq3hAKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUpWh5KR; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUpWh5KR"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so9462985e9.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131488; x=1791736288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4K1u7HAUlwlZgokElVxrzMuDxi7Yuc8MTskvjYgWwtc=;
        b=BUpWh5KRnnLrs0vhMfH5RHpOI9OxWGYB11a2EPNvReWEcmS0bWeTV5Gug0YociNeY2
         bXrnGtNVMaqxfzyP4BEKc7gL8iJiHg5G65WkeEcuj7GlYxBPoAOn1Li7aUUEb7v+izdt
         4VXTRjpSQAWVFyTdPGRHaewQSlbD+7fyA5mF2lkSBYnfAGeRvCWbyYA3Eth2+zqjlRm+
         n9yX4EeoroTF+Hu1nwuBMSBUXsNZa4uSPCXk1wurT11lNAkjAg+7JZF/MzwJymKdXAmW
         v8TEg3C22isYZrWiSpJjDrb9RO9m72Z91kLR0BiU3x0OHX1MhgKBuH5Ge9/qiuk+LhEl
         udWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131488; x=1791736288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4K1u7HAUlwlZgokElVxrzMuDxi7Yuc8MTskvjYgWwtc=;
        b=w4yWYOQJZ6EwF7eThQiwwI3iL4OOnO0zJrHepY/WiMmso1FXaB+X1KFU3olNpreAhj
         0ypXztVFbTNp60qTwijLkQi1BBwJqQ2uFN91S3obugorITrz0xadYrHCUbGsYvlqqLKg
         isK9ZBvFIuU7LFmFeFMYQqWQPr/2UPa5ieMqujfXeFDg2vqlKooQz3m46MstrGkWwAfz
         i01V2xi/3D4om78QzFotHzGlWu8oVi40QoPn1pcRKCel0peFehtJEYVc7+DNX/3JnVEr
         wrwOwphdjzxVdhkBA00L5Ejk/WhcZJI4InN2KTHJruBtDikG1g2Ij+sLwle8glNYFsVi
         FelQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6IPfF3+yD9Q7Rop9JLBM4Gnyk2eX9RkwJ5CWbYmRtolQabb7EiZIGSFdwcZZu3u30MhfJmXXX0QcJ@vger.kernel.org
X-Gm-Message-State: AFuF++knH3VMJuNWnXh3/5y67eE+TDKMaPEwsFtoenMlxiUBxHNKB/EP
	pWWBHUU3GlwMCBdVFkR81GJmACo29A10QBdRIdmsgdouFOhoUP7n+JsF
X-Gm-Gg: AYBFou1+eSNlwk15dclYRoHXsrai7QiHQ+lXbp4cowNZIsCGHK+qNgBoSSZ2Zv5n0y/
	ZFNqelkkCKTkSy8g6P0QE9m/l3dwEDsX7l2ByFmHyTDqfXnCfBnW3qgrnsRRyvMMXMtEQjEbEq1
	DJN5pOw1ZgbaSUNfr+PBtsMjJ+xMcz5jhbjCHQOE4itG9D82c035LnSLy+ul2BGJr7i0Gu2CHMz
	d8Y9hW3FAcG/LxTYkXh5SsB3BmVelGvyszM723K+cIkX7PEWcqzMOQ1akhUPOePeHBmMAT3cBft
	mWujECNXVeBNx3fzS2+GBSJpRycSpHhTWnNVXfd5BbbxnZu9zu0e6qivaZkqM/5FnActAdCAOux
	Q5iEtansWvT120XHLMV2ZXzkFeXTufRXPztYh5MQAE2WFwiHtJowraxhGSC4tjxZQKLJPCEqDzS
	badPJALsIYljmERG8S6CJZ2d1mfD+QvzfbB7o/Qnf5jcAMkezmGPtMpeC1orR7oeST4bpJe0/kc
	VZyuqwSE+yRpkWYOxQ=
X-Received: by 2002:a05:600c:a011:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-4a0275107e2mr140690815e9.1.1791131487995;
        Sun, 04 Oct 2026 09:31:27 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/7] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Sun,  4 Oct 2026 19:31:07 +0300
Message-ID: <20261004163114.181800-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'.

Add DC parametrization options needed for fine tuning by bridges.
Add 8-bit CPU interface in form of a bridge linking to RGB port.
Add 2 DBI Type B panels used in LG Optimus 2X which work with
the 8-bit CPU interface.

---
Changes in v2:
- convert enums in the dc header into definitions list
- add check in RGB if bridge_state is not NULL, if yes, use default flags
- inverted FLAG_PIXDATA_SAMPLE flag setup logic since default value is set to
  be on NEGEDGE while v1 set default to be on POSEDGE
- 8bit-cpu schema renamed to dbi, removed compaible and set as DC child
- expanded list of required properties
- 8bit-cpu bridge remodelled into dbi interface as DC child
- improve gpio handling
- rework attach to get drvdata from parent
- add panel supplies description
- split panel driver into per-panel drivers
- get DBI interface from the patent directly

I have deliberately left GPIO parsing from device tree since it seems to
be the most convenient and mainstream method of working with GPIOs.
---

Svyatoslav Ryhel (7):
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
  drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver

 .../display/panel/hit,tx10d07vm0baa.yaml      |  58 +++
 .../display/tegra/nvidia,tegra-dbi.yaml       | 143 ++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |   3 +
 drivers/gpu/drm/panel/Kconfig                 |  27 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 297 +++++++++++++
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 236 ++++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/dbi.c                   | 416 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  24 +-
 drivers/gpu/drm/tegra/dc.h                    |  50 ++-
 drivers/gpu/drm/tegra/rgb.c                   |  41 +-
 13 files changed, 1293 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

-- 
2.53.0

