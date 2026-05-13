Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FDF246788;
	Wed, 13 May 2026 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678279; cv=none; b=RuMWJY9yq7MWEKGnQgS5Bnq2VtiEOG+a88CmNPelwTt1rz1uJZSzlM1QPD73CPrh7Ibp1kesdbZYmDiMnswuFkr45mZ9NS+1LEg19n7v/bnocB64FItbNV8/3ToDFqUMNxvPrEk+uuQLrOICddgsO7x+rkyv7JB03qQItoX7u8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678279; c=relaxed/simple;
	bh=D0U2DfmPUndQqwQp1lkTtwMeBcRl3wklL6U21sa8dsU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u6QZMs/gFtbLXXiqaYhyDswOZqzkvTUAg3tFpkiYV2m87WT+UWOcIj4RigM6Fd8Mor3QEXdEi5FHdx5OT2JK6mxY8duagZrrGi+WmgqImYB7EKxLTZVZl802HKlt531ukczAxlg7XTA7700I1mHHPBwOCjOKiELMWn7ZoPZDN5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kk7SzXQ/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kk7SzXQ/"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C8A6227A;
	Wed, 13 May 2026 15:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678267;
	bh=D0U2DfmPUndQqwQp1lkTtwMeBcRl3wklL6U21sa8dsU=;
	h=From:Subject:Date:To:Cc:From;
	b=kk7SzXQ/DwW1a3KfFYJXyMtn4M6MwZxU3gnxBIj7P6ax/byk8g3Rc5FTsm9jKfvUb
	 Zz0uQtLur/tX5bO6Weg7ieUFb68uVuZmHSk46VQLttcoYkdf6DexSJdfzQGYPbqtud
	 Id18jYRojClZKbAZizpMpvfe4ei6Jw2EQUfYWaSM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/16] drm/tidss: Add BeagleY-AI display support (and
 some more)
Date: Wed, 13 May 2026 16:17:22 +0300
Message-Id: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAON5BGoC/32PQW6DMBBFr4K8ziDbGEhQFeUeVRYGj5OJAk49B
 BVF3L0G9l3+L/33Zj6CMRKyaLKPiDgRUxhS0IdMdHc73BDIpSy01JU0WkKL9vbEGSyBI3497Qy
 u9lVhOoelNyINXxE9/W7Q7+ueI/68E3vcS9FaRuhC39PYZFOdy3XWI7PdhE32tftUqZQ08pTrs
 q6rogAFDA9Lg7qMlCfAWayCO/EY4rw9ManN8N+9kwIJvtLH0hTOO2Uu5NByGNpgo1ux4rosyx8
 Pa2e0HAEAAA==
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
 Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4653;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=D0U2DfmPUndQqwQp1lkTtwMeBcRl3wklL6U21sa8dsU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHn7nQnNzqEKujE7aAPVWJcf+n+08Wvy6Hp7l
 MG6U1H258yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR5+wAKCRD6PaqMvJYe
 9Td+D/wJP8PUqRIr4BR3lGZcLGRREbADx58sIVrSLS7LabWOM9he9OrpqjDHtmkq0zmJoTQgH2d
 poApfiVoIIMymVU30yE+TY/mFjaLi7VDu1oI5KYVab6KuQevF/w9RBtP5586P274oaqVW5oNIre
 Owz/jrTnLe1hy7nUAfr+ZNxtQiXiQuYL0tv+QtkWMRgPK52kfTo/JD5XAgyGpGDGbSIQsKi4lA0
 V5a88JzX7nj3IgGi9wFieAzazs0aznnSdSkBVqbYDCuExbK3LsNBZnSMbG0zpxiKERqG5evj0zz
 o6OPmhB8cs8Pu3KLHG8JefqV9o6yOcfPBfpTjB/+4s7QwwCJxifYWzvgJ6I36NR/afjPKEBvlCI
 9/vgkslzELfKIKHTx7xXCwQpOiiASvOutKeE+yEqFnnOfENnI7GDtlUMg4/EK567ckz/FjNfNpD
 Kyxx6Tm8OVi2E+a0N8gBys6kbEu+/UBmqVbT0MxrV8og59m2QMCj7zgYwam551AkeTkm2V67TZy
 C8UDS2ZXsisUifIS0VRIpRW9oxVZXNG6WVX1krYzRgULUEqPORLvqyBfr+/Rw9Q3uYjlHkesN4K
 aO0v9bGGPvuCFuEqe6AzkJ7Z/aDgySSrR3YZwRVVyXlDyGEQfx73wIWl0m4R9xOCxS36Xd2FMxw
 YIIei98s9CJBsmw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This series aims to add display support for all display interfaces on
BeagleY-AI board. More generally, it adds display support for TI AM62P,
J722S, and related SoCs, and, as a bit extra, improves AM62L's DPI
handling.

The main topics to highlight:

- The data and sync signal polarities require accessing a register
  (DPI0_CLK_CTRL) in the CTRL_MMR block. This has already been discussed
  e.g. in
  https://lore.kernel.org/all/20250730-fix-edge-handling-v1-0-1bdfb3fe7922%40bootlin.com/.
  In this series the whole CTRL_MMR ("main_conf") block is changed to a
  syscon, which allows simpler access to the DPI0_CLK_CTRL register.

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
Changes in v2:
- Add Rb and Tb tags
- Drop "dt-bindings: mfd: syscon: Add ti,am625-dss-dpi0-clk-ctrl
  compatible", which is now implemented with the below changes.
- New patch "dt-bindings: display: ti,am65x-dss: Add ti,dpi-io-ctrl"
- Modify "drm/tidss: Add external data and sync signal edge
  configuration" to use the 'ti,dpi-io-ctrl' with offset.
- New patch "arm64: dts: ti: k3-am62p-j722s-common-main: Make main_conf
  a syscon".
- Modify "arm64: dts: ti: k3-am62p-j722s-common-main: Add support for
  DSS" to set 'ti,dpi-io-ctrl' properties
- Drop generic desc in DT bindings for power-domains property
- Fix pm_runtime_get_sync() return value check
- Link to v1: https://lore.kernel.org/r/20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com

---
Andrew Davis (1):
      arm64: dts: ti: beagley-ai: Enable HDMI display and audio

Jayesh Choudhary (1):
      arm64: dts: ti: k3-am62p-j722s-common-main: Add support for DSS

Swamil Jain (1):
      drm/tidss: Add support for AM62P display subsystem

Tomi Valkeinen (13):
      dt-bindings: display: ti: Move ti,am62l-dss binding to a new binding file
      dt-bindings: display: ti,am65x-dss: Simplify binding
      dt-bindings: display: ti,am625-oldi: Add optional power-domain for OLDI
      dt-bindings: display: ti,am65x-dss: Add ti,dpi-io-ctrl
      dt-bindings: display: ti,am65x-dss: Add AM62P DSS
      drm/tidss: Remove extra pm_runtime_mark_last_busy
      drm/tidss: oldi: Remove define for unused register OLDI_LB_CTRL
      drm/tidss: Add mechanism to detect DPI output
      drm/tidss: Add external data and sync signal edge configuration
      drm/tidss: Add support for DPIENABLE bit
      drm/tidss: oldi: Fix OLDI signal polarities
      drm/tidss: oldi: Convert OLDI to an aux driver
      arm64: dts: ti: k3-am62p-j722s-common-main: Make main_conf a syscon

 .../bindings/display/ti/ti,am625-oldi.yaml         |   3 +
 .../bindings/display/ti/ti,am62l-dss.yaml          | 136 ++++++
 .../bindings/display/ti/ti,am65x-dss.yaml          | 187 +++-----
 MAINTAINERS                                        |   1 +
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    | 111 ++++-
 arch/arm64/boot/dts/ti/k3-am62p.dtsi               |  16 +
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     | 197 ++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  16 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  10 +-
 drivers/gpu/drm/tidss/tidss_crtc.h                 |   4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  49 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |   5 +-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |   5 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |  54 ++-
 drivers/gpu/drm/tidss/tidss_drv.h                  |   5 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |  55 ++-
 drivers/gpu/drm/tidss/tidss_oldi.c                 | 531 +++++++++++++++------
 drivers/gpu/drm/tidss/tidss_oldi.h                 |   8 +-
 18 files changed, 1104 insertions(+), 289 deletions(-)
---
base-commit: 3131ff5a117498bb4b9db3a238bb311cbf8383ce
change-id: 20260420-beagley-ai-display-d7f634cde5f4
prerequisite-message-id: <20260415110409.2577633-1-s-jain1@ti.com>
prerequisite-patch-id: 654d90f9cddec8b41e6fb1b3776a632606fef88c

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

