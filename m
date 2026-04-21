Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EAE304972
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792557; cv=none; b=OWlFPcO8WI7bfYTF/exVm9QL9rDBCK68F3e4q9evNLIGlsTAmjzuht/kxuMxRJbQXWP0BSMCDYdwTg9c/LeE5vvyiNpuaszPb3vsM0qgh/cYKGfC6kzrQDqawcCU/M8VNCtCRPDWcflJMr4yDhLN4mZih3gDD9CRHrhjNFQRdPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792557; c=relaxed/simple;
	bh=V5Op4Kb9bUj9/1lrNoPhIDD+MuXNuaLvvGNBQgMKUN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XHgJlDKBGbQzcN2RrupKUbzKjuihbttARgT6/Y0alwNEGXCuVxXaAdQyGYxlq9nib2/EA9yLHUNZDm3SI+hCEvkQKV9CBhBkOseh3QiR2UoNHvH8L6ObpH81IQZ0UK8+AO/6p/xYwNibxJUkwBibnwnQ5Rez6Yos5zmvWf+P+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V88MHnj6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V88MHnj6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso60865865e9.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792555; x=1777397355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18zwonTTNGSCTnLCCjEENQ9bQwbO5iLEoVwPTzytlbk=;
        b=V88MHnj62MSvsJPnzYnp/IjswQMVZCajy8prqJUyI6QyGJdOqbSjHiFhY92aXbZe8N
         ZShtGLbUVKi/qn78hUDsqi0/XgdGiTzmAuOp+MBn+AGsRaiEQrRIU8vSnwEau47O6Vc2
         lM0gtkL74H4pvV8cV8CS9o9mjGFvDyZqWnsnwcR+ubqAdFahaCf1EWYKJlk1uoeMcpjS
         9noQG3EqooZlHu1KwtTdwyHIhtxEpuOmu0jp+H0i4wEpD4LqpQWBk3t8gtxNKT9vR3vu
         64n1FNZ4sKtluFYN+G2KkZlEP+8J/XULzrAFxRAxB2hXF2WBRnHB8yZRpJB7E4q6Wbm7
         6X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792555; x=1777397355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18zwonTTNGSCTnLCCjEENQ9bQwbO5iLEoVwPTzytlbk=;
        b=A9dL15YdTMHfuw+fW/SlvDlC07kk6x630HZQfxJ0htNUbItx6p/M5Uzl1RPRkH79BW
         /F8rVeP1+i6rGXMVF/DMyQ/Ke8FPhftlmyEKcNJDbOf7psoIO/zzo85J48KhOzNfQm2R
         EmfziVaL6MeC5rpah5zvkpWDIk+pw5oSQ5T4s7nOOoL3SqzopxxzhDjMnmWiYEZaqL8L
         u4h8We+26AoaqwRgUrJzEZQ88fpD6AC0twSGlAo9w9XDNVfeM7Xs6gq9raN55Am8MHQM
         MR44F0aajusEj4/e4mljyHhTa/GRBNrswMgxmxFfEESPhd0LyWi6cl594UauhO6I14tD
         jsrg==
X-Forwarded-Encrypted: i=1; AFNElJ8jldS2Sk1iQVuTQ7YORVg8RTLmPQNJ/WWlzCTNFTWY+MOeFGD11500KL8+yXR9c6TkywJn3WoMKqv+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywng3oJKb1p7xghQU9swNjoXV/rqgBGPeOEZRfX1fhFYCkt49/0
	OhLwD4cwrRajUljbl2OZzib4sMNThU9yKEvLG6aJyWgRKcbvIFyFrdAX
X-Gm-Gg: AeBDiev/MQXLjOAAlam6hgZx1OhZOK6oBla2PpIr5iHCBvzh1ZTpVQkEzTyl1RtxpuU
	CC4FzwG1E1EMQfcAWGQglWEmNihjE+A1I7s7hhZodr6OUBVO+Dd4Y2dt5YQoZNBDjJQD8FOk07y
	aCWIoQ1U+ZGZDGj+WGgYvAHebZ/n1veK4eS79vuYBaFacSRK74cS9PgaTzchBOK5fGmM8f/sIp9
	k68sAfQ/SByyXdFKo2uy2Dqe9axzd+2Pw10gqC/IQ33LthhcsVyb1N0/LqjKqchWvW7p6R29fwp
	2salOqnJZ8MdpsqZHblLdqDt0Pf1XQD4UZ6Ln4kRLSXKYCOeWi6/vXEmllJKKVlb2pRkc0zadm/
	XmKyUnbWQ0JoG3mwS4ReUMK7hFuaNri6cBerC64pV6jrspotWXVnPjKoTUb5+uAHwtgNbbKvj3G
	uVLzPBItcU5Vpt/NLdRDZ1rS7hfSShGBLQZHFj/vAEvsSdtuaboo94OJRytiY=
X-Received: by 2002:a05:600c:8908:b0:48a:58e1:6d02 with SMTP id 5b1f17b1804b1-48a58e16eb2mr15879275e9.19.1776792554371;
        Tue, 21 Apr 2026 10:29:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:de57:c37d:677b:c772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a525a0b1asm57445855e9.2.2026.04.21.10.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:29:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] Add support for Renesas RZ/G3L LVDS encoder
Date: Tue, 21 Apr 2026 18:29:02 +0100
Message-ID: <20260421172910.218497-1-biju.das.jz@bp.renesas.com>
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

Biju Das (3):
  dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L
  dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder

 .../bridge/renesas,r9a08g046-lvds.yaml        | 128 ++++++++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 285 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 6 files changed, 454 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0

