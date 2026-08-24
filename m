Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA33038AC65
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 19:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601275; cv=none; b=mM9kSpEbyMICk4dDio6B3pbet31LeB0Xag2r5FhLHwC16ZIg1HageFYmToZtxHclq3lgVINNvQBJQ8ROueXNIh9l/+xKtyrMI69eMNFOXuwBm+6czzhEB3VpAziLZNv7YC0t5WlLah1huYZk/cUAVF1hZvBghePphTgvWthDZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601275; c=relaxed/simple;
	bh=KyoEXyUp3NQ5afFyatBzOmPRSoCQhoiHSa643t+InNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pFp5n7AzD1bDaMaggIR83QOahhRQKXFGQkq1jN6jkt5sTmnk3ivQlcR1SPeMV6Oq3TbUO24pITlOunMrBhltbEkn9USfbvhpx10UjZBnU0SP9nIvZek1fSkfbNhcq56iQImfW5SvWM0wrONPqluzcMKd8gIgdc/4SE3Qd9aWqsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwDGTS+7; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwDGTS+7"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so4932461a12.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787601272; x=1788206072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ClvPQwmI5ogELhuUGgFzTR1/DyqJ1MIgEVXTTEXX9Z4=;
        b=VwDGTS+7FGThh2cUZOkpejii18ce8vJySTzrVQR6zhCNhx+q2cJKz6EG3QJXz0hJ3l
         Mmgi1Hbjc/gTOC2MqH1LWhW9MwrNjuWjP8Cef9mdgbVKl7gpCU3ok95vDYh80a6xjbkO
         XZZ26gQOhv+P7DvieDjw4qvrWks4BQU5tf0CK+b2Vpqr6ZzdFRpnSym6pbpg5Mrgyg2K
         8iUYlgs2YbDPVj5Ue5k3rXYdQFNkq2/K5MAZ/P9HevYpwhCbWJZUEOY8zPT4Um66J4zb
         gT5PmJi5B++SVkq+MaxGEnqGQuXMc+gXnJ8/aQXbEq2uq3Pp2LKGbmvb56xlTg1l4Mx2
         ytlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601272; x=1788206072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClvPQwmI5ogELhuUGgFzTR1/DyqJ1MIgEVXTTEXX9Z4=;
        b=CkrTfozU1VnnSIjNu0Hg/TNNsccJIMs30wMEbg/W/aN5e46+XWjmZss9lc7IsRHMOm
         +4Mh6SKa21LSsS0XpXD4iEgRnKJ9WtkzHrQlWLDCwt+12gOOcLe0PKpsJceW2iBfRweY
         u/aNqEfn4tkyaBaMjL22sPRUKBdUnquEaN14qqRp2ICh00cTtNS5tVtwXEA3AB3IAWKS
         rGADABGRbkvWmXkun09vvUcU4l5DSTpdsculsvf4HFURTCa9qFrV8yiuw8MCsGH/0Ubo
         mE/fggtFklIvobNsa5VbCum9LnO7ctoccDY36WNxaTdSlyIL7RpgJMCdtU1fzOclXfQ8
         h63Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq+eRcUbOURpsPg5hjHlX4qzoNh0vquPGESBuyv1PeK/CstrxGkZhQFpWkI4y4Idt35XAQJE6anHvtu@vger.kernel.org
X-Gm-Message-State: AFuF++nT2GbA1bXntsr8MS2M5X1AHzpAPlwWtHfFktOJMNhsvUffUsU+
	e5FIUvOfDyifNjrvP1JfoY2xoxnuVJukDExPTIM/qHGLii0MbGeHTkl+
X-Gm-Gg: AR+sD10vAdwy9t8qbwgi8nxr7uuhlgJJwpZC1g1H1oFcz+ew+ZYMWgNheQ/0HmU6NRl
	MrqyUeEVfhRueacRRRanWwCh4jg+qycQMDQRkAn/e1bNDb2CnHyLC+M09vgAYrWf+gkXixIvMub
	cdfGgyiQVYm1p/vZkb9OBIohjBdZDiUHtouFBTwJ0ic9dBMEwWf/LPwVhSkvloHUeJDXnOi77rT
	fv354dOIwKNh5DBOoPUHkXQvHe8wonY40WzGZzerKJKICf2I8oXGTZzneaicabPDCw/VtlYP3+G
	qzkfnm380xqro8CyGUV5m3p1Th6NOsAwNbHdo1fZ3cbS5nYVY6/fhES7ONCnfSBO6XFsXU6AVU7
	yxLmeKNd7t/ZQhXwLwLCjsEwAtCwTblFb8xNIghwMcPI/zWDVtde1th2yD/retdMZGbnRylN4dE
	9zzF6QFgx6TbL9QwTgLOW5hXPePDN+mwCt/6BZaek3P9ZDndnMMXajQlM9Sd/yxHs2IaqtwyD6F
	0BeiUN+9nbEZsewFnHesbkyRZEHi5RVEQ8R29G2dsroc0nUBI5fGAtRuf6mFe3kDOP1w9yQs6Aa
	1aNfTpdYbYzcwSIXlUA/IaVbOzA=
X-Received: by 2002:a05:6402:2411:b0:6a3:fee5:adcf with SMTP id 4fb4d7f45d1cf-6a5c409f463mr1169715a12.1.1787601271724;
        Mon, 24 Aug 2026 12:54:31 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e025158sm11410217a12.11.2026.08.24.12.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:54:31 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	u.kleine-koenig@baylibre.com,
	Leander Kieweg <kieweg.leander@gmail.com>
Subject: [PATCH v3 0/2] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
Date: Mon, 24 Aug 2026 21:54:16 +0200
Message-ID: <20260824195418.17707-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v3 of the GlandaGPU DRM driver series [1][2]. It addresses
review feedback from Krzysztof Kozlowski and the automated review
bot on v2.

GlandaGPU is a small VHDL soft-IP 2D display controller, currently
targeting a Terasic DE10-Standard (Cyclone V SoC). This series has
been tested against a QEMU digital twin and on real hardware.

Hardware/VHDL:   https://github.com/stiangglanda/GlandaGPU
QEMU fork:       https://github.com/stiangglanda/qemu-glandagpu
Userspace tests: https://github.com/stiangglanda/GlandaGPU-userspace-tests

Changes since v2:

dt-bindings:
- Switch from the "glanda," vendor prefix to a personal prefix,
  "kieweg," since this is a personal hobby project, not backed by an
  organization. Update vendor-prefixes.yaml, the binding
  file name, and $id accordingly (Krzysztof Kozlowski).

driver core:
- Fix ignored return value of drm_mode_config_init().
- Fix hardware interrupts being left enabled if drm_dev_register()
  fails, which could lead to an unhandled interrupt storm.
- Add resource size validation before I/O memory mapping, closing
  an out-of-bounds mapping/write.
- Fix userspace atomic commits hanging when the driver falls back
  to polling mode (no IRQ), because vblank events were armed but
  never signaled.
- Enable only the INT_VSYNC interrupt. INT_DONE had been enabled
  unnecessarily which could cause an interrupt storm.
- Fix pixel readback to treat framebuffer data as little-endian
  explicitly, which broke color conversion on big-endian hosts.
- Add missing Kconfig dependencies for DRM_GLANDA.
- Use platform_get_irq_optional() instead of platform_get_irq()
  for the optional IRQ, avoiding log spam.
- Drop drm_info()/drm_warn() messages on success paths, drop
  redundant "end of table" comments, and fix the of_match_table
  indentation (Krzysztof Kozlowski).

On the question of what this brings to the community beyond myself:
I don't have an existing user base, and I want to be upfront about
that. I built this to learn how a DRM/KMS driver is put together
end to end, from VHDL soft-IP to kernel driver. What it does provide
is a small, complete reference for exactly that path, plus a QEMU
digital twin that lets anyone poke at a GlandaGPU-compatible device
without owning the physical board. I raised this same concern during
the RFC review, and Thomas Zimmermann's answer at the time was that
we already carry a driver for a hobbyist-built RasPi USB display, so
being a hobby project is not a blocker in itself. I'd rather have
this maintained in-tree, with review, than as an out-of-tree module
nobody ever looks at.

[1] v1: https://lore.kernel.org/dri-devel/20260714101146.200416-1-kieweg.leander@gmail.com/T/#t
[2] v2: https://lore.kernel.org/dri-devel/20260730173643.256052-1-kieweg.leander@gmail.com/T/#t

Leander Kieweg (2):
  dt-bindings: display: Add GlandaGPU binding
  drm/glanda: Add initial DRM driver for GlandaGPU

 .../bindings/display/kieweg,gpu.yaml          |  55 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  11 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/glandagpu.c              | 587 ++++++++++++++++++
 6 files changed, 662 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml
 create mode 100644 drivers/gpu/drm/tiny/glandagpu.c

-- 
2.43.0

