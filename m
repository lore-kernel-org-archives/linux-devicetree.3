Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9172D3148B4
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651903; cv=none; b=azryJni0SVsZ4J4NlhQ9jpulX13+BlwozPxAGCksxa8EdoZeGv9godO69vVQnWVLHZJfIdp0ZSlq3MAPQ9pbJRpN2xw/oRitaL81TKwhWga7yB1keVtfIwdRF1gr0x+EMf1fChCL6Xbi4UHTi9uhz3q5X/xZ/gjCzAbcxmwOOOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651903; c=relaxed/simple;
	bh=VHJdmXIvUpWwCeBmW1hqX+xjDz63irSbS7pW8W3Xxj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t9DbQ9QnZtler+xD/pIRy56jjuO6/4R4NbLxxQPLLiFbN3U+uMy8lUEU2il/3C74pE/Pcz+jcoz8zmM3KxD3zPoryabk8p0SdB+/XhRDwLR7cgckOOS+n0frs5sk2PSkDXTXnYnDoyhaXqVkTlzbbq74IP+rSVPif+4pJR5tNWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OL1Q9+fl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OL1Q9+fl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so23132115e9.2
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779651900; x=1780256700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j/qe6eXcru11RESfUWXlWO5BzYgzjlHFDTWv1yJEsy8=;
        b=OL1Q9+fl/6pqwHIvmoGv7LxGPMIMbCyrLB7KDKRK26KQgYoSWHVl4GvMG28kscAB8l
         FVrDEEJnsU+sj1JK17ofpA0bCaOsaPxWcivvjxLPcJIPiYFxQ+7KByNJ4AvJ4xxPvsnT
         15oP642LYvxtQkJfsewpmF2GHDjjShu0lx8VqUzHgMyQCKv9tiSr2j68sMxXle0tleB8
         BpBuhSRWY/jSBEvSOP238Z8IrdGyqJG36wJDy4K0X4tqAXUEEgcKTyWTtOa7qj2rDrsa
         t0pQ0SVDuCA9j5u1YSzmkaHr51jQ0wcdVvlVEUqQKZIJlRk0T1wi1vzN+dx3YbOSow5P
         1oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779651900; x=1780256700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/qe6eXcru11RESfUWXlWO5BzYgzjlHFDTWv1yJEsy8=;
        b=KUDMCJ1QvohrgP5GkVsdDsChcd3LdMX0m1JU4KvDSTphYUQDHy9fsjRFsgYPXdhnWY
         o35L8E1gNCy+ht9ujFocXyDqttAQegCALVGoB/MiSApfgdl821rmt5Fc/WL07ZvBDVxa
         zMFhoQuZHAYxSeoM1rfSYfPAGBjPSZ8uDl0RnOK8n1xmWYWd3WTdkbtiiqvJOCTYSmLF
         gA2jGbW1roqp5n535VwX9teYr+cloROJU27w3uLGdIdFhgKGCbdKDAOB33c+5quzMgBz
         FDcgTu2+0+xCC2zx1MOlE1gB3RqIHP4Erh9WbYaFi87u4mxRQ6xLtJp+JyZ3CyD8034A
         1CBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rQGLL4KP3DnB19TEEMC0iTT5x58Gm7pFDGez2mtO9dpAiDb8IdPPyezqw7BsPvz6iDKVYhk3AaSBt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xxHcMyvxtj3bM9txQZnEfo/0wvPBowp/7meroA4MQi4lE/0D
	/ErF1SUJjCiUAt/5RXo3UKJRc3MyhEfI8uX4KdXKsgkti37V3wHq/QmY
X-Gm-Gg: Acq92OFe8PFbnCVpuZp51vZKJhlNmyIiScgVJNi68sPD8sJRfbv5THBT4Kn4jBxXECf
	CMs1YXglNOoZNchFk9fWNMPeH+rxbJUP2IHd9/g3A2h44ZNmfeEkgLsBX2I2lqyI6rQ3sTfsdkW
	VYuGvqdmU19h1OLbF/UNxxg7haO8zCgX063QeCzen+TGXPXAV74FhHk87wFEnPBSW/f7eqki68w
	1dsMJ91CGF3yjSXYFccnOw9Blz329+W5IRGsul28Iu54NlnHW3oamgpHqTIseHpPE23Q3h/L1BM
	+JsDj5UQHQYgzR149VTncSsWlIYNP3smBNncjsrKIn4cKWKt6VmVqVNhUpeIRKJ/P7QOioPgVSj
	Ptvx/QoVzJECB1EHU+rqaeB6QBcjxsoi+14ZEiIHha4O+rhaJAr37VWFU8s9c1fQVkODaxB+sF+
	koGbtNk/tRVcavXeyOA+O93P+NybPlKpFrsp3SvVVD7g==
X-Received: by 2002:a05:600c:1f87:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-490424ad9abmr182880265e9.12.1779651899732;
        Sun, 24 May 2026 12:44:59 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a700:7301:ae73:a12b:ca55:91be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042cde62csm68224515e9.32.2026.05.24.12.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:44:59 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add support for Renesas RZ/G3L LVDS encoder
Date: Sun, 24 May 2026 20:44:49 +0100
Message-ID: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
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

v2->v3:
 * Dropped patch#1 as it is accepted.
 * Replace drm_atomic_state with drm_atomic_commit in
   rzg3l_lvds_atomic_{en,dis}able().
 * Drop local variable ret and dev_err() messages in
   rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
   capture unexpected failures since atomic_enable should not fail.
 * Drop local variable next_bridge from rzg3l_lvds_probe().
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

 .../bridge/renesas,r9a08g046-lvds.yaml        | 128 ++++++++
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 277 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 5 files changed, 445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0

