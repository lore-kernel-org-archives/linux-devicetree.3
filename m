Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675401;
	b=nYq5200DIWdOC0x799uyVQZqypnGiQxlzddGzD7Oiv3GfKITwuvN4az9aJUtrV0VMzRx
	 uBXvfMcxy5LU1+Z/JRBDxWbTd3vKgsDC4tUeEeJn0cEmZpN0ZlkOrKKma1U+mWJmNq/87
	 +XGUPdjDd5alB6ukZ/29CXld42rU07qjGTYeS1u4jwXVuuEv5qmIPa2AP+HSieIb0ry47
	 nadRyc28vijAtDIzgv8XPY1KLTFwAo+FTnbUlhICU8hknqAHgb2kYFR/DcqBOIdXvuuMZ
	 Arx7Xv1h/qIIxVnDH4QAmvPtSb2fB90w2YsGJQ1UmIyHVg4m2ub3UiNN/PMnCHnWZjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5ZnaBjVx8QabD0XIo1C2JwLGY8gbe6s95hFqcHQRQqE=;
	b=h1Q2XA9i1slvbdFP8HMMoOUBaylpFxkGFdqdjwRgAKhYL0iGL9FLpf0GL+JinBr+jKuN
	 +O9IVgeeYQngSQbmhUIHPW8TxnhUngFOquH/lSdxxUnCO5dbLF9CH+zDDlwk6TPdnxzog
	 SPOQOpnwbr2pao5J3BUZFVedNmr6JpdODoOpdw2KOT8wnGqqvTwkFYZTDrK0PeIPIBskX
	 MTS2wcSSbmqyP+zFouvxR7SyXX4erkkI0BxbrrUDNhbvjNv38GLh6rSAbiX2g5wQzxLoO
	 iY+Nd1gAXjBKlJWaDKp4+y5zg/pqsqHbBxu2lSFH8i1tAmdoY2CZaNkCwDSSBA7bQpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8MI6MLW;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BFE606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8MI6MLW
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so1983754a12.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675399; x=1793280199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ZnaBjVx8QabD0XIo1C2JwLGY8gbe6s95hFqcHQRQqE=;
        b=M8MI6MLW/oqIYL7bAbSl5TvQribAzSirRqMJR1M+Mch23Vc0bcfaRA3Capnqy/K0MV
         oKeCoZR596AEAu8eVuWT0D6chDRJE53qezuNk+XD595jMmO9FAVQHGt/gveJno5J3NZe
         YwnfLv2VL75uDvzSA6GJwvmZ54DM3zhHj+0sMInHkrKTDAjv45qE95lEPhJkWXqVQTR9
         AN1tg1Ni6uB+yipZ66cqVWmSv5UOKWFr4tDOY0xy53WW+qDtM4svaONQgdmlZ5ec4gsk
         Tbg5SSdwoFGx50OYCvmv3NKQarwzCJ6ccdQvAi8iOaGMwmvEp2M2XmNMeYipn63Fg6Su
         nhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675399; x=1793280199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZnaBjVx8QabD0XIo1C2JwLGY8gbe6s95hFqcHQRQqE=;
        b=nmbE2TiHDZ77dcpuB6Z4gkMyxFSB7xjgP2JDOzmb6I8XH0fURAGBLDOA3nGwBY7kCr
         HsK4VKqotI8pmZht7HhNfIs8R7pE/Dml8Jb4FzG6OIIoSwkXfkR0P+G2RDLjJGa+SX7j
         h8VS6ha3nh4VPfq8pGMBxYXSS0A9jG2r0EpBC5ZcXdZGJn5YfqF7Cggu5qMErM6qQgr/
         TYPBUfSdv6wpB2OcxcSP17eXL+3lqigCMdcK0uA1a0kqcLnRxtpGhGi3A5LCpILOCBAU
         ZfkVhLqNBzGkzgkJ9oSihQ2McCQbYeHziFL1U9pF8Df465ofhTTKQ9XmiO0sath/camz
         qgvg==
X-Forwarded-Encrypted: i=1; AKwUvBxw5hC8ZRz1lT9WluM1YzyoIGXwUWY11BYYqM9+9/w3W6LdHNh204lZ0s6xw5/tAWDR0hhrsF3dww8i@vger.kernel.org
X-Gm-Message-State: AFq9FYIgZyjpuTWYAVtdqR1UCFjHlvd69Cg0aZjHCYiqs6JJ5GnXg1Wb
	KVvarWMtdCVkKvSM+Yk+U31kyF3o1p3FnA/4HkJpjWGNcO9XdT/Qr/8t
X-Gm-Gg: AYBFou0TLjT1un8pP4dIhqDiFoqS0dYxALRywbUe8/XTP+xQ+zKnLhuVKEDb/uQmoHa
	O2lKYvckGAeebfgr3nR2qtYDBtT4k+xifmrS8gxFPIppijmN11OZ58qOhu4BeM87/jQF/ii5Rtf
	SmAPjOOPZjqu0jskaiuuo4hgs8qyM2SGzXqCGcSPLHSjPkiLgINKq68O5IbuEQwcc6SmzbRLQlj
	/PSoSabfDBCEglgeBTSkv2RUr584MLAscUmxuKjm/Qqx+JIP31EOoRVQtOFxuNPuYEUJgSjv5se
	TIb0xa06hwnDmOY0ci9p96d+bG3p7j8hw73+e3hcW3UbV0washX79P/rgX9JlBVHJxsYM4FrYpb
	T3o/N0FRt27Z+/PDhdJR5O+AjWdFEUUwbCE55MW189TclWqEqardnIMg2jBlwI+EtbE6YnUOUf8
	Ullnks9WY0Afy25awRH5+Gfz2jeQFN8v/O44vPhLoueB4zlctGh9iYL9wHnjzROxKSvMVPKacCN
	AhV9fyCoxeW1GUcY2AeXoniJg2HNFnDn7npBb53HlTyHCMf7WsSmprZ+tyYkK3e6+NCfe9YNLse
X-Received: by 2002:a05:6402:64f:b0:6b4:2aa6:2c07 with SMTP id 4fb4d7f45d1cf-6b42aa631d2mr825748a12.14.1792675398767;
        Thu, 22 Oct 2026 06:23:18 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:17 -0700 (PDT)
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
Subject: [PATCH v4 0/7] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Thu, 22 Oct 2026 16:22:52 +0300
Message-ID: <20261022132259.240717-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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


Changes in v3:
- rgb: fix default bus_flags to match original behavior
- dbi-schema: remove compatible from required props
  remove dc@54200000 wrapper from example
  restrict dbi nodes for tegra20/tegra30 only
- dbi: remove unused idx from tegra_dbi_priv
  wrap dbi registration in dc with devm_add_action_or_reset()
  separate dbi into separate object
  export tegra_dc_commit() and trace_dc_readl()/dc_readl()

Changes in v4:
- reorder patches to avoid errors on checking dbi schema
- dbi schema renamed to nvidia,tegra20-dbi for consistency
- fix DC_DISP_V_PULSE0_POSITION_* > DC_DISP_V_PULSE1_POSITION_*
- add MODULE_ALIAS
- swap width and height in panels
- dropped use of init-sequence and gpios
- dbi driver reworked to use only DC to operate pins
---

Svyatoslav Ryhel (7):
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
  drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface

 .../display/panel/hit,tx10d07vm0baa.yaml      |  58 ++
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 108 ++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +
 drivers/gpu/drm/panel/Kconfig                 |  27 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 297 ++++++++++
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 236 ++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   3 +
 drivers/gpu/drm/tegra/dbi.c                   | 536 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  32 +-
 drivers/gpu/drm/tegra/dc.h                    |  50 +-
 drivers/gpu/drm/tegra/rgb.c                   |  41 +-
 drivers/gpu/drm/tegra/trace.c                 |   3 +
 14 files changed, 1403 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

-- 
2.53.0

