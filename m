Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A5737472F
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380699; cv=none; b=TxlaJUvCtuvhiPWzRClPP+8Qafss8Yxx6ILtnqq19/BDNEyS3ken5iZ9tCQdrS4ITufSynteMhBxEwyULhKhuiJk17Z9NKHF3CTr36d3vuJ8N61uL9Ipngt+N6/F9Vjztc42uW/qeGP2zSNH/nyBxGXFszVqFhzH+fDnwM9Hhh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380699; c=relaxed/simple;
	bh=9gjSd3FrB8BM1Y9cHPNl+XaJB+Aggn5fYItfBzL5aCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gk/H2qku/adZcz+f1JTZcuILu2uOYKCpJlqe5r62x4CmpV4XhQOoKNBbH5gxufepJWWWHYl8WeIZNnaA/ZDlrVoGYbVL+x0V8x/Xfi4mgTFbgA9xOgJsyxt4BSthQ8Kk1SgL9j1bdiz3hUtSlwtNJn4wSxqmnAd2h2pYYCrMfx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeeCSDfB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeeCSDfB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c7f5869cddso4705195ad.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380697; x=1782985497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7LZb4Oyp6MyCiFD5fuuqoWQdDcqkeN2EAojsuCFuQk=;
        b=SeeCSDfBsTunIetVpK6ieCnnNXW1U6TGJ8TDvVKhY9aeuVEVMlCkdOHJC7AvvhUYuo
         yI4MI+/emNGcFNdiBw9x/9v3BJWQv7zcEKI4gox0ej/o7ZqwxLaZI5knVwxN13z9KljN
         pqTnz22CV19Ip2Q1Ns2F1/hqmi9U4Ia3nZzTQgTSPjakUJC3MdQ4rLXsfv191K/QmYLf
         z/UgAzRuVc/naEDW2g4BQvdJpm0gJAGCZtiFoqaSzQX0hxPWJEz2k45i5LCpu7YUW7pF
         kCKFsNdEm52IiM9YLLCK1v3r2RCW3TZr0fxixZQBSBMaNJAqYX0yJ3Qwi7aQa6UMywbm
         IEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380697; x=1782985497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7LZb4Oyp6MyCiFD5fuuqoWQdDcqkeN2EAojsuCFuQk=;
        b=a0owx7um4OBZyayOn7bP4lfGXfwm7cyn4RslGutp8X/YVfxs3kAmUb6XRIuHZPjEDw
         FSa70UzxWXhrU12AOP9Z7DSyEVSCeCHn774UIACNJpw6DUe45WvKIENJYCGR+GNeMzbb
         q3Sq4sl42N2gkRf8li7DJvVpq8EuhGOThOcyt45t5FWGFbBf6WPMFByJ/PnZTePBVYDF
         XA9YibSF785So2ufoUJFpLNOI+lE2PjSwRR8Eag0pJF7zzbTNUSoCipZaxvMXuV6WiAt
         NEYJMEoXZ/vzujA/zxBxlq6Jz3yRlFM6HX3BDtTMcETqCHIqWJasV8P/BqLnEIF/lp65
         629A==
X-Forwarded-Encrypted: i=1; AHgh+RpLQQE/asQeM2T5+zWLO77zhIulnQwLEo8fzUeZc2lwWodN9hgjzjkYSk3bNDj+1PcUaw4heoAMOtut@vger.kernel.org
X-Gm-Message-State: AOJu0YzhVbLKqAfCEbakp2ER8L59x6Fhh7cOF0R9LikJTUuMJjaAjf8h
	Ca8TgG1q5rAYSF8bI+erZQ4MjjGwGnCmUH63z2AATzgp8seXc50OZUsV
X-Gm-Gg: AfdE7cn0Q17PqTCgkpN3Md/UNvvJ+JJyTDVGgl5YKkx9Gk5BeFx9fHKSc7SBTmvodXv
	1J5EJ9vgxzxUOeJwJc4pZ+h9J+HFdjJnqCTmeALnpvPVBr27XWYoFL4C5V06g9L+b5CauFETWnb
	x/Rzwj7R79w0KBWqhzJiKwoxbuFqdwl5Sxd9yanuqUrDsgLAwFeZ0sB7N6nOFebXVxGdAjGBlHw
	E9CtnfbEQtuohXuL5jdthH75i+d0K3MGlCIkJJOXb4rgS+if0E4DPiXL/UPXm9X0OywmokwXdSM
	JJ4CCHdI5fraa4gP0UDn9w9ttal7KQyCCziM+uKT55gv+O0qJQVBwisbtus3VViL/z6LCdF284l
	oYnOgKxL/uGqRt14aQVWg+rSSdADrwJGE25giBLG9dI1hXPpKXuQZn+RREDGgvSqOE+ioEvT/sJ
	0Q1nJbDiMWVrFW/K4OX9niLMYN4kYOCQSWUc51EfMhsZ3TH9/XKqZOa7FOK6sMiBnTyhv659C+3
	husVDusM2TS
X-Received: by 2002:a17:902:e843:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c7fca3eeb3mr18687905ad.31.1782380696777;
        Thu, 25 Jun 2026 02:44:56 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:44:56 -0700 (PDT)
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
Subject: [PATCH v5 0/7] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Thu, 25 Jun 2026 17:44:42 +0800
Message-ID: <20260625094449.708386-1-a0987203069@gmail.com>
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
vs_dc8200.c; making axi/ahb clocks optional as a separate atomic change;
and the DC8000 ops in vs_dc8000.c.  Patch 6 adds the DCUltraLite HWDB
entry that gates hardware recognition once all support is in place.

Patch 7 adds the Kconfig dependency on ARCH_MA35, placed last because it
is only meaningful after the HWDB entry is added.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v4:
  - [dt-bindings] Kept clock and reset item descriptions in the global
    clocks:/resets: properties; per-compatible sections only constrain
    minItems/maxItems and override clock-names items for nuvoton,ma35d1-dcu.
  - [dt-bindings] Dropped redundant global minItems/maxItems on clocks:
    and clock-names:.
  - [dt-bindings] Dropped the extra-space typo fix in port@0 description
    to keep the patch atomic; left for a separate patch later.
  - [ops] Renamed crtc_enable/crtc_disable hooks to crtc_enable_ex/
    crtc_disable_ex.
  - [ops] Added unified IRQ bit definitions; each irq_ack() implementation
    now translates hardware-specific bits before returning.
  - [clocks] Split the axi/ahb optional-clock change into its own patch
    for atomicity.
  - [hwdb] Simplified the commit message for patch 6.
  - [kconfig] Simplified the commit message for patch 7.

Joey Lu (7):
  dt-bindings: display: verisilicon,dc: generalize for single-output
    variants
  drm/verisilicon: add register-level macros for DC8000
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: make axi and ahb clocks optional
  drm/verisilicon: add DC8000 (DCUltraLite) display controller support
  drm/verisilicon: add DCUltraLite chip identity to HWDB
  drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms

 .../bindings/display/verisilicon,dc.yaml      |  57 +++++++++
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 +++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |  13 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 +++++
 drivers/gpu/drm/verisilicon/vs_dc8000.c       |  86 +++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 115 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.c          |   5 +-
 drivers/gpu/drm/verisilicon/vs_drm.h          |   8 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  14 +++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   6 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 16 files changed, 378 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c

-- 
2.43.0

