Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107083101CD;
	Mon, 20 Apr 2026 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689677; cv=none; b=BWIiq2ab8VwDcOG2mp3onrNLz/v/ZjHu9jK3P353CfuCvizozokKnO3jfPTGwr2BcInTEl7vW8hKAv5BKo3/owWwTmf3udZipzT3rMnwlpQk/6Yud1uyHqecpiITpa9pWuK+TBtPvlcCwYrIea/QljWZQiurzBhRK3Gz9FvhLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689677; c=relaxed/simple;
	bh=SPfFH8+39ZVwGuUGhL1G9PO4gGk437bMONSIMMQSxzw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mTv+7WL76QfPqEbh7Wo4lvLd2IfeD1RdoQzl3HUVcFpcVdK6MJ6HLh/gp99pL+B6CniuD96rlgYMfRrEg9VbizGh8/UJjSt0nA7gDyU1Ez/izkC1QNlnsriwLK+mAPtBVg/R/hA4l2cE6DEQntIvuLXI2+b7SiJnlYLu4qKrEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CvcT5FSj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CvcT5FSj"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39D2BE45;
	Mon, 20 Apr 2026 14:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689577;
	bh=SPfFH8+39ZVwGuUGhL1G9PO4gGk437bMONSIMMQSxzw=;
	h=From:Subject:Date:To:Cc:From;
	b=CvcT5FSjT+2k57n6mCitaZuoHk9fLpEqeqh3b2fKvHkLCiIC+3yqzMphMqJP/BszR
	 K1+J71YIBLr2GeTFv1GFQH2pjoCJFt+RLUCE9eHZGYYvdqc27c7n9F7t12IeyqwOjI
	 o6hWDIgnsWTWdlEUCgpKEfp6GCS1t3K44om9OB+k=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/15] drm/tidss: Add BeagleY-AI display support (and some
 more)
Date: Mon, 20 Apr 2026 15:54:07 +0300
Message-Id: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPAh5mkC/yWNWw6CMBQFt9L020vaUmgkxrgPw0ehF7xGHrZIJ
 IS9W+FzTnJmVh7QEwZesJV7nCnQ0EeQJ8brh+1bBHKRuRIqF1oJqNC2L1zAEjgK48su4EyTp7p
 2mDWax+PosaHvLr2XB3t8f6J7OkZe2YBQD11HU8Fmk4j/rcMQ7B4s2OXoyUxKocU5UZkxeZqCh
 ABPS728TZREwZWX2/YDU1sCLsUAAAA=
X-Change-ID: 20260420-beagley-ai-display-d7f634cde5f4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Andrew Davis <afd@ti.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3854;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SPfFH8+39ZVwGuUGhL1G9PO4gGk437bMONSIMMQSxzw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iH/P0rnvcHFC9KpXXljG3SIo4b19WVGZGxXl
 XPgCJEgENuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYh/wAKCRD6PaqMvJYe
 9ZxYEACfuyUNYDDVUrN+zL+6N2HGMJBvUjbouKBmYqpVm8XdHnwlhXjVYGl8g1AhA0eFMmR0DMI
 m4cL5k2j4y1d4p4KbQA/Jnp98CV8hdAGUXgz5GycDZv0esQ+uYxRnJmhW3z14RjwN6KtSr6IEld
 M24iU4jUOUVQgB5S9yb/3tv5Htdw1yquCoSw8UfTI8vZ6D/8qgsyQPv0QoWH8D6sNu4Sjze3gpW
 Asvoynn/upqqDtijnMupQpBdNnhBUQHe0dwIBhEP6XMTn2mDR5RklNAQG78It58ewW0KDB75MiE
 FWyrcFkWwPiSuOW5hHIPIfC480cV9rlMZDZM2/geZtptZcs4ALZGD95Mli5eRt02MiNQumH12BN
 3/u++sbL55y/zC0rvjmr5Mi5ST21I9td9ZGq85EESEyRbZg9hT6IH1SUMbXccfIpYqdx3yRuoD6
 mgI5DJ7UrTLX51xtv4qOKfVTMuflqWOVHQU47OUR3eM5kUQ1MDzk7ogk5AxvfUhAe2PrSwoDXVn
 glFadbI4W6sQRCe/ZBLjye4MDAfKwVQD5Y3GEiYpo/wUmEmVTaBalVgGh4CTuHIht5/n2MimWtw
 AKuEHnlkzfUcrfH/c4iIhA3J62uIcetVRkKZhcOdki4JALk6b2bZdu1csLH+XpmpJN0Uq32tin1
 NbuWiU4Nh3MO26Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This series aims to add display support for all display interfaces on
BeagleY-AI board. More generally, it adds display support for TI AM62P,
J722S, and related SoCs, and, as a bit extra, improves AM62L's DPI
handling.

The main topics to highlight:

- The ti,am625-dss-dpi0-clk-ctrl feels a bit like a hack.
  But it is a single quirk register, among other registers that belong
  to either the firmware or other drivers. So what other options are
  there? This has already been discussed e.g. in
  https://lore.kernel.org/all/20250730-fix-edge-handling-v1-0-1bdfb3fe7922%40bootlin.com/
  without proper conclusion. 

- The tidss OLDI support will now use auxiliary device/driver. This seems
  to solve quite neatly the requirement to have a power-domain for each
  OLDI. The main issue that remains is that on AM62P (and similar) we
  will have three OLDI TX DT nodes, even if there are only two in the
  hardware.

With this series one can use the HDMI output on BeagleY-AI. I have also
tested the DSI output with Raspberry Pi's 7" DSI display, and OLDI
output with an oscilloscope (I don't have a suitable OLDI panel).

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Andrew Davis (1):
      arm64: dts: ti: beagley-ai: Enable HDMI display and audio

Jayesh Choudhary (1):
      arm64: dts: ti: k3-am62p-j722s-common-main: Add support for DSS

Swamil Jain (1):
      drm/tidss: Add support for AM62P display subsystem

Tomi Valkeinen (12):
      dt-bindings: display: ti: Move ti,am62l-dss binding to a new binding file
      dt-bindings: display: ti,am65x-dss: Simplify binding
      dt-bindings: mfd: syscon: Add ti,am625-dss-dpi0-clk-ctrl compatible
      dt-bindings: display: ti,am625-oldi: Add optional power-domain for OLDI
      dt-bindings: display: ti,am65x-dss: Add AM62P DSS
      drm/tidss: Remove extra pm_runtime_mark_last_busy
      drm/tidss: oldi: Remove define for unused register OLDI_LB_CTRL
      drm/tidss: Add mechanism to detect DPI output
      drm/tidss: Add external data and sync signal edge configuration
      drm/tidss: Add support for DPIENABLE bit
      drm/tidss: oldi: Fix OLDI signal polarities
      drm/tidss: oldi: Convert OLDI to an aux driver

 .../bindings/display/ti/ti,am625-oldi.yaml         |   4 +
 .../bindings/display/ti/ti,am62l-dss.yaml          | 136 ++++++
 .../bindings/display/ti/ti,am65x-dss.yaml          | 176 +++----
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   2 +
 MAINTAINERS                                        |   1 +
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    | 112 +++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi               |  16 +
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     | 197 ++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  16 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  10 +-
 drivers/gpu/drm/tidss/tidss_crtc.h                 |   4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  46 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |   5 +-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |   5 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |  54 ++-
 drivers/gpu/drm/tidss/tidss_drv.h                  |   5 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |  55 ++-
 drivers/gpu/drm/tidss/tidss_oldi.c                 | 531 +++++++++++++++------
 drivers/gpu/drm/tidss/tidss_oldi.h                 |   8 +-
 19 files changed, 1095 insertions(+), 288 deletions(-)
---
base-commit: 3131ff5a117498bb4b9db3a238bb311cbf8383ce
change-id: 20260420-beagley-ai-display-d7f634cde5f4
prerequisite-message-id: <20260415110409.2577633-1-s-jain1@ti.com>
prerequisite-patch-id: 654d90f9cddec8b41e6fb1b3776a632606fef88c

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

