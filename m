Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1065B3A759E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485919; cv=none; b=rjc5EKEqBHcKy7/4KpiyaL+sp2yPgtOxzQhN9bJdWOS4HBj/g162rBEJ2NRyQtyv3L1IsB+hAE6ktUOkbYcryTsf5fCQ+8E9u1Oh8wDXuCcQNfwArCdmorUejSsd5kD+wzkSuMM5oVvDqhIm5dbL9yfR0Fq0cuSIqHjhIpr8rKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485919; c=relaxed/simple;
	bh=67HnxI753NLHXR1GpaWOpgQNKuqCPgBo7iuNOYDU9Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PiiWA3VR1dafoXlMfoW+kL3yNfrFMmUR22yezhmfgLwiNlfr6hCaUbcdGUjTCAvuUK/0J0Frz6oT2zZdb5j8aCre0blIozhxbv4+g3SC0UkGKFkH54Tq/ayLUqjw5eaWMD8qN3O4k0NOJLtsT0+61tdU1649d4mqLsu0DLBPUXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTuvXGVv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTuvXGVv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so2810521b3a.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485910; x=1779090710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qQ0ZL0QLxICeDqID+huefvNgUTc9prsoWIoKknFrC8=;
        b=OTuvXGVvxHwPRiS+vfXkI1AvGuuz4gB7vZo+lM7yXcMLiGb/CU1bTSyFbn7y0ZYvvH
         MsAaQ35ZwLjCNaM0F34lHj9hP+ImiEmo/aS9QRJWydIp0Jqa6J5EM2qmHXH5qV94QTz/
         Iadl8AYry3XfaOA5MBHEL6nwRK6ANMaP2FbERH1kKUKyn+3mhWEoAgLwuG6EMios9wcz
         u3dGdPAK0dlY7uN1lfrDnGpJO+FrHrGvma1qRR5+YXGLcjoMnmDalV73BPCGBAUHWWnh
         wFCfK10gCambuDS29adTuk7F4XzBJwQkMiUdjK0L3icvJZlvPNSq1P21czbWdVFwBOox
         uFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485910; x=1779090710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qQ0ZL0QLxICeDqID+huefvNgUTc9prsoWIoKknFrC8=;
        b=f7CueeRxvh5gOQv9RsBz/ZF50jyPr5ECtLJVB+RdKIyXuv73tEByT1WyAsI0rQi7dj
         go0BdY5VFwLrLUpdsgaLi9PGlhB1gAdtC0m+3AW3xUI/y2KsyiXnCQ6Svg4mr+Q7fpyw
         psjm8jnvR4JNHLaRixOsxNXlSUoSewfDh5P+25EcGuGEZxHmkIYnOOUjCFFj0W4dotbT
         OmId8rFagZChC+TvH7oaIXyha86xoJVxbPy4WNx2bizX77ALZr8xwyatDQBa2OqTyqhA
         MwGb1BPrJHLoe2avE1VXDyTVzgJJ26x5okBBQQMrEPKNsdbB1NFYtt3tY6PIwdjTgfVM
         jTEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/71UB9oftlw710S79LSwmsUH/Pc0Cboqw11uR+kyct+dph4SLXSZYk886TQepLCd3rauiR7FQC8We9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9DRPxRWoiUXaHAGB+oiUWBdmdDONz587BE6Xf5PZPgCON7rK
	wLKC78y9/nMs7jizmgPZ1NF80IhMn7skyM844FdEO/5ilw09qhg1MOxs
X-Gm-Gg: Acq92OFX7TdzD3BtOLzre7m8OBhoh9yCO61cTlWxzal24FZ3ywZiD/x38M5opvquSeA
	0MZ6/EyCzCGUYj4NKhpZOLnCoi0lf+gFF26lKxGNOrAatVZLNEZmpozeRUwPNdCqxDsln6u59dR
	hgM6sFHKLMRD4fNFlR+uLgWwFmLZhiFhORMk+QJsQqwUsuwfw++iuAr/+tPgTkGKTSO3NiXpM0/
	DBf+0TajKm2Wz1G0MwCms0wHcMCIrntQGXntOzEZ8sNK2aTiYP7thsZdwt3mPWOlxLJlaDdVZIL
	jqVg/wA4axNDe5ikjoMCy9fX+tkhViS7TkdlgzggD7Nlbye7C6iJ9YM4kWe0/CMnMVQ4nOf+P4m
	gXkOPFTWaUqsrhDZIe3n7VOpE86QVITlAXkBiMejZebcIIqnnzPtCSGXSYA6Wb62nqcOH+yW9Jw
	hCJNBj5BCeVgc5eyiuLIQc22jJ2oOu7yv86w2oEYIev0AkDHTNx3D7nu456roTCQFeeMfGd7YQz
	7cad9EeXGcl
X-Received: by 2002:a05:6a00:3016:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-83a5c2be01cmr21310489b3a.14.1778485909975;
        Mon, 11 May 2026 00:51:49 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36a12sm17694642b3a.27.2026.05.11.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:51:49 -0700 (PDT)
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
Subject: [PATCH 0/2] drm/verisilicon: add Nuvoton MA35D1 DCUltra Lite support
Date: Mon, 11 May 2026 15:51:40 +0800
Message-ID: <20260511075142.54752-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Verisilicon DCUltra Lite display
controller as integrated in the Nuvoton MA35D1 SoC.

The Verisilicon DC driver and its DT binding were originally written by
Icenowy Zheng <zhengxingda@iscas.ac.cn> for the TH1520 SoC, which
carries a DC8000 IP block.  The present series builds on that foundation
with gratitude to Icenowy for the original work.

The DCUltra Lite is a previous generation of the DC8000 series.  While
the two IPs share a broadly similar register layout, a number of
differences prevent the existing driver from working on the MA35D1
without modification:

  - No chip identity registers: the DCUltra Lite does not expose
    model/revision/customer_id hardware registers, so variant detection
    must come from platform data rather than register reads.

  - No CONFIG_EX commit path: the DC8000 staging registers
    (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
    PANEL_CONFIG_EX) are absent; the DCUltra Lite uses enable and reset
    bits in FB_CONFIG (bit 0 / bit 4) for direct framebuffer updates.

  - No PANEL_START register: panel output begins when
    PANEL_CONFIG.RUNNING is set; the DC8000 multi-display sync start
    register at 0x1CCC does not exist.

  - Different IRQ registers: IRQ_STA at 0x147C / IRQ_EN at 0x1480,
    versus the DC8000's IRQ_ACK at 0x0010 / IRQ_EN at 0x0014.

  - Simpler clock/reset topology: two clocks ("core" bus gate and "pix0"
    pixel divider), no driver-managed resets.  The DC8000 requires
    core/axi/ahb clocks and three reset lines.

  - Single display output: no per-output indexing is needed.

  - Smaller register space: max_register 0x2000 vs. DC8000's 0x2544.

Patch 1 extends the verisilicon,dc DT binding to accommodate variants
with flexible clock/reset counts and adds a new sub-schema for
nuvoton,ma35d1-dcu.

Patch 2 introduces the vs_dc_info platform data structure, selects the
correct code paths based on the detected IP family, extends Kconfig for
ARCH_MA35, and wires up the "nuvoton,ma35d1-dcu" OF compatible string.

Both patches have been tested on Nuvoton MA35D1 hardware and are
functioning correctly.

Joey Lu (2):
  dt-bindings: display: verisilicon,dc: generalize for DCUltra Lite
    variant
  drm/verisilicon: add support for Nuvoton MA35D1 DCUltra Lite display
    controller

 .../bindings/display/nuvoton,ma35d1-dcu.yaml  |  94 +++++++++++++
 .../bindings/display/verisilicon,dc.yaml      |  64 +++++----
 drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c       |  28 ++--
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  13 +-
 drivers/gpu/drm/verisilicon/vs_dc.c           | 129 ++++++++++++------
 drivers/gpu/drm/verisilicon/vs_dc.h           |   1 +
 drivers/gpu/drm/verisilicon/vs_drm.c          |  16 ++-
 drivers/gpu/drm/verisilicon/vs_hwdb.c         |   2 +-
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |  25 ++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    |  43 +++---
 .../drm/verisilicon/vs_primary_plane_regs.h   |   2 +
 12 files changed, 318 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml

-- 
2.43.0

