Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA1A48CFC
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332615; cv=none; b=jOq6G63XbsofAp36ASGxklFvK/gaQ/qyWBPPTUCixBw8nNy0OJxJonlIsKNwL8SUqmhfRtyDHatR/rsY9hAcIkj8A6rRDNmiQnDGrpEvjua7Tlpz/4qYEFLg33CP3ibc/yacLyqw3Gm1XPR60HWzLCvObZhFXDzfVebb8xWInDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332615; c=relaxed/simple;
	bh=iXjQ7ZL5zf0L4khBIAIZRuOtNLqxabdX7LHVbhud9JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GJXG1EJQs6f2+BfZ7DKV7j5RcaPnfOfYTxFEDi85Sln4/q71Fs/WhgwLptbV74eimsK87iw9s2SF107BfF9horGp12t5HK9Y2AsbcrXEELleQUrs3nH8pI+TcNQKv0Po6mX7KB8tbi83wD5H39ZCr8d+fo7I/cfTk/EbqrcGnMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oY8x+Ejp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oY8x+Ejp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-486955ae01eso2247008f8f.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 13:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789332612; x=1789937412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjMoUF4yuavaTKyLY/U0g6P8MTIyeIYTubqXPU+RsMY=;
        b=oY8x+Ejp6pjAQoaUB+OdehHWWiseEU8uFp3S4bp5dt+QpLNG7CUCwxBOGIMl0i5YjF
         i7zl50R3sCsK+e7v2BjY+PgGzl7TzYJYM/n7j4IyGRfSnLfAPdAvY0z3Co+hQCI/7Prq
         7ps496KjYpEgFE7O62CW/V+zruQGYfYnjwUvUbfXLAMqEbWlZY6Cz18phTl6TsQqnH1C
         yZVVBulrz4kL9vzO9KgkbIRB80TYEIBapXEklQ3O2s6u+SpsVIRxcyon1T8yFQ5vPa1x
         NJMomXtcORFMfV5i8pcnBn1zCsNbu9zddOqq0bZc3e0SABFtORUSFopJOPeVYaSUFJsJ
         LUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789332612; x=1789937412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjMoUF4yuavaTKyLY/U0g6P8MTIyeIYTubqXPU+RsMY=;
        b=gjMVHNjcU2fmhrJrQQGPZy84sW3vA4RNLtR3ReDY9bkTrl0LwwYyxZWdwSERJsQXQ0
         E5EthTn6PSc9h69r3E/AeNtzU4+SUfCzzGilTz7PLAX4yEy3bRDy8X+gENs27LJW/O9p
         9fNILDbmUkaZCaKkkamwAoAy2EwxB2zbu5ZiFBVqOm3l35fQe/i8wW3Y8JVgY3fiKTpu
         2YmdGyKWewSZr2LzRz00mnMhMrpq5Rk4KlNc9xA+CpR+tSSA0uecG4kuJwM8YAlHKQkP
         bHYYAKiTZqmpiYcnXLEN8YWII93h+7Vf/ntyKd2d0GY5XZtWzFk7RdSH6OjgnPXzlE9x
         MRAA==
X-Forwarded-Encrypted: i=1; AKwUvBxUyELapbYp5XAIGBgmf8633FsX375X2AfY4WcWXmQGuhSAeB252yQtRESuIsUeWm+qvI+HkQMehtDZ@vger.kernel.org
X-Gm-Message-State: AFuF++lJ3N0WZOGns+lpy6Z8tWYGFBFyEvqoQKvEhujCPUwYhiQTsaif
	rtcINfsXih98XF4sZko+FvN3X6phZVUuC859NKjHaKpVHzMo+9Bv9Fpz
X-Gm-Gg: AYBFou2MDPX90KUREDHyIaWyGD+uUk38BI2eZtPQZevJ2N4IsGBTDnRuHfxDNxS+vbw
	CMXhjhqIg1KicmVWCVY74J2q0YiGhQOMvoeq+eTmyxUZ1jDsm75lZZbMP6a//qIRUgjCfpPN1hR
	RYxbRhu4mCnmj7g5oGH+InIPgdr5FpoU6BukPq+uLUJeolXUPJmx/VuJvjixD2R9qchP5gQcyQa
	2JMRbHU1bQvPKCO5xRPazME1vHso1sS5E31qwZXqKQp2k8ZomBxb7iQV9K+9puAKttCBXvuUHN0
	SpN6xRqXL51/ze00Z1wUS+0Vdg1ZN3BHx+tGSp+KY+GrRVBJTFkXq+pAz19cLrINLVTPXCv5TGB
	0swR4uFDFdifcix0FyszPLno6mVKeTAcvflPeLWl2Z4BagoTtIfH7tgBX80JRPuq9CVNAW0twmv
	1E5NEDcWnpx7YgUlByH32aJ2n5YErFuIM7jiMU17NHlzTMi4LUJecBpg+XHNub6xD+FM+v7bthH
	SrM9ewubKrR0XKLP7+ggTFomOP4GkbpkcAVoABCQdD/bvlUZPfjhwGfpL3wc/xNFUJfuPPh5ZA2
	nmCE70oDelHqHD7j6ki8SxoxfIVH6YK6VJk2IQ==
X-Received: by 2002:a05:600c:4e8e:b0:49e:7423:687c with SMTP id 5b1f17b1804b1-49e742368a8mr56005745e9.1.1789332611594;
        Sun, 13 Sep 2026 13:50:11 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7723d458sm54986345e9.0.2026.09.13.13.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:50:11 -0700 (PDT)
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
Subject: [PATCH v4 0/2] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
Date: Sun, 13 Sep 2026 22:50:05 +0200
Message-ID: <20260913205007.118552-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v4 of the GlandaGPU DRM driver series [1][2][3]. It addresses
review feedback from Thomas Zimmermann and the automated review bot
on v3.

GlandaGPU is a small VHDL soft-IP 2D display controller, currently
targeting a Terasic DE10-Standard (Cyclone V SoC). This series has
been tested against a QEMU digital twin and on real hardware.

Hardware/VHDL:   https://github.com/stiangglanda/GlandaGPU
QEMU fork:       https://github.com/stiangglanda/qemu-glandagpu
Userspace tests: https://github.com/stiangglanda/GlandaGPU-userspace-tests

Changes since v3:

dt-bindings:
- Fix alphabetical ordering of the '^kieweg,.*' vendor prefix in
  vendor-prefixes.yaml.

driver core:
- Use devm_ioremap_wc() instead of devm_ioremap() for the VRAM
  mapping in both the platform and PCI probe paths, avoiding a severe
  performance regression from uncached writes (Sashiko bot).
- Only enable the hardware VSYNC interrupt when an IRQ handler is
  actually registered. enable_vblank() now returns -EINVAL when
  falling back to polling mode, instead of risking an unhandled
  interrupt storm (Sashiko bot).
- Stop unconditionally enabling the VSYNC interrupt during probe.
  Let the DRM core enable/disable it through enable_vblank()/
  disable_vblank() as needed (Thomas Zimmermann, Sashiko bot).
- Guard the PCI probe/remove code and pci_driver structure with
  #ifdef CONFIG_PCI so the driver builds with
  CONFIG_COMPILE_TEST=y && CONFIG_PCI=n (Sashiko bot).
- Use container_of_const() instead of container_of() (Thomas
  Zimmermann).
- Add glanda_plane_atomic_disable(), which blanks VRAM when the
  plane is disabled, instead of silently returning on a NULL fb
  (Thomas Zimmermann).
- Wrap direct access to the shadow-plane buffer object in
  drm_gem_fb_begin_cpu_access()/drm_gem_fb_end_cpu_access() to
  synchronize against imported buffers (Thomas Zimmermann).
- Switch atomic_update() to damage-clipped blitting via
  drm_atomic_helper_damage_iter instead of copying the whole frame
  on every update (Thomas Zimmermann).
- Always call drm_atomic_helper_check_plane_state() in
  atomic_check(), even when the plane has no CRTC yet (Thomas
  Zimmermann).
- Support panning within a larger, system-allocated framebuffer by
  calculating the correct source offset when reading pixel data 
  (Thomas Zimmermann).
- Remove glanda_connector_detect(). The default "connected" status
  is sufficient (Thomas Zimmermann).
- Wrap hardware register access in enable_vblank()/disable_vblank()
  with drm_dev_enter()/drm_dev_exit() (Thomas Zimmermann).
- Use drm_crtc_vblank_atomic_enable()/drm_crtc_vblank_atomic_disable()
  instead of custom wrapper functions (Thomas Zimmermann).
- Use drmm_mode_config_init() so the mode-config pipeline is cleaned
  up automatically (Thomas Zimmermann).
- Raise mode_config.max_width/max_height to
  DRM_SHADOW_PLANE_MAX_WIDTH/DRM_SHADOW_PLANE_MAX_HEIGHT instead of
  the fixed 640x480, so userspace can allocate larger framebuffers
  (Thomas Zimmermann).
- Call drm_plane_enable_fb_damage_clips() to enable damage clipping
  (Thomas Zimmermann).
- Move drm_vblank_init() to right before drm_mode_config_reset()
  (Thomas Zimmermann).
- Remove the manual drm_helper_probe_single_connector_modes() call
  during init. The DRM core probes modes on demand (Thomas
  Zimmermann).
- Simplify glanda_drm_fini() to just drm_dev_unplug(). The DRM core
  handles vblank/IRQ teardown after unplug (Thomas Zimmermann).
- Drop "Hardware Accelerated" from the driver description (Thomas
  Zimmermann).

Regarding the panning support: Since the physical VRAM is fixed to 
640x480, the display output itself cannot be panned. Instead, the 
panning is handled on the source side. If userspace allocates a 
larger framebuffer, the driver now calculates the correct src_x and 
src_y offsets from the plane state and copies only the requested 
sub-region into VRAM. Please let me know if this implementation 
matches what you had in mind with the sysfb reference.

[1] v1: https://lore.kernel.org/dri-devel/20260714101146.200416-1-kieweg.leander@gmail.com/T/#t
[2] v2: https://lore.kernel.org/dri-devel/20260730173643.256052-1-kieweg.leander@gmail.com/T/#t
[3] v3: https://lore.kernel.org/dri-devel/20260824195418.17707-1-kieweg.leander@gmail.com/T/#t

Leander Kieweg (2):
  dt-bindings: display: Add GlandaGPU binding
  drm/glanda: Add initial DRM driver for GlandaGPU

 .../bindings/display/kieweg,gpu.yaml          |  55 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  11 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/glandagpu.c              | 642 ++++++++++++++++++
 6 files changed, 717 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml
 create mode 100644 drivers/gpu/drm/tiny/glandagpu.c

-- 
2.43.0

