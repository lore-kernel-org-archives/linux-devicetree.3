Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4843B4BC
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751961; cv=none; b=GP/U3clWDVhs+LiQz3ASm4w3Zf5JwMzz1Oq4XZ4POWz5wgZQJqWpfPScUjTOMHoJRE+Og1rMdxLyx1a4fsv/WrYsbpmxn2+5AiE2Zf/IGLaxJwwxQ4vz7onFiTEWzfn/0pV67DNhxh2t+dHCshinjLAy8nWqZxhyMcCa3bAHjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751961; c=relaxed/simple;
	bh=KquUcj0yy4UIql827S1Ctd9+3+E8Q4jB78n9fzRwyIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GXPG18VEK2jV0ZCb7GhpBaLpNM9FQ8261TihIMcin5W5HnQ+Abs2z09QmNV1FrvvZr3XoZk830sMa4tyTkYBid1835XC0xNoF2Tb4FRpuNtVAJffJz7L23+H3cn2kw9KX1XBAd2wWA//GUCiHv2YYpvMDjMtaqW5e8uOumxm4Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gjnuwc9k; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gjnuwc9k"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so4420182f8f.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751955; x=1791356755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4ypwwp7JTLk+2ivLn91M7UclGnNz67wo1x4IhoVtME=;
        b=Gjnuwc9kXtf/kiuWt9LCw/1FDvCecw4TDAoezRE37g/PQpCobTIkFPWG75+1KMbvzL
         HX+VJPz8Bfoa5m9KgIWXOYXH1xyJn4/fd/yL0F9k9B9k49PBA7D10W6AaA/tLq0V1PeI
         ePYGQOxzqdfBvpHQESGmJ+g0uaCFEKIVi2drka+O+btoEpE0XpC8jlElNDqGLrBYPhLx
         +Mz8qQe3ituF1BvZ2S3D2gsQcdoOPL/6XM4FVQgu7oC04BeJR5Y8gJo1y52EY0rZH6kk
         53H1uBTzH5Yp7vIMIlwaicRyXgvV8alFh1/pzn3xos3jvkoMYZsFxwh9W+gw3FHh5JQW
         ffuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751955; x=1791356755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4ypwwp7JTLk+2ivLn91M7UclGnNz67wo1x4IhoVtME=;
        b=Co65XvQGRSlSFONc35NukLy4xiXP0qqxqQztS04pdSNXMLn5dhjbR5I9InchUGvaRf
         bUXIy9CIIVhLx1XmBC0eP/THkL9XMhXCOuiC3zQkX8qdZfs+N7bEeBtanBhPY1qk/Pmc
         e0p92d0tPEFU9HxuG0VDXLGa40iPYziyR598TAWl90U/BezyH5p6dM3TmZSBR1yctudY
         uf8KtKhOyfS0+tozzQYQGQl8V1KorlTNVeDpVVUBDdlziYqB4fZonIF1DKXh+oVm1cFk
         uc6s0F24e0QHypmR6shF/2VQDICereR6NGPPLP8XBJtkz7ALabvyhdpbJDlNVhNG0jIj
         JLNw==
X-Forwarded-Encrypted: i=1; AKwUvBzqBlsgKN7xuAaNXqFpw1eDoMoPR42a+Xc2BOP3AJVOueLcv7PwOGf43mzyZdLz3cvChdtetjU+3STE@vger.kernel.org
X-Gm-Message-State: AFq9FYLlZEKtoWE9uOJryIha4Wj5dL2UApHXENy1Sq/TLc4gBA/tPZNe
	3q5vZX/OPxuDmqWh6sEd3BZUPxJvGRViCNJcAP3AuMxhfZWgt86PaFIg
X-Gm-Gg: AYBFou2j+FyliuZt7vIfPUWyt5SBqREj1HhlqoViipfmcKwIBH5A/q19OCSeSNBAZ6G
	cSykjCPsYgYQi9LRNHbJAj+2ennM6SkvqGQx8qqwEY13ion9BzlKQq0bmcHfw9vkw6khYpjpM7o
	zsqHx0gmVx3u/HMNqNw/aTX0l0t/Pfu9jBNv1/r0+dT8bNbtNCXF+QfzPS1onNldlXor3/t4YV0
	2rLfrYG72CS4k7PB1FbFgdgeVjIhr5IZ/TG/OiQjiVgX/FnBfWaO6Fxf8/dFmiZMNyK71fEdeDJ
	f06HFaRpdsifqI0+RjnUDrPD33A9BaaK+hvBjfUvtY+t0u14ZURSOd2q9T3t2iDEDNGR7bszsZi
	iC/9lMp66VTv8R1xdBx10sD5ZBNhw9mngUOLK7JOWOekPs5PG1mfdG31I2HXFGmnCcLMK7hVQbW
	PgneGUhqChE6kDQG+LhL9MrW0WTg8kBLPzoO6F10i9YDdIrzGjGr0zFUGtHWc5UFEEL2x29N6iV
	4ahC91eR5uEUgpENlI=
X-Received: by 2002:a05:6000:18a3:b0:488:811c:c78 with SMTP id ffacd0b85a97d-48b024f7a40mr1076050f8f.32.1790751954748;
        Wed, 30 Sep 2026 00:05:54 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:54 -0700 (PDT)
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
Subject: [PATCH v1 0/6] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Wed, 30 Sep 2026 10:05:29 +0300
Message-ID: <20260930070535.47130-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (6):
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA and LG LH400WV3-SD04 MIPI DBI
    panel driver

 .../display/panel/hit,tx10d07vm0baa.yaml      |  55 +++
 .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++
 drivers/gpu/drm/panel/Kconfig                 |  14 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 396 ++++++++++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/cpu-bridge.c            | 427 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |   3 +-
 drivers/gpu/drm/tegra/dc.h                    |  54 ++-
 drivers/gpu/drm/tegra/rgb.c                   |  36 +-
 11 files changed, 1121 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/tegra/cpu-bridge.c

-- 
2.53.0

