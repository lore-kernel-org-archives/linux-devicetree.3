Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8E383983
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433111; cv=none; b=slTE7mDoxtz1j2iYOOS8p3OfxGR5QO6/GL8nKDBUgSgBrD+D1ST94F1jG0OZVL3zG5ghaRDhGNYh/X6AfqOFOkYNbEf4z8odBym/pRX9lsT0DtyMytRqdalAeSdwgxZs6kz1K60WRJ3A5eg56sR8k2i/qhZFbTyesKku0Ee65gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433111; c=relaxed/simple;
	bh=KVaj8TeyIliom4tRzCg2qR4OookAahxZ0+ngW3k+z0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MEABaGPT1BY5RmeN44JO0nAaA5Bm7UBUusnkBsLBk3CnpuSmPKMoDmgCGAqvVpmzn8tUxMPjIMkgCiGS6VNaYSXaeuNqG1Jp4IzRrRDqjALB1ZvfrKL5NqtiqgyZUE8A2JObnewuMDQfJAvgQViEtw8lQ6X9+N1s05+Pm5neJ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmpCbki6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmpCbki6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso2306672f8f.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433108; x=1786037908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OoqYtdO+0fOmVWiZOoM5gwTne70jDLTok+A94SX0IU=;
        b=RmpCbki6BB148sCYkyxjqa4aGrCBVhkZPDr1bhTZ6D8Auxwzv8IpZEC0VDweY738II
         9dVpwvjSwaHpbIbT6bOnErebMbQpIUWQHfrqrAHoHzTowcxp4U7jMtVMymjWlDHxkNvi
         x+aVG+5zJ2n/ploMtvKK8YsEwD8oHQS7AEnyxf9vt14c7nAjiunvh4X6wzIwHREifizu
         yzHS0PeelJQ14NYj8UVtwgNp1XHOA2pol+HpCxpMi/1OoQtLu4Fhd4/zH82DFwp+ztJR
         91Rx68syL1GwTkzP6BqwyR13yMue8x5yNpUuuPVPeOqnr+jK0MHt+RWI5Dv0x283yZ+m
         6hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433108; x=1786037908;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7OoqYtdO+0fOmVWiZOoM5gwTne70jDLTok+A94SX0IU=;
        b=CR2LJf5+lzflk/iKYuYLeRtbdgEtWuYr170g3ExmIqMBKWCa6lX2KGDywqCaOpFXug
         KsndU/176yp283Rv9tVTTdcr36MIMu70FZeeMczx9Xvd72irL1cpaV8zbnCyTZKUTgsF
         spugtT05antia9BAnLAMgMIgRqajZebk+lGHZt+Iw9ABEwfrKGp7eaYQdRL8ckzX6suW
         ZAPdUCiWFaKvDAgOdA25xsrueZqugl/OQPpS0EKhyH0oJADM+BhPPLuoKsLfAdnFYAgb
         knmBFNwLBhfne+UiLy9dPmZ2E3sZuBFkWDkTSJXwt7MHPTi9b1DFHMXxY30wu4dps2Mq
         n78Q==
X-Forwarded-Encrypted: i=1; AHgh+RqooddCR/Q/Ls3KbklI6MTl17z6H0bi/OHe4TaAYbwo9A2++WrhJ1AJSHBVLTG7b4ecHa+YYtx9k5Lc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxi5xC5XIsWqM1tsroZ+B+vFnMZe/poTrHj2XkhWlkqhcQl9pF
	DS9nMOA1zd7NYdk6Ux/3bEY+bgx0mRfpdoZ8PJUumXx9vlJPFqv1H/5i
X-Gm-Gg: AR+sD12JUmCh917GhJdkDE4ClJ+JCo8PoA98u39Ab5r4jvDZ6Ps90G2sBrHhOq0GPzP
	QL7yEl3zL4X4+xfYixjGY1kyEp0jbjhf7j9VViTU+ygw0t3PSU3qzCtO1dcB3oc77He7kG69pe4
	Y1UpsREI3iWS4Zfs8st1Xsk2gtBKWeOtoLgqVp2FozUsFu9rD9S2jPUdhwKBQpJezjdDCgAoqat
	e17KYJg9E8z2igCSoSMzdxvF4SQnCHuQX/eGcE+LCE2Y8JnRD7nUnYHxTODz7WBq6aomSZKgFoe
	sREbn0+/kWJteQVTRl/XmTP4p2XX3peyzTvSUf1LzNTWTRHPy+zpEpI+o61jB6FEcUMxtlNcWFa
	XTHbonxgGPwa2FpoutA7bd4sHaGC/yGuQKEeNPe75rbPmO76elIAevRC3o/ALq+pyqYj1ZJN8R2
	qPNz0dZV+tch5O3cJNn7Nx4rvbQ0nRINWf/GNFdj6koE2PFBWtAdPBCalcVdET0v6eaUDJWo7Mf
	Fuf3Wcw1i8lAp7Or3KCTJb8ybjIOTdNlqUDlFfkEbR0eQ5BT5pCiNduNO+eVAm5Rah2h0I38TT0
	DPdBiXkTSTVLuqtKHdSE6hZCIv4MLaSrftSLjg==
X-Received: by 2002:a05:600c:8b43:b0:495:4a34:16e1 with SMTP id 5b1f17b1804b1-49804c531d2mr21225095e9.23.1785433107750;
        Thu, 30 Jul 2026 10:38:27 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f0ecd4sm71603455e9.1.2026.07.30.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:38:27 -0700 (PDT)
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
Subject: [PATCH v2 0/2] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
Date: Thu, 30 Jul 2026 19:36:40 +0200
Message-ID: <20260730173643.256052-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is v2 of the GlandaGPU DRM driver series [1], addressing review
feedback from Thomas Zimmermann, Conor Dooley, Uwe Kleine-König, and
the automated review bot on v1.

GlandaGPU is a small VHDL soft-IP 2D display controller, currently
targeting a Terasic DE10-Standard (Cyclone V SoC). This series has
been tested both against a QEMU digital twin and on real hardware.

Hardware/VHDL:    https://github.com/stiangglanda/GlandaGPU
QEMU fork:        https://github.com/stiangglanda/qemu-glandagpu
Userspace tests:  https://github.com/stiangglanda/GlandaGPU-userspace-tests

Changes since v1:

dt-bindings:
- add a link to the GlandaGPU project in the binding description
- add clocks to the required properties
- fix the example to use interrupt-parent and the GIC_SPI/
  IRQ_TYPE_LEVEL_HIGH macros instead of raw numbers
- fix missing trailing newline

driver core:
- drop the struct device *dev field, use drm_device.dev instead
- open-code drm_encoder_init() instead of drm_simple_encoder_init(),
  which is being phased out
- switch the plane update path from manual dma_resv_lock()/
  drm_gem_shmem_vmap_locked() to DRM_GEM_SHADOW_PLANE_HELPER_FUNCS/
  DRM_GEM_SHADOW_PLANE_FUNCS. This also fixes sleeping calls being
  made from atomic-commit context and a raw map.vaddr dereference,
  both flagged by automated review
- use drm_gem_fb_create_with_dirty() instead of a custom fb_create
  implementation
- remove the redundant new_state == NULL check in the CRTC flush
  helper
- remove the ioctl-based UAPI (CLEAR/RECT/LINE) entirely. As Thomas
  pointed out in v1, fixed-function 2D ioctls aren't a good fit for
  mainline DRM, and userspace rendering into the shadow-plane
  framebuffer covers the same functionality
- fix a double drm_mode_config_cleanup() call in the probe and
  remove error paths (devres already handles this)
- call drm_atomic_helper_shutdown() on remove
- fix a teardown race where in-flight work could touch already
  unmapped MMIO, using drm_dev_unplug()/drm_dev_enter()/
  drm_dev_exit()
- move IRQ registration to after CRTC initialization, avoiding a
  potential NULL pointer dereference from an early-firing shared IRQ
- fix platform_get_irq() error handling. Negative error codes such
  as -EPROBE_DEFER were previously misread as "no IRQ available"

new in v2:
- add PCI probe support alongside the existing platform_driver/
  devicetree path, backed by a matching QEMU device model, so the
  driver can be tested against a virtual device without needing
  devicetree or real hardware. Real hardware continues to use the
  platform_driver path unchanged. This replaces the old x86 test
  device patch 3/3, reducing the series from 3 to 2 patches.

Known open item: the QEMU test device currently uses a placeholder
ID from the range QEMU reserves for experimental, unregistered use
(1af4:10f0, see [2]). I've requested a permanent
ID from Gerd Hoffmann and will post a follow-up once it's assigned.

[1] https://lore.kernel.org/dri-devel/20260714101146.200416-1-kieweg.leander@gmail.com/T/#t
[2] https://www.qemu.org/docs/master/specs/pci-ids.html

Leander Kieweg (2):
  dt-bindings: display: Add GlandaGPU binding
  drm/glanda: Add initial DRM driver for GlandaGPU

 .../bindings/display/glanda,gpu.yaml          |  55 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  11 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/glandagpu.c              | 579 ++++++++++++++++++
 6 files changed, 654 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/glanda,gpu.yaml
 create mode 100644 drivers/gpu/drm/tiny/glandagpu.c

-- 
2.43.0

