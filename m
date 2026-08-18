Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02F2351C20
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040405; cv=none; b=MRJyPJsrjbzXOVZZIIEuFKVddlqVH7tAeIGwAus3gRsrxTdu+F+AuMbBeO0nzqOBKkKqXQbi7aDu3ESaJud2iNobv9RgG52Xcw9zo+dUcn2PNpDtZHbHmnkJtyShv77Qqc9lTUSbD/BzsOORFNFLxwIo5RbifPre8PibRpaHIDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040405; c=relaxed/simple;
	bh=7fQOqK+brdNBozlWzqt3VSm6rMN410K8eZ9yz5eX4jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RcBUj3OD/S7EOgXXj7gYwriJEMMAyssMsY54xrxfjAN1h8+RBUrFaZ6z01PKZiUgKxmiYv5kK4/k56kYB+KYt6C1KLTp9fzw6NRSVVmrSTDNiC5dPf16X7pOUB1VlLGghcHtzBJF76U/UGFsUpOgqMfD9dElr4tUYgbcz3XGS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd4r5c9W; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd4r5c9W"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de0093c42so3762127f8f.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040402; x=1787645202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3gyymCw2mkTKTP8bdUhLC8gklixH+KEg3+DpRRVJRc=;
        b=Zd4r5c9WNgCglm4iw27dCN1ofVIoBlVq46MgFey2BP3sbCiRZX3Yg/pURGbo/e+XiY
         zc3bQm+vHFs5EvHKG4DR/+HxZ5aAqANhsX719G1IG4QQ4GQd9wBZfS+3bNiaUX/celmD
         uqTyh+ltDpJH9JJ6hRouTmUq5U7wr71AQjUDOsSsqfesjDl6SzcWc8BuUf+Yqh4UZjJi
         HyHFb8xzHdU2BTGEebJQuterk+k0rK76GqwDU7K6BkONPthhPZ8PJDYqrmrp8fqQfXuq
         XmXaFWwpLWug41AC84f536u6//luL+ElapB5TwDjh7Sd95ayB27RSI3HfHjkXoPqVxCB
         f/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040402; x=1787645202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3gyymCw2mkTKTP8bdUhLC8gklixH+KEg3+DpRRVJRc=;
        b=OlOKc9ZObBac1nvcBi9VLj1GCFqDuKlBES5GK1McMU21REA0yg6Zx1YbmiAO9YTNH0
         NvqNYHeMfZq6DleiiZ7uYThzHCzicq+TMKqZfpZwL9kSMF04j9HgJuxq30tuZ3tbYZO7
         voWXfeCJ8d4iheRmJgmhkZUemPSJ1SwKSxjZGimxglaRm+0e4ElV8QjJdXBNzm9VtzXM
         yKvkinlvi/5x2C5WQGOuInn8pZr/MJYkaJpEebQfK/vSMP3NKPWHFaBU94COq3C4kw11
         zS//xTD+JH0hFg3uCgHNiL2llFnrHnMzJNB/TtilGlRaqij3UDqZDGdvlKMpJmsczPZ+
         Ms/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoPrMrJTjIwEw/fWkGzVXO0OFEo3Cl9bKV+yThruVuzy6ExF1gsHmWqvYvg6Lz9AKRS2U2qm1Td8Y1E@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWO0M5d4TBWT5iVxUop64Z335FsuHc3MikWbG0IMGzawstdRb
	RDYoyd+jEZoAtnQwnlXdT5Y49ugmo04jZMsgxksA/7HqpDGJdFjl088am9wcBt4H
X-Gm-Gg: AR+sD10nuGQ56bgkVUbEPI6ELIKFJI7gtxz0szCC02i0vrezjmIn/uZigWyX1XjHdP/
	+Pxln1/TiyLXHP0Fe+xHmtKX/urN7Su33efLayfTe5qwFz7qVpGXJ4vcfHtEh+suE/w7HmRTRrB
	e6MOI8GFO68L3cON6qRPBnZB09eX2nz/5/+pEdHYgONzMYCSINlJ1xHC/Uf61vG/xmj+kzHFSIv
	aV+R34IMzZNWzP6AtBibG1iXEEUZ688TsCjEsFBt+slHhr+xEMcglIlNRRqhUsGIy9jWyoWShi+
	dpZ6oGz1R7n1iWvZyl9iCatOX3D8ujpDaeFrFNpqEAYDCHE78ItrvTW1ZkpaKsdMVrTL9SOI+ja
	iDFkfQOatv0u2Tk/71+Ms1Z98KXsgy0CoBYzCm3lbKv3iRf3lx/cRV+Y+XuTEVUlx+1eCSooVnL
	wuF/t4jqWRbqmNqul3mqQ14SwNuIYJzI84evTRQ7H/1u9KyT/dTMah9ZzUM9iM4ps/QxGyaZcTn
	Cg=
X-Received: by 2002:a05:6000:18a9:b0:47f:8ac0:ccb4 with SMTP id ffacd0b85a97d-4816071a60dmr44149734f8f.10.1787040401603;
        Tue, 18 Aug 2026 01:06:41 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm10367223f8f.9.2026.08.18.01.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:06:41 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Fabio Piparo <holofermes@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v4 0/6] drm/ssd130x: Add support for the Solomon SSD1351 OLED controller
Date: Tue, 18 Aug 2026 11:06:20 +0300
Message-ID: <20260818080626.30430-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Solomon SSD1351, a 128x128 65k-color
RGB OLED controller, to the ssd130x DRM driver:

  - Patch 1 adds the device tree binding.

  - Patch 2 switches the SSD133X family from RGB332 to RGB565, bringing
    65k color to the SSD1331.

  - Patches 3 to 5 are preparatory cleanups requested on v3 [1]: constify
    the ssd130x_write_data() 'values' parameter, convert
    ssd130x_spi_id[] to C99 initializers, and reimplement
    ssd130x_write_cmd() as a variadic wrapper around
    ssd130x_write_cmds() so a single loop remains.

  - Patch 6 adds the SSD1351 as a new SSD135X_FAMILY. It gets its own
    primary plane update/disable, encoder enable and backlight
    callbacks; only the callbacks with no family-specific logic
    (ssd133x_primary_plane_atomic_check(), ssd133x_crtc_atomic_check()
    and ssd130x_encoder_atomic_disable()) are reused as is.

Testing:

  - Patches 1, 3, 4, 5 and 6 are tested on an SSD1351.
  - The SSD1331 RGB565 change (patch 2) was kindly tested by Javier on
    his SSD1331.

Based on drm-misc-next, as requested on v3, now that the ssd132x/ssd133x
column and row end address fixes have landed there.

Thanks to Javier, Andy, Krzysztof and Fabio for the reviews.

[1] v3 of this series:
    https://lore.kernel.org/dri-devel/20260704080925.75113-1-amit.barzilai22@gmail.com
[2] Command parameter path discussion:
    https://lore.kernel.org/dri-devel/20260811122603.30773-1-amit.barzilai22@gmail.com

---

Changes since v3:
- Rebase on drm-misc-next (per Javier). The v3 dependency on the
  ssd133x update_rect end-address fix is gone, it is upstream now.
- Split the ssd130x_write_data() constification into its own
  preparatory patch (per Javier), patch 3.
- Split the ssd130x_write_cmd()/ssd130x_write_cmds() unification into
  its own preparatory patch (per Javier), patch 5. It is a pure
  refactor: the bytes sent and the bus transactions used to send them
  are unchanged for every chip on both transports.
- New patch 4: convert ssd130x_spi_id[] to C99 initializers (per Andy).
- Patch 6: give the SSD135X family its own .atomic_update,
  .atomic_disable, encoder .atomic_enable and backlight callbacks
  instead of branching on the family inside the ssd133x ones, and drop
  the shared ssd133x_write_pixels() helper (per Javier).
- Patch 6: the SSD1351 command parameter path is now driven by a
  cmd_params_are_data flag in struct ssd130x_deviceinfo rather than a
  hardcoded family_id check (per Javier). It stays in ssd130x_write_cmds()
  instead of moving to ssd130x-spi.c as originally agreed; see [2] for
  the reasoning. In short, SSD13XX_COMMAND is the I2C control byte 0x80,
  whose Co=1 bit promises exactly one payload byte, so routing command
  buffers through regmap_raw_write() would have changed I2C command
  framing for every existing chip. Keeping the split in the core also
  avoids duplicating it in ssd130x-i2c.c if an I2C part ever needs it.
  Fabio reports the SSD1322 needs the same flag and plans to send
  SSD1322 support on top of this series.
- Patch 6: the SSD135X family now registers a backlight device like the
  other families, using ssd135x_set_contrast(). v3 skipped backlight
  registration for the family because SSD13XX_CONTRAST (0x81) does not
  exist on the SSD1351; the per-family backlight rework that landed
  upstream in the meantime made a per-family callback the natural fit.
  The SSD1351 takes all three color channels as parameters of a single
  command (0xc1), which ssd135x_set_contrast() handles.
- Patch 6: drop the post-reset delay comment in ssd130x_reset() (per
  Javier), it documented a mistake rather than the code.
- Collect Reviewed-by tags on patches 1, 2 and 3.

Amit Barzilai (6):
  dt-bindings: display: Add Solomon SSD1351 OLED controller
  drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
  drm/ssd130x: Constify ssd130x_write_data() 'values' parameter
  drm/ssd130x: Replace positional ssd130x_spi_id[] initialization with
    C99
  drm/ssd130x: Implement ssd130x_write_cmd() on top of
    ssd130x_write_cmds()
  drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support

 .../bindings/display/solomon,ssd1351.yaml     |  42 ++
 drivers/gpu/drm/solomon/ssd130x-spi.c         |  25 +-
 drivers/gpu/drm/solomon/ssd130x.c             | 414 +++++++++++++++---
 drivers/gpu/drm/solomon/ssd130x.h             |  10 +-
 4 files changed, 426 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml


base-commit: 09b47186a4164f3aaa3591313f80794443117342
-- 
2.55.0

