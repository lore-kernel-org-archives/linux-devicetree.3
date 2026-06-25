Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C88C3EA97E
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 17:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782408246; cv=none; b=oguko8o/3w2n9TEoN5iWj7VQVYuYd2umwuL2OLwmCXjTEaPQW3KkmjF7yBWciMx3ksH4ekJbOJh6S6Q7v94KnmHJPwGZRBiwLX1uwPATZUsJVljDszLxHe+wncm3qxDCntcN3Z3CaTwWylkZtACcYn+Jcq/QvmUfKMNwsfgRrzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782408246; c=relaxed/simple;
	bh=BnZyledwajI7EV7MoATy0MicsPRLg2sl6XVKHLKTm0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dw7BMtK/XGzX11srq5m9Oobmk4ccwW2LXinBmjnEAeUn0bu5ZeqlmeQU/IlbZN7IZtEu7IsoUgUXXq6+7pgZ+XkcGX9m9ptM76Pv9J8td0hu+EkTT4SeUxlDf5R4Fid2pnvGO1DWBJsVibqkcyR/0cXtlIc9/hMFu+8Tg7wmwmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmm/kJqs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmm/kJqs"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so891205e9.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782408244; x=1783013044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsMZVPfVRATp7NVDC8FWrCYbdkwciYq6TDikcpY8QOc=;
        b=jmm/kJqsRPR5ShGgY8pOYrBBMqgRzMsd0xNCgkCuyjATrwMxCvX/K9RBWtwqWoGRp5
         cp7RUSIgvKGmEjUjGEW6ryWIILdSPC7nyt8CKfCYbk+F0NhsB+oK+17azM3j2uPYWZCK
         ags3VWxp83jrNwmo+uidgUnFDiXzHA7LmMA2FmnTUOMW61Ye4t0b3obq1GINXeMb7h/R
         FPhUjofqxKAouBKCqhBUfqhIlPqlynzgLZyRKwkKgO/Q5EGu8xrtFn6TmGL7DKmhhO41
         JKPGNPH5tIcZHPjYjydqLJUHrfEoVtb13aqf7sRMxffp7c+ZEQnFwNGEmiUFfSfNfZxo
         Jx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782408244; x=1783013044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsMZVPfVRATp7NVDC8FWrCYbdkwciYq6TDikcpY8QOc=;
        b=Sb81wvd2XSjSS1uQCbGthk7kYMh5UGq6UN+Pky0yI1NtbLuScUe+lE7gk/qSkB9Huk
         0Zya4rV/OuTfbu8DEEJEUs5jv+oUbcy6DnzZx6sMvUn5DqvmAodkUBnxJzcMo8TchCwD
         3q5lZRwi+Y/a6Z9XZOSlfgkQGj8bNGOSu7abye7w8XcFTapVyIzsuWD3yYtxWDbe4PC4
         EthqjGzVAWq5q7pYdL+spRwPp85Cbor6D7n7pAQFAPWjeplD7ZlzPzJnbrScwVdlygWZ
         0IU5INq6XxY9Xp0C8rtOQoVMmlZo0zZk5/0QP6x2C9yhFj/olPULihwHhj3go7/AgfLi
         svlg==
X-Forwarded-Encrypted: i=1; AFNElJ+09MnIl2JbiiAV//8LeBtxESEaC26X+bEC1MryuxzW3s47Id7VkYZ9/eWa1EKnAqVm6MQM1CCsYBdh@vger.kernel.org
X-Gm-Message-State: AOJu0YzUBTe78ruS0wGmxD+CtKSW7vw3XL4yv+7MDmiZe1nLAxhGRd7N
	P7mLnlb+4lPAHFnSnkxTvWtsEEAQNswsnpn56XDpMKFzC7ZUzmA+JFEW
X-Gm-Gg: AfdE7ckr2jYvPv52QjmXpd8X88k93pLeXT9nK1vZI95bezsLLLwyBnTyGoQ4oqdfnjP
	XmDjfnaTqFErDlJIHASLTr8/Vh95tXbtep9AP7zh+z3qH/vYcR0jEvyVCoGKxsBn+1d6Ii2rWuI
	Dli7xp56ZnGDYGW37oeTp0dm9tOBAh8cNzCD/NzlA/AqJi/RQppaGucVqQtQivOzCmyId38ya4I
	20lQaDwkOklb4rBWWxdAL7OMTKmbWtWbW1h0TOrR3QMe8Cilqim8OjS5n4u1uZ2I/pFQ4TBIeWD
	rg8arEiGSzBdbPp/nHhnHiBNg3BY2fJvurY96WZdgQHRKrhlZe0qas7pNrS0Kzz+UfImVgEsr/v
	e5Yypo2E1fV5EngNUC3q4zySLDwpMlYJLsDaM5PYBQzLA7VrkKDk8EURfep6lwoIWapJOQh/2QT
	bbFHm66uv3P8pymh1qV3AyHnCx9GleR9MSZgdB
X-Received: by 2002:a05:600c:c3ce:20b0:492:62eb:ebe8 with SMTP id 5b1f17b1804b1-4926686638emr41836615e9.16.1782408243598;
        Thu, 25 Jun 2026 10:24:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:6aa7:b2d:3460:b689])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm11167265e9.4.2026.06.25.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 10:24:03 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Add support for Renesas RZ/G3L LVDS encoder
Date: Thu, 25 Jun 2026 18:23:47 +0100
Message-ID: <20260625172359.292631-1-biju.das.jz@bp.renesas.com>
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

v4->v5:
 * Collected the tags.
 * Added Kconfig functional dependency for DRM_RZG2L_DU
 * Dropped DRM_PANEL from DRM_RZG3L_LVDS config
 * Dropped unused headers of_device.h,of_graph.h and drm_panel.h
 * Dropped the unused macro LVDS_CMN_RST_PHY0_SEL_CH0
 * Used plain number for macro LVDS_0_PHY_CH_IO_EN0_MSK
 * Retained the tag as the above changes are trivial.
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
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 282 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 5 files changed, 441 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0

