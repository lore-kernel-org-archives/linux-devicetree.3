Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0B367B72
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863837; cv=none; b=b7IZiPGVEL2rmLFpx0naVxvmIzbn8j8qIl4yGwtxdfh/xEeCcVMwzq0A3p3+5VN14JLRpNPM8fSeFHbMvCpmdwX59g1vRykypA7ft43uBpGDKv4ABYAMXEgVTC03TAHF8C9bNc1lzuPHuZ1hlvOPM3K3PDZ/UBgfeZL1lNiIW2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863837; c=relaxed/simple;
	bh=XEj7Qd+j2mrxj3zwZ3sDbNuqdCspD8yz8XPgs8fPcdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/XN+vpZ+ly6x6kED7gV/ipt3kHje2/2HbEsWqh1H45xoPdnYmGf+ImJJk6D6ZOf36lDneCIaK2T62EhfZpcZduU/mVfFCcUw5Rxm665qNa4fY6gawiwEUlwsRE7+mzG+G2OCrs+iwdPSvque3WPbye5cNCuAb66wfnO+hw7MLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NObtACIC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NObtACIC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b64c8311so17900665e9.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863829; x=1782468629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7PzdOlm6ppimpgT1Ue/GK7k7tsgiFLY2bjtHZ0QZ2U=;
        b=NObtACICqd+vkEo990A1QRbAlXwXgWqYRAymU/yULZQ01iULN6pLtYoQU2NWUkpRBS
         hXmpVw1CbP4SswSphg0rB3UKMPg1l/CZQ+jkqlCofKIdBm5UAuHKdyKfSgZLeBtqZMVo
         d1vav1fCMOfegguMF5HBZf2heoKp0q4RLagC0K2mbUYuS4inEMWqQ/Q9IET/q1ctzvSJ
         BNbn29h2DO3p6+EHwh1jALGVqOi1qfIsj0AFL+QjwEMumXCHKLN652z0I6v2vcmgL5JX
         e6MzJrc33lklFGPy0s+1KNkS+wCsLuhhuaWg1VaB4z8amRyZhpQpirbs8orLHEu7rY0j
         M/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863829; x=1782468629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7PzdOlm6ppimpgT1Ue/GK7k7tsgiFLY2bjtHZ0QZ2U=;
        b=b+YWj1DevUOYPYBiATgIXNVIwbYWNb/ss0P5j0fGB/I03XV+GfMBCu5Oykl5w+eXNA
         FWMx2i41ivFHEgcDBEgpjiALrXOQYQMtoHjgMvuFoxqGSujKLG0wC+jOvWq+jSj75Iv+
         4MxnceYPHmq/tR2dAFcpP+B/2ue7bTYMWLziiycszQB5yD3XLHeatXD4hQqL8zwvl7Js
         5kH3oSFmdxzKdvseyCOz/Spj+gVs+iwhpxv57BqwEtRDP2ADm9uwRymZhwRoDlbGhMDj
         bqSh+RUhCq7Z87c4NWsF5OQ0Uiu6Y7T09AHrb7kLte/KLZlZo5mzb4dLJNyDJoYmwYkN
         j7zw==
X-Forwarded-Encrypted: i=1; AFNElJ/9J9kBPtDOY1aAooXWfBX9h38ZpmJImHXHggSANlkay3RU2KWGDGAyHrSDLLTllaFh0fhMUYZoadJo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0usii9+kVT3eqrsmnB6/omP0Dxqw2hpbrPfDntK/qC5yKCecL
	kXRTsuCdeFt1ZU+RpkQ7WDlz53pB2x/vv9UgS2F5m+Kc83/FoES/7ke9
X-Gm-Gg: AfdE7cmeXuhXYqjq1IV85UXvXvGh2fCtZVvYI8vRTSpE3OAkqrqRb/SKJVv8KeyzOlt
	5kAkFoIelgf+wRo5U6+KHxqvisXz4wFYfqKMG8NUEOKfC8XTSTZ4pqCLYwPIrU5e3wEHWzkSj4u
	4o6J8HfZnMBykFPA405APxtzbVnbkI1H6zb/o7hVADn1+ofSnGmtbDs6knU3dieWWiIYgQ7HEsi
	YDJ9fdzHx5YUFn+kvES/gxiJ9pH07kC1obDgpIjFjPdVkFY2bw/8cur6WgmUH7Zoei2gHkyhwD8
	B4EdaR6B9XaWyEI0OIRTgRI5PsHQlj/teYZFyj+u2ku1vERMoRSDI/PVY/0DUfmhZO7AKBCoP3c
	nc7Sd2rNnFhb6sH6hdfrsjWKg93JHgO1lKAfaGMrERPu+1D6FoaEP1diUFDKSEpqp2UOOSY2l+n
	C8zhqsRb4Z4dqHQMC+Vg==
X-Received: by 2002:a05:600d:6451:20b0:490:a646:9d77 with SMTP id 5b1f17b1804b1-49240dfe0a5mr34801065e9.6.1781863828461;
        Fri, 19 Jun 2026 03:10:28 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:435:f63f:6fb:bfa4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcdd08esm34577555e9.0.2026.06.19.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:10:28 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add support for Renesas RZ/G3L LVDS encoder
Date: Fri, 19 Jun 2026 11:10:15 +0100
Message-ID: <20260619101026.323633-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

This patch series depend upon [1]

[1]
 https://lore.kernel.org/all/20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org/

v3->v4:
 * Reworked bindings, dropping parent node containing simple-mfd and
   syson.
 * Dropped the tags
 * Dropped the header files clk.h and syscon.h
 * Dropped next_bridge check in attach().
 * Dropped syscon for getting regmap.
 * Replaced the below macros to match the hardware manual:
	LVDS_0_CTL_FMT_SEL_MSK->LVDS_0_CTL_FMT_SEL0_MSK
	LVDS_0_PHY_CH_IO_EN_MSK->LVDS_0_PHY_CH_IO_EN0_MSK
	Replaced LVDS_0_PHY_CH_IO_EN->LVDS_0_PHY_CH_IO_EN0
 * Replaced atomic_reset()->atomic_create_state().
v2->v3:
 * Collected tags.
v2->v2[1]:
 * Dropped patch#1 as it is accepted.
 * Replace drm_atomic_state with drm_atomic_commit in
   rzg3l_lvds_atomic_{en,dis}able().
 * Drop local variable ret and dev_err() messages in
   rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
   capture unexpected failures since atomic_enable should not fail.
 * Drop local variable next_bridge from rzg3l_lvds_probe().
[1] https://lore.kernel.org/all/20260524194457.479681-1-biju.das.jz@bp.renesas.com/
v1->v2:
 * Collected the tags for binding patches.
 * Dropped unused function rzg3l_lvds_is_connected() and removed the 
   corresponding header file rzg3l_lvds.h
 * Dropped next_bridge from struct rzg3l_lvds instead using bridge's
   next_bridge.
 * Replaced pm_runtime_resume_and_get()->pm_runtime_get_sync() as
   atomic_enable doesn't fail and for each enable there always will be an
   atomic_disable() call.
 * Started using DEFINE_RUNTIME_DEV_PM_OPS for PM callback.
 * Replaced rzg3l_lvds_parse_dt() with devm_drm_of_get_bridge() in probe()
 * Started using reset_control_bulk_*() in rzg3l_lvds_pm_runtime_{suspend,
   resume}().

Biju Das (2):
  dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder

 .../bridge/renesas,r9a08g046-lvds.yaml        | 120 ++++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 285 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 5 files changed, 445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0

