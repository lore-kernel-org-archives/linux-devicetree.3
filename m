Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D17D3D34A8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050721; cv=none; b=KBfkW183XhqRG7b+++zrDP7yCJcQH10hnT/uuU+msimEnuUv2mCd+ciq2mZdefKluNot+BxulYcIm52M7vHTADLP1ZXuxiYcTtjQRLtyOM+ibYIwbzoyA5NSQkaKfrQRbFh+wKNTSdDVa3f4z5aB1OCLmUIpzyWfmzcbgevqPkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050721; c=relaxed/simple;
	bh=NMZMnqDGWWAeGlB49gFdIh93m5miziizBZr+exvXud4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eXvz/0o/q0JbeJkGdP+9lvC4VOoJwRsuuXYV9FjT8W69W02AIoui7CVwX00X0O3vwlu3mfGUhE/y8QUcZLDXwDI46IjVaNRJ4c8UBgZP4huOZvLS+jczM/FNdH7XSrObTPUjTLmUpnaX/uzTSqMhYlZIMoLtghFckl4Y0BkV4w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3g72WQy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3g72WQy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-837b39eb078so9558192b3a.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780050714; x=1780655514; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1VAROYwDh72WAwm7PM11vMet7R/k5gdSS8NOIjTWNg=;
        b=T3g72WQyP1sN7iBfYLjpy2K1xcq/uAfys7uSyhQ8Icm9X2kyNG+PhDuJqp1PC6+nVn
         9xiGjQCnCl5AUe3maXpDAjZXivvYO0fosw5SYhF3d8pdttPuFC11e/Maw5kivAaK6u6Z
         cmS3mfrq5Ly8aLv0vR3bY79fE5AIfdMp0mWl6Ak3pbgnbrMLkLElgq2O3+Chdsp9ybSc
         ikHB1jXCDIJd91mHdOeaV77nP0aMqufxAMDvP+uh6k5DL4fV/u6l/LeQtaO9o/ger6I0
         3ujsO6umAfLfd2dbOghIzWGsrQ7xzdtuQiglKhYubju5d3/cx9qG+7xJDv/2hD3WI5Mx
         2zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050714; x=1780655514;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1VAROYwDh72WAwm7PM11vMet7R/k5gdSS8NOIjTWNg=;
        b=UjnWSeIjfnnWphJzy5JjFGDeQJRQJ1F2uXxUkwPPEql1mIZavs4X9Cq8gsTD+TaOM4
         DRZFuLQ9rcZWKQHNCnAnyha9w5zPsetSDT24Z88gTUXIJP2gw86q33xb7pc5Cqk4MR1v
         BZ5biNdO8ZQFnXBIX7rCcUowgHmdC5dkpVOn3Fdd4jXtjLdyDds8tsNmTBp1qoeVnq9r
         pSRv1wr+ib6XY6a/8bMS6Q+xnl2x/bObYPf1+KoCL8c15lii2zppcNaBoz76gJ/vGo4D
         qhpVe+zv1h9D1lsjA4HLMZ+bth2Wdeb3Hm9y1NVwTQEgrRWHJbUesAZQUa3l6CPK1QO2
         vw3A==
X-Forwarded-Encrypted: i=1; AFNElJ/z7NJpmROeDCTi8+BorDpLMlklhalCjCBRU7APRnu38HnTDV/O071MLg/PB1JMeRRdVYtpyA/wiEjR@vger.kernel.org
X-Gm-Message-State: AOJu0YyjEl9Sj0RiFg+eBgh6GrJU041KHJvjT2rBaOLb6m/U9Wmc89Gl
	9eOAe1L4t0OWEjMTDE8+uflLs6DsQSkntlTDV2R1WggXjfRbZv3Xok/u
X-Gm-Gg: Acq92OFUdRRsLN1aRVmARrqaBOGQE+8AuUsmpp4UcwADmEijJcgkCheyaDHktRjvh4p
	HRfzXOOU9m2e6fBCfYk36M1Y7F17Donxc8qmfhU5tk4Oeqzfy+Sq33fz2rRfbBRuQEQJ1FV9VVd
	h+Ue9oDC3HOH362QSZ+gIta7Xm1QGzzKXMtCOMK8PQM+sVFKEHFgDii829H6uVdo1t2enqxFWci
	YwP9lcuatdrj2SWa6r0vTd6zd/ez6YcGN0fft8WhRqhDJ0plJE/6SYZNSI9UxOZL0b4PEiU/9Hz
	M4H0DbZOeDr3IUIwjaPXRlzzPSCpCX3rhSk9sWoeWXUs4lVjntyaTrIVVrYf0G55mMDKL2zdzrR
	M92QC66UPoZFbZgwkBWX1Fi4SAgwLKWyKuITfN1XSkdm8oRE/nzwfeteIxayEtDHNnxLJHdm+jS
	OeJrHqE2zDQUzW68V2ZNDdPOPkpR9d3V1AlZo4X9OeBFPv8yL6vF4zW5sfM1CVGa5yMyVReCphX
	8NdtzA1TJPOaCRUOnmNFw==
X-Received: by 2002:a05:6a00:4399:b0:841:e7f6:3dce with SMTP id d2e1a72fcca58-84212be20dfmr2503527b3a.18.1780050714380;
        Fri, 29 May 2026 03:31:54 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b30711sm1418512b3a.16.2026.05.29.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:31:53 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v3 0/2] drm/tiny: add support for PIXPAPER 4.26 monochrome
 e-ink panel
Date: Fri, 29 May 2026 18:31:50 +0800
Message-Id: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZrGWoC/03MTQrCMBCG4auUWRtJJj8YV95DXMQ0aQdsK4kEp
 fTupkWhy3eY55shh0Qhw7mZIYVCmaaxhjw04Hs3doFRWxuQo+Gaa3Z3iWmUEb2MxkoL9fOZQqT
 3tnK91e4pv6b02UaLWK9/bzZfBONMoLBacRNViJducPQ4+mmA1RfcGfwZrMYb00brTop7tTfLs
 nwBClaTR8oAAAA=
X-Change-ID: 20260505-bar-523f2c3f6939
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, LiangCheng Wang <zaq14760@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780050713; l=2624;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=NMZMnqDGWWAeGlB49gFdIh93m5miziizBZr+exvXud4=;
 b=eF5ekYB/26eVXjq8fm28Y44E0HCCXZG/+RrwTDVkBQT/bau4kEtOsb/UncLu4DQo9kNHFLEgK
 IR450rxsuPLB3GKopD6D9Fjnqi28jntvs3IVfvovCxMK6VkS283VJrS
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

This patch series adds support for the Mayqueen Pixpaper 4.26
monochrome e-ink display panel, controlled via SPI.

The series includes:
- Device tree binding updates for the Pixpaper 4.26 panel
- A DRM tiny driver implementation for the Pixpaper 4.26 panel
- A MAINTAINERS update for the Pixpaper DRM drivers and binding

The panel supports 800x480 resolution with XRGB8888 framebuffer
input and uses SPI, along with GPIO lines for reset, busy, and
data/command control.

Tested on:
- Raspberry Pi 5 with Linux kernel 7.1.0-rc1

Feedback is welcome.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
Changes in v3:
- Keep Conor's Acked-by on the DT binding patch.
- Avoid passing stack and read-only buffers to spi_write().
- Use le32_to_cpu() when reading XRGB8888 pixels.
- Document the panel RAM X direction used during framebuffer conversion.
- Document why busy-wait timeouts remain warning-only.
- Rename the busy-wait helper to pixpaper_wait_for_panel().
- Drop the forward declaration of pixpaper_xrgb8888_to_bw() by moving its
  definition before its first use.
- Use a fixed display mode with drm_connector_helper_get_modes_fixed().
- Drop the redundant mode_config mode_valid callback; resolution is
  validated only by the CRTC mode_valid callback.
- Use drm_err_once() for errors in userspace-triggered update paths.
- Link to v2: https://lore.kernel.org/r/20260526-bar-v2-0-c66df9a840c4@gmail.com

Changes in v2:
- Explain why pixpaper-426m requires a distinct compatible string despite
  sharing the same SPI and GPIO properties with the existing Pixpaper panel.
- Drop the duplicated pixpaper-426m DT binding example.
- Update the binding description for multiple Pixpaper panels.
- Select DRM_GEM_SHMEM_HELPER instead of DRM_GEM_DMA_HELPER for the
  pixpaper-426m driver.
- Link to v1: https://lore.kernel.org/r/20260506-bar-v1-0-12195406f4ef@gmail.com

---
LiangCheng Wang (2):
      dt-bindings: display: mayqueen,pixpaper: add pixpaper-426m
      drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel

 .../bindings/display/mayqueen,pixpaper.yaml        |  13 +-
 MAINTAINERS                                        |   3 +-
 drivers/gpu/drm/tiny/Kconfig                       |  16 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/pixpaper-426m.c               | 817 +++++++++++++++++++++
 5 files changed, 844 insertions(+), 6 deletions(-)
---
base-commit: a293ec25d59dd96309058c70df5a4dd0f889a1e4
change-id: 20260505-bar-523f2c3f6939

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

