Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903B38F934
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157679; cv=none; b=DZ5oLAx/CR/AfhCNxjPaq0YWBGlk9bMI9FO3riMNr2zmIMajFXxIsY3iCDeN8SBm2s001rmzEQOGl4Hi5cIKtv8TAZ18RdFnNpKCQreQsL58ZmLxlAXIWSQPQ9iqV8fLIfcdk0xP1VdmWkvO0j1oKHji3NDgBzLU/oWGoH70VAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157679; c=relaxed/simple;
	bh=/DOBJX7XFLWsDwnUI1HlUrDG/cRXSQ6uEuBQgCsasgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BlW3oyMMrXTsI2O57Mqwnlg7v6EFBxkQhL4AaxpQzfN7jjjBn5Va9GrJObo+DVmF8V4XsAyTG+ktKz5ANu6Rz4p685a8Z7NP0o5AFrcUqTPNRuViCwTTLTJaxjChW9j5TbGlmlmv4fvWYZFKnM3sA15z1xTEXM4gXaTxidc3Wl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao5Ii7V7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao5Ii7V7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so14293815e9.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 02:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157675; x=1783762475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7v5Pm7hcHoKncuVk3HS0rjh4rfNcOYchDGYsTPk7k5s=;
        b=ao5Ii7V7pnQJlQJEINRqnhH2jdHfvGrF2u1C5jyRFVmViu5/wU7GdDYiBrHpc3WcX/
         ZZM+kx1KTLfka8VSWD1v2i3ML0Cz/6qGYJE8TJnOL5Yz2itxgLJT4Pg8lWtatwA8prkw
         mWCIUoxzbuF0g71/QGCeeJ/2pUVLjuFhQ/OSI5NgMsDEIToA6ntpAUt3RQ6PsarjpHA/
         sHUxSirAn+8tyYgNhLE5u9ZUkwTbUL0jhZdoTrhR+Zb3zX1Iv2H5YwSfmC5QpLW1+5nO
         BvlpXwgwAUt4kA3RYlLPi6SVMbS/0WLeUK+oU4kHXFxhO18CukMupPVeZ3BgOVwe/YYg
         e9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157675; x=1783762475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7v5Pm7hcHoKncuVk3HS0rjh4rfNcOYchDGYsTPk7k5s=;
        b=SVhv0UBnei/ziRBHnKa/HEMUT4zbMiss6DK1IkXIBQqPFmmyqRJTaR7d/q3bgmzk3i
         IaPOp4bPgN0fyuWrvDCjgwJ+JfWUdYrTbAyVPwllrDnUIiswv/tJ4FhTWayZMW3frFkZ
         Dxw6ih4BT9ywcN5bS+dHWnUXDiwqwWio+1qTUqIPoSHxUPspXFdidCgYakNKfkXPYXSw
         KyZuMOGbjSqW/YO+OUk7N8HVQbCraP9SP26at4BwbMOrsTXRTtjaqJS7LZdObiw9OcNa
         xPm60Do9P4+JyzHYy9ygXZKee9kOLowkXPQ2wdbtEb3J2WD3kzYsrMCtHeWKpc3TP7wd
         4shA==
X-Forwarded-Encrypted: i=1; AFNElJ/DQ//aAHGeX3BCJmAlfNurVIZSEsmPCpnXzLu/MRXTu2jpvmeCZ9PCQW8i5C4z+uVJkif0GHSYIuX4@vger.kernel.org
X-Gm-Message-State: AOJu0YxxCkEoP16oW/yNmkGFFRJLaAYRDb+vh9N4K3cvLj02rR17OnRF
	2CbNPqZ4K6+7dZXRg7jVdkC4cFF1mM1CW02iDpoO++wFKQbyZ+64hHPP
X-Gm-Gg: AfdE7ck+7Yo9OLuegJACN0nK7E/6UGVZfFrjqYdEfCLXZR4Bub4cxh0KWaIEs1H72OC
	7CuSFOUwKCr7XxCmTywyte1bGlqqNQ3gLx4978DPvrDSpWX/noM+CVP+ohF92u+UCAmeu7GL/VE
	zN/MuOP3nsVjeqGn6pnm+XcqoEeQCAVAlF5Z8xDQrlHmuyiFRnKNDLeWWenAKjk/oay4eZgnFIv
	JemsTjUDpbsdN90lf5sIYDxLvJHQMtnrrPaMZ3ntrOmTh9mFDpnMgeOLHRSWYwSayow5LWw9FXn
	wMniu5I4gKCuUTf+2d6sBhpngHnRSlfwlU45jIuWahZlp5hGMpI0j+SuXtbjXiGL660SlxlCdVs
	dOTkQSymUAlColCNH4K9OuF9qjfV2r8LspFjohgzhV9Po6D9KtsqZIFsAczMB3HRfZO0Z1UBRER
	zjKKhdaZdBmHkzW+Jh8Qu4
X-Received: by 2002:a05:600c:8b76:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493d21f9075mr19743205e9.36.1783157675277;
        Sat, 04 Jul 2026 02:34:35 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 00/16] Add support for DU, LVDS and DSI on the Renesas RZ/G3L SoC
Date: Sat,  4 Jul 2026 10:34:10 +0100
Message-ID: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add DSI, LVDS and LCD support for the RZ/G3L
SMARC EVK. The RZ/G3L LCDC is similar to the one found on RZ/G2L, but has
LVDS support. It is simpler compared to RZ/G3E [1], hence sending
this series to get review feedback. Based on the discussion on [1],
will rebase this later.

This patch series has a dependency on [2].

Also, the LVDS series [3] is merged here to get an overall picture.

[1] https://lore.kernel.org/all/cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com
[2] https://lore.kernel.org/all/20260619164030.380098-1-biju.das.jz@bp.renesas.com/
[3] https://lore.kernel.org/all/20260625172359.292631-1-biju.das.jz@bp.renesas.com/

Biju Das (16):
  dt-bindings: display: bridge: renesas,dsi: Document RZ/G3L
  drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
  drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
  drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info
    struct
  drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
  drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
  dt-bindings: display: renesas,rzg2l-du: Document RZ/G3L SoC
  drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
  dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
  arm64: dts: renesas: r9a08g046: Add fcpvd node
  arm64: dts: renesas: r9a08g046: Add vspd node
  arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
  arm64: dts: renesas: r9a08g046: Add LVDS node
  arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
  arm64: dts: renesas: Add LVDS overlay for RZ/G3L SMARC EVK with
    ITE6263

 .../bindings/display/bridge/renesas,dsi.yaml  |  15 +
 .../bridge/renesas,r9a08g046-lvds.yaml        | 120 +++++++
 .../bindings/display/renesas,rzg2l-du.yaml    |  27 +-
 arch/arm64/boot/dts/renesas/Makefile          |   6 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 140 ++++++++
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       |  95 ++++++
 .../r9a08g046l48-smarc-lvds-ite6263.dtso      | 104 ++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  22 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |   4 +
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |   4 +
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |   1 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 206 +++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 299 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 16 files changed, 1072 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0

