Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960AF39C01E
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506213; cv=none; b=QZBQypvj8KcoRVXAjqJ7XPvh7JYwH49pHXzY9PBQaFj794tRPU0D1Sk+Ato/7maObDG0OvU0rsoM75wb3zaAUy8W8vl14Cbk2di1buYi0NTac4PZSXdwHBbULf58OIMnTESchyso1PTKmK51NN+oSvfnqXYpK6umuQULG9ifSNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506213; c=relaxed/simple;
	bh=EU5sikuSxxZQMq8VLrXi/omfwefPxQAw0HObvrsR2UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpbPe+CxAnxq+iYYh1ltnu99LrTMr9FFPOyF0weprrNzjnhxsr1owMoCada8YIlKx/NiiVF2sIedqiXaVCTtlQcftHiSE0XA0X+eL2TOtUGBvAWUm7Zasjb4pTYzUvEtJ1v4HkzWRYHQ9FwUzNbtPgrbmFXbcqz5YobX0K+ODdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUF3aEYG; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUF3aEYG"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304df7ff4c2so2271841eec.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506211; x=1782111011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=su7U2CceZXD6mEz8ItmrZ6WCGP9Vn5IoVvW2JAEM0p0=;
        b=BUF3aEYGYE6w4kkRAe/TWThkCgmY46XuJpzJRZUFRA+omCop0WPY23zuDTLxb2OlZZ
         3GYNhfj49/hrQSOBwfz1GY/VgW3byArX+xFibScnEmkK/PpYNmRrH6cVTE4IErfgkIhk
         OK8PgqqY9zy2klPr7wfMyZjYSS5wMZqMSTO4w22aNWqHM+8/csrsqMCjmQPyxvOD9wbU
         CmN3jpd9gxlqGjWNENXhCjtQyoCbSxRXrX2lSf0BlMoWpGx5ejTYiZ2CfkDY6FqJY2fh
         Xrs1yCFuDyqQLX7ZPaqeTtHq7xP92uUsuXxAZ3MHLyhQXWPXJssqfl3m50iWB1BqHA43
         Wtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506211; x=1782111011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su7U2CceZXD6mEz8ItmrZ6WCGP9Vn5IoVvW2JAEM0p0=;
        b=mdLakjy2AYcNMGVtnWsoN3uYlOr51aiRC/DAT9MniAXgh3QLYb6zW9COoTDFQDRNVr
         J/basqC0bpewS8WHHpTeTW2sdDkQnlwG6TVLcse6Zyyspq2W9MBJkdqExbeGFinkQxoE
         2jNfpRXU1W1noSbMUu7LiQWZlRhxI6048EqWNWJp35TGpR9cs0Se2ZPXPU4aKB6/bPcV
         FuvBPi+2TqkvM/O+7gAxJrejRQVPQWQhb4iHHJJXoE+/wr41OudLQvf8sjQQaDUrQvjc
         IUh+JD2qNm6k8DRy3W2VJ3aeIZu7wGczpBQvJKadSivLY8x0vqeuTmEqzxtyhlaCEHud
         948Q==
X-Forwarded-Encrypted: i=1; AFNElJ+PMV2MgWWAx/JxVcGZM4YxZn7jxruCazfDUimUYM018ld1SMGWQF45xvxlowoNUm0XgcVrrlU/ubb1@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDWUaMfWXZpg+sIqFaqYjVET9us8LWALHBHy5WNVuMy0m6Gfu
	yziN8s+5Tx9Yol5UX6zOY3Y1tYVasc241Mu1cIIXh90UC4OJWka4M9ZZ
X-Gm-Gg: Acq92OFQ2EInOrVeEmxaykYcDIKmsjWXuCiUvoO4ZroCnC8srisCZDpj34xviUpo5ko
	zqT5fZMf3ZQANvBdAHHC0QIdzOza4beII6p3HPcx42SROTbZ/zjP+xy3cacpq0Sen0Z9zOcg9RB
	y7HLhkYNG3dWd+8BIRXR4r+Yisib9D+ERnaukF4VYUAt2qrJADjv5cfuafcTLnRzQA59nbIlD/L
	gkHGIZsGl3NiFuJg1nyvkf6FwC2YTYfM3EMNEeTymUg2LMQOKbK7Bx7A9BFAYP/GJkIyhYCAslX
	JdZ+81ZAMnqlyrHC4svnyy89KjT+FgFxhQgMp67sKe9yUWGnGu4Bk5SSaM18Czc7DZV70yjLzsB
	IQ+gZJmkxm11r/xnRwHTg2DSlrVx+6ZeGQ5sYMKeXdHexzXpLLQaN+0hMzcK4bvM6605zgTI5SA
	cLTmlvGajJkEW6Ooa4eOveLS+b/4WJXsENJDRVtZGKr4b26cF/rnpgnxtfNx6LNClrkXzngvKhi
	32/c9MjOa4z
X-Received: by 2002:a05:7301:9f09:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30820c2d782mr6607439eec.6.1781506210508;
        Sun, 14 Jun 2026 23:50:10 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:10 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 0/6] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Mon, 15 Jun 2026 14:49:57 +0800
Message-ID: <20260615065003.76661-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Verisilicon DCUltraLite display
controller as integrated in the Nuvoton MA35D1 SoC.

The Verisilicon DC driver and its DT binding were originally written by
Icenowy Zheng <zhengxingda@iscas.ac.cn> for the T-Head TH1520 SoC, which
carries a DC8200 IP block.  The present series builds on that foundation
with gratitude to Icenowy for the original work.

The DCUltraLite is a different variant in the DC IP family.  While the two
IPs share a broadly similar register layout, a number of differences
prevent the existing driver from working on the MA35D1 without
modification:

  - No CONFIG_EX commit path: the DC8200 staging registers
    (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
    PANEL_CONFIG_EX) are absent.  The DCUltraLite uses enable (bit 0) and
    reset (bit 4) bits in FB_CONFIG for direct framebuffer updates, and
    requires a per-frame VALID bit toggle (FB_CONFIG bit 3) to latch
    configuration changes.

  - No PANEL_START register: panel output begins when
    PANEL_CONFIG.RUNNING is set; the DC8200 multi-display sync start
    register at 0x1CCC does not exist.

  - Different IRQ registers: DISP_IRQ_STA at 0x147C / DISP_IRQ_EN at
    0x1480, versus the DC8200's TOP_IRQ_ACK at 0x0010 / TOP_IRQ_EN at
    0x0014.

  - Simpler clock topology: two clocks ("core" bus gate and "pix0" pixel
    divider); no axi or ahb clocks required.

  - Single display output: no per-output indexing beyond index 0 is
    needed.

  - Hardware-discoverable identity: the DCUltraLite exposes chip identity
    registers whose model field reads 0x0 (revision 0x5560,
    customer_id 0x305), allowing the existing vs_fill_chip_identity()
    path to identify the variant purely through register reads.

Patch 1 generalises the verisilicon,dc DT binding to accommodate the
Nuvoton MA35D1 SoC-specific compatible and the variant's two-clock,
one-reset, single-port topology.

Patch 2 adds the register-level macros needed by the DC8000 ops.

Patches 3-5 introduce the driver changes in three logical steps: the
vs_dc_funcs hardware ops vtable with DC8200 ops extracted into
vs_dc8200.c; the DC8000 ops in vs_dc8000.c with the necessary
clock-optionality changes; and finally the DCUltraLite HWDB entry that
gates hardware recognition once all support is in place.

Patch 6 adds the Kconfig dependency on ARCH_MA35, placed last because it
is only meaningful after the HWDB entry is added.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v3:
  - [dt-bindings] Reverted extra space before inline '#' comment.
  - [dt-bindings] Moved clock/reset items descriptions from the top-level
    clocks:/resets: into the per-variant allOf/if blocks; kept only
    minItems/maxItems at the top level.
  - [dt-bindings] Restored full items lists for clock-names and reset-names
    at the top level with minItems so names are still validated.
  - [dt-bindings] Added minItems: 1 to resets: in the nuvoton block.
  - [dt-bindings] Added required: [resets, reset-names] inside the then:
    block for both thead,th1520-dc8200 and nuvoton,ma35d1-dcu.
  - [dt-bindings] Added minItems: 3 to reset-names in the thead block.
  - [dt-bindings] Added maxItems: 1 to reset-names in the nuvoton block.
  - [dt-bindings] Reverted unevaluatedProperties: false back to
    additionalProperties: false.
  - [dt-bindings] Removed the second DT example for nuvoton,ma35d1-dcu
    since a difference in clocks/resets does not need a new example.
  - [ops] Renamed bridge_enable/bridge_disable to panel_enable_ex/
    panel_disable_ex.
  - [ops] Renamed irq_handler to irq_ack.
  - [ops] Renamed plane_enable_ex/disable_ex/update_ex to
    primary_plane_enable_ex/disable_ex/update_ex.
  - [ops] Renamed vs_dcu_lite.c to vs_dc8000.c, all internal functions
    from vs_dcu_lite_* to vs_dc8000_*, exported symbol from
    vs_dcu_lite_funcs to vs_dc8000_funcs; updated Makefile.
  - [kconfig] Moved ARCH_MA35 Kconfig change to a separate final commit,
    placed after the HWDB entry.

Joey Lu (6):
  dt-bindings: display: verisilicon,dc: generalize for single-output
    variants
  drm/verisilicon: add register-level macros for DC8000
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add DC8000 (DCUltraLite) display controller support
  drm/verisilicon: add DCUltraLite chip identity to HWDB
  drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms

 .../bindings/display/verisilicon,dc.yaml      |  80 +++++++++++--
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +---
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 ++++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |  13 ++-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 ++++++
 drivers/gpu/drm/verisilicon/vs_dc8000.c       |  78 +++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  14 +++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +-----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 14 files changed, 368 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

-- 
2.43.0

