Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081A369970
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402622; cv=none; b=iK3lcxEKVG/M3SNFMOX8/NgusGLngPi0lcBNtDfbMTqPukNzLAuVGjxhZU1e9TeNJNxqGVLj08s+kywC/LI0wLrozYnqJxnvxOR0C3gJYQuEfBoGYwi1PVJqxAaDAoyXH+EklL3dkFjzx9qcL4gB82z2hgBMDSF9ux3k1OqYYDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402622; c=relaxed/simple;
	bh=QT5v84YT0gPkdJLU3al2+Bl4V5DWyS5LuIxcIGWNNNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n4Lnw7whCaw/4VEaI2u69iCLqkj2GUjA1JtmE0x2m2k1mG+gGrVH97CYz3e61/YYDyp23JJnOTfRw9XSCZIpuFr7R3qt7tqHDCUEEKEFpCvXNRYUXiNoHRFZARCs5QsbPFPaVuZudPOeVYRyc+jgkBtzAZ/NAfVQdnYr9J+vWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyhBAe5o; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyhBAe5o"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bab82d75fdso17924955ad.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402619; x=1779007419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ditQC+yU7Iehjh68zsCFLD1izvDINyIjYsF2jxcFgoo=;
        b=dyhBAe5oNqZVMF/7N/3hgieTnNl4WdQzW8VNmeJSu5JcINRlPRSY7ZdOOuJb3J8gL1
         oE9jfX8FLEl69vC8xB6ED3bNUlZjsvvVwaZEtNRigSiQLo6Pd6I3nGcPudGu9QaIA7aI
         RlVHFRAz+MdFtziW1h4xgkTazp7PPyCJLa1/hTaXzaYGBiLZcWbg3LWQfPKbps7lThlt
         dNOLdf2WekH0/izItuorRd4fpBS9KWCJRkv6U/JQqqVX8na1TxqrE5lVo+fMac7JsFD0
         /7ftBIB4R2WaTq/7VgIUbAv266/W5WbEXOMN55LOz6ylJatR0Pqzc4JawVMML6AQDaJv
         8FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402619; x=1779007419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ditQC+yU7Iehjh68zsCFLD1izvDINyIjYsF2jxcFgoo=;
        b=AykRMJyE3ox8/KE+ypmXTXLKdi5Ecn0zkVqQ8990/zAyrplkw/pfbpJCGrPIoB2C80
         x+OnmcDXRq8F64PdxnJLtaCCU5lE/gon1qhGispHsmtUcUOEiQ5Zym5H/2j30Ec/KP5+
         BnZLrqdE8Fv4WY6bBzsDxFk5TKesDxz6hQveNLJxpZUdKgmV/rpt2NmtVtWrqcAMMZ8I
         u/+v+44C05A01KYaghWNeR0iLMEHFrS4k+7F4S0bUCoCpfgoNeVXxDmriasCN9YfiCV0
         /Js2/CxzBosmtWzuiTSZpBlpLNsO3TMBFOk76F5jn+/NikZu+KqMeJoid5riMAuCGYzf
         XY1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EtI3Ajci2l6E/J6oWUoJOADvF+x1NDDmsGLZDp4OIMQH/eMcSSH6iPVY5lVxXFr6LX8VMXM/DjTvv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9d+lv9ExPalHeh1A+M/zR6Ir/A7yTubbX8n/egvd3IziuC+Nt
	szyzA12wgZJIAz/vH6ClIlia/dW6awOlB5dpKtaXI1nhNL2JsZtMPFd0
X-Gm-Gg: Acq92OHLYZ4Aq1RqFgUyHJCc067jwRDhAPmNW+/i04tvg2uM7Px5dvLw0+Zy+eWnlay
	nXwL/Qs7dTaHN85lc03/BdvMG4w9E582wsRku76h0HeIiQSH8D+pYLDMAmG77Pa9ArvYaUUcmiP
	nTCevSsWlxQE94YXoLBM4EMUVoCMEnmpKg6mfox0w3zdu10fHu4D8CtDt7PFPk4kOOD5qju0G/6
	pJYkurHe041YyrsABZxJ1OkFFGNS4hFDoxg2qKA9WWP5v3i61SWPYJlEzyi71RGxd/Sac/UG86/
	5y09xdh2nuS3YvSuzbF0PNlHqLLhlFy64n0trMAHXn4vPJoAX8hpkuHzaonf7h5iwC5i9LGztzP
	KuycWixAaLiqIhK8kM6OAGs8S8wlkN6+ScXn1gfChQX6MIOlBbc9BVGQpfFBkADVRHyHlAqxPPj
	SJPUGW6mW8fUuPJRPIhhBz+TLYhe7EqprvBjfxjjOnwV/GpsLV0w2MwHROZA==
X-Received: by 2002:a17:902:c950:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2bc7a9d07bdmr54491825ad.17.1778402619187;
        Sun, 10 May 2026 01:43:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/10] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Sun, 10 May 2026 15:42:53 +0700
Message-ID: <20260510084303.122426-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The FSI on r8a7740 requires the SPU clock to be enabled before accessing
its internal registers. Without it, register accesses may hang the system
even when the FSI functional clock is enabled.

Previously, the SPU clock remained enabled because it was left running by
the bootloader. After adding the SPU clock to the device tree, it is
automatically disabled once system initialization completes.

This series adds the missing clocks and aligns their names with those used
by the driver.

Following feedback from Morimoto-san, the driver is also refactored to
improve stability. Clock initialization is moved from the runtime path to
the probe function to simplify the flow and avoid redundant setup.
Additionally, the shutdown sequence is reordered to ensure the stream is
stopped before the hardware is shut down.

The driver currently uses clk_enable()/clk_disable() without matching
clk_prepare()/clk_unprepare() handling. This series adds the missing
prepare/unprepare operations and moves them into startup/shutdown paths,
since clk_prepare() may sleep and therefore must not be called from 
atomic contexts.

The series also fixes a race where in-flight IRQ handlers may continue
accessing registers after the SPU clock has been disabled during shutdown.

Changes in v3:
 - Reordered the patches following Morimoto-san's suggestions
 - Updated the DT bindings based on Geert's feedback and renamed the
   "own" clock to "fck"
 - Added fsi_clk_prepare()/fsi_clk_unprepare() and moved them into
   dai_startup()/dai_shutdown()
 - Fixed a race where in-flight IRQ handlers could continue accessing
   registers after the SPU clock had been disabled

Changes in v2:
 - DT Bindings:
   Define "own" clock and add "spu", "icka/b", "diva/b", "xcka/b" to the 
   clock tree.
   Use YAML anchors and "if" rules to enforce clock-names and r8a7740 
   requirements.
   Relocate allOf block and update example with full 8-clock configuration.

 - DTS:
   Rename "fsi" clock to "own" to match driver implementation.
   Add missing clock names: "icka", "ickb", "diva", "divb", "xcka", "xckb".
 
 - In the driver:
   Refactor clock initialization.
   Reorder shutdown: stop stream before hardware shutdown.
   Move SPU clock enable/disable handling to fsi_hw_startup/shutdown.


v2 links: 
   https://lore.kernel.org/all/20260413100700.30995-1-phucduc.bui@gmail.com/
v1 links : 
   https://lore.kernel.org/all/20260403112655.167593-1-phucduc.bui@gmail.com/

Testing:
  - Verified on r8a7740 (Armadillo-800EVA): FSI slave / Codec master mode.
    The system no longer hangs. aplay works correctly, while arecord has 
    some noise in the recorded file (this likely needs further tuning, but
    it is not part of this patch series). 
    The test video link is provided below.
  - FSI master mode is currently compile-tested only. Full verification
    requires a dedicated HDMI driver (FSIB) or hardware modifications 
    (resoldering board resistors) (FSIA).
  - Kernel config gist link : 
    https://gist.github.com/BuiDucPhuc/fc9e5c3ab7a14766eecb4ce568f1cf17
  - Youtube video link of the test process
    https://youtu.be/w3H4v5djr7M

Best regards,
Phuc

bui duc phuc (10):
  ASoC: dt-bindings: renesas,fsi: add support multiple clocks
  arm: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: Fix register access from in-flight IRQ after
    shutdown
  ASoC: renesas: fsi: Move fsi_clk_init()
  ASoC: renesas: fsi: Add shared SPU clock support
  ASoC: renesas: fsi: refactor clock initialization
  ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
  ASoC: renesas: fsi: Use clock prepare handling in startup/shutdown
  ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

 .../bindings/sound/renesas,fsi.yaml           |  27 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 268 +++++++++++++-----
 3 files changed, 235 insertions(+), 72 deletions(-)

-- 
2.43.0

