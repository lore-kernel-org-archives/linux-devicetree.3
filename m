Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A7B34D910
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169920; cv=none; b=U9+tLJSpxg0vEuEgzBapNFbbMXN4E2U8HXkXfweJ2esGiT+8p9OupYsQu1fftnQq/nSH/wxFbI5+0iCG3K3NEwacfpmFHc3DsfxjGm94N/9BgowmIyQdXHSFo2k9LHpBNbgzeGZ8ZgnPVMNafj+eXspp84H9r0d07cFr4z3Ao9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169920; c=relaxed/simple;
	bh=yg5X2+G6j9XIgwns/fMKSvLnhPKx6m7uwNbB+8kiUsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iI/CE6yDPYS4i4BT79gf+Jo/pwQ27YOKLQI7ftFe/eiDqgJuMXkX0z6AD635DZxQeje2k0XChMlAKhN2ZQ7kEAwPIX2gFMahd0+bKPBO6j8N1mkDo5ZFwdKkcCPzmm5vnm8FfRypSSAr84XV0DNAVo+bGTcqwNN21rk0KTGLsjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvL/W2+y; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvL/W2+y"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f8893bff3so1396976b3a.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169918; x=1779774718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=At2RDd/JrXkyJVQsow486779/5ZNt3HX5SfY5tKfcDY=;
        b=SvL/W2+yaA2vX5yIEGX7/skmuCg8uO9RadFuwHJZV1RaUzw+W5Tdi7K4KgN6Z9iAVQ
         PGNd5QL42RRp+pt/Se/Zo7GQ67jSfQlVrTqxxj4uv8xaHV9rc2DeCXr5S+iTBfwNVRDX
         FD9df61nwkri9Q5XQ50pQ6pHGlo9SJfVsUeAdg5fUUK8tOGvqvFDSgf4+Km+/CpOPPAw
         VLf/29tZ5t08mtjudDTKajy0v8afPE5ToizNLlQGDKJ22eBwivuOQhqcgWfJ0PW6TPO4
         bJvvrOmPH9JEqvn59o2x5BIkfCChZVLRiVNiDMILl3n2kQDZFjCODDJ5KMN2t4lYB32U
         8dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169918; x=1779774718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At2RDd/JrXkyJVQsow486779/5ZNt3HX5SfY5tKfcDY=;
        b=iCaW9KOxvYYFrQHv+s+/SCsWJ9+XVzTeGoawpLMGtRZ14K08sKRs/Qcpc/eZM3B5Y+
         +tweJUIwnxPJLhwsobzgET62Z4m6r7R/nKb6zV6cECrFB8AgcBWMDM5bt6Vtd3j3rm0U
         +aJKTdM5lvR19zfl+omWDmmlr/JjxKxWU0pvOSlBKpikS0F9keb8uH+G5OJsWiXsEAqe
         e2/iMCIWOxnuEmabBTlBruuwUo+GdwKt40xxi6sZavqeJpZohqJP5a+8UhpYAP7KxgPn
         kKbUSCNhUyYQYY46mp8l885dn3wiM3RsR6Fz1qktPOMtus+CK8YzhAUS5fMKZ123i34F
         l+zg==
X-Forwarded-Encrypted: i=1; AFNElJ/BkcLi4Qyf1D96RaR8X7P//1nmVCpAUkXzFeT1CE7KkqSQgYrfPFc2Xo1J0SI20sIeo/A/+BQ6Fixo@vger.kernel.org
X-Gm-Message-State: AOJu0YzmrMOtf8uyLGPMlVOVWdJkjVqMeKR/eRkX3fLOF2ooz0zovkAl
	mjPSNeevYTXZApqlys1vka8Mrn3jQPMyCISJsFfYPv8sch9wSoMbr9rJ
X-Gm-Gg: Acq92OFdvE7OzHC2246d/bdfFCIrH4ZWJLsVkp4GEACQmraYJKD6FcJjxxJ4By8Qk7L
	Umj8W2VkckLNDtK9w9/d9JOLwRy7nv0P/Pgmwh6ycOTuwJCz5VbzdMQDQZ3gl1cPZv2tDoiyllp
	RJRmK9FcEYEwm/ZeIJhFVYpqny6uXulB+vkcpxQbJ/B+mGOpi4w5YdeuSauGbpYsRZwSLHTe/dG
	1TgUIl91wZ7MrEcXiV+KCejXcVuOK/2nT9hV2SrXwXLJT1n0+z+83NtVHMjoYAMM6Gduw/PygX/
	/mi+Wvbs5qHtWmKDESAboKUlOy2ePaYVqs+dvlbl8+pyXSXmKSKFRjA31MJS/bjpZdBgD6kYJfL
	5WWTMWoEg8mRfFPCBqTbOIfpN//pnMiqstGlng2SLPFlYMEAg5TMfiFi2OTlFvHApMV5lInfL/M
	miVkelAm9w/UZDytS8E38TpfhtfkMZGIyaTpeLwveqekfVe/9ol7GyzNaygsbHi4bFdRCJUqnwf
	E9JusWBdaMs
X-Received: by 2002:a05:6a00:1f09:b0:835:41f3:f453 with SMTP id d2e1a72fcca58-83f33c45ccemr17469354b3a.17.1779169917992;
        Mon, 18 May 2026 22:51:57 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:51:57 -0700 (PDT)
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
Subject: [PATCH v2 0/4] drm/verisilicon: add Nuvoton MA35D1 DCU Lite support
Date: Tue, 19 May 2026 13:51:05 +0800
Message-ID: <20260519055114.1886525-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Verisilicon DCU Lite display controller
as integrated in the Nuvoton MA35D1 SoC.

The Verisilicon DC driver and its DT binding were originally written by
Icenowy Zheng <zhengxingda@iscas.ac.cn> for the T-Head TH1520 SoC, which
carries a DC8200 IP block.  The present series builds on that foundation
with gratitude to Icenowy for the original work.

The DCU Lite is a different variant in the DC IP family.  While the two
IPs share a broadly similar register layout, a number of differences
prevent the existing driver from working on the MA35D1 without
modification:

  - No CONFIG_EX commit path: the DC8200 staging registers
    (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
    PANEL_CONFIG_EX) are absent.  The DCU Lite uses enable (bit 0) and
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

  - Hardware-discoverable identity: the DCU Lite exposes chip identity
    registers whose model field reads 0x0 (revision 0x5560,
    customer_id 0x305), allowing the existing vs_fill_chip_identity()
    path to identify the variant purely through register reads.  No
    separate OF compatible string is introduced.

Patch 1 generalises the verisilicon,dc DT binding to accommodate
variants with flexible clock/reset counts and a single output, using
allOf/if-then-else to keep per-variant constraints in-schema.

Patches 2-4 introduce the driver changes in three logical steps:
register-level constants and the DCU Lite chip identity table entry;
the vs_dc_funcs hardware ops table with DC8200 ops extracted into
vs_dc8200.c; and finally the DCU Lite ops in vs_dcu_lite.c with the
necessary Kconfig and clock-optionality changes.

All patches have been tested on Nuvoton MA35D1 hardware.

Changes from v1:
  - Corrected "DC8000" to "DC8200" throughout (the existing supported
    IP is DC8200, not DC8000).
  - Dropped the separate nuvoton,ma35d1-dcu.yaml; variant constraints
    are now expressed inline in verisilicon,dc.yaml via allOf/if-then-else.
    The MA35D1 uses the generic "verisilicon,dc" compatible string.
  - Replaced the vs_dc_info platform-data flags approach with a
    vs_dc_funcs hardware ops table, giving cleaner per-variant dispatch
    without scattering if/else branches across multiple files.
  - DCU Lite variant is identified through hardware registers rather than
    the OF match table.
  - Series split from 2 patches to 4 for clearer logical progression.
  - Renamed plane ops in vs_dc_funcs: plane_enable/disable to
    plane_enable_ex/disable_ex, plane_update_ext to plane_update_ex.

Joey Lu (4):
  dt-bindings: display: verisilicon,dc: generalize for  single-output
    variants
  drm/verisilicon: add model ID constants and DCU Lite chip identity
  drm/verisilicon: introduce per-variant hardware ops table
  drm/verisilicon: add Nuvoton MA35D1 DCU Lite display controller
    support

 .../bindings/display/verisilicon,dc.yaml      | 135 ++++++++++++++----
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/Makefile          |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  20 +--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  38 ++++-
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |   1 +
 drivers/gpu/drm/verisilicon/vs_dc.c           |  13 +-
 drivers/gpu/drm/verisilicon/vs_dc.h           |  33 +++++
 drivers/gpu/drm/verisilicon/vs_dc8200.c       | 107 ++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dcu_lite.c     |  78 ++++++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |  16 ++-
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |   3 +
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  32 +----
 .../drm/verisilicon/vs_primary_plane_regs.h   |   3 +
 14 files changed, 398 insertions(+), 85 deletions(-)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8200.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dcu_lite.c

-- 
2.43.0

