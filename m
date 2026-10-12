Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3334398F1
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787533; cv=none; b=s/2jfzeukz3afJJzxhwMx1DN21JSE2DIVnFYQaH4NqjNaNxH11FrBkInD946/p5LglICkGEfz14aM8amt25XY7lGz3o0WBPYUcyd+eQx/3zr8GHdOcaaiQRdR+k9uE0hwdGZYw8hjdist6pYxrhzq394AtW7IwPGholexc81kEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787533; c=relaxed/simple;
	bh=vsU4fgWUxgVst/irsBNGMIJwmmN6QEqkg+3ocfgqJIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ja9fC2Dx4xhpa1bVePEUKLvEAj4v1+NGFlrISpwc6YccsEptB/oB64+mT07LEF+5/CIiRP2fzMQntaq27O44ttWlcuozmMUMe3C4Sv3RmbUGNU6SMZRj/8rppot3GohON8sQO/ON2jmH301/jt7obEM5eC/YXB6eTAZfpPddvc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCF0qcYG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCF0qcYG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8c028eefeso699685ad.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791787531; x=1792392331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouRjuP1RtfyniT15YEA/gc6km+f4No4a2cccPN4BtkA=;
        b=OCF0qcYGuEnTa6dx+ZEJcwtC4eZOe41GLVJphuY3W4FC8YskluGt1j8AN124c8idPr
         NZu/oBoRkta5EO7WJ9MVnvGkIwyTrOeUKsM73SgckUtJyay6CHv7BwseFTQqa6J2+Jfh
         b8OZCVpKxa3N6geEL5kO7lthgaMX5vz5JiqK9hLhwmzqclVkJdIXekigw1453emZhwyi
         zzckSI76cTapythkX/MwhDKQGuplkrEHb9f6wyYEjaLmMqWyBj7baqAeqZA2cvpy33Nd
         7vghuFVBzhEEODpzEwTQUqY7RKKr9KWZsy4wNVoMaPQVrO8C/nATg7eVdsIBy3ZvaFVr
         p8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787531; x=1792392331;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouRjuP1RtfyniT15YEA/gc6km+f4No4a2cccPN4BtkA=;
        b=L7Cbm57W9rL7UQeTXDXY5kzKtHSjWqaCM6VdVcCdVgVI4tlTyaFfnIlCd0/FXq9UR3
         wSE6VTxRk5rJVM8Jo05UfKYZMUFMfpALBdzPz7t6zrMOohYZsRL8gWF7d0Vhv7/NTQ0d
         cNXOm9CA+CoWNVNL2gP9wqnlOHt6uBzhx/V3eg+6uOdt3gxqHJkNqh23dVuRhYBuZdOl
         /26Q9APLB0fXerzaB1Av/1JW2NGPqGoRd0oWMB/eQiQKNeHHNhI0bH1KCBVpx9DbwyNA
         ck6eF8+QAjkTcf7FrERo4jwVKCbIPCDLordvc5Q0ImhfDfvSX2C5N+KkS3qNofcUoaU+
         3OFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/ndetdD9ouFeEiAZrrJCx36KfO59Jseq5wn+eYJ+Zbsm9+ZCg0KLEy5ncwDol0iTziJrR5sICis2+@vger.kernel.org
X-Gm-Message-State: AFq9FYJv3XU34yQt8n/RRlT3MTicPOjayxNRgkWe4oEONzzRlpcJqVlo
	Ug6LMj7j0XWdLRLScMtZ1vEt00i7cJW27aaBTOPjn/Lt8pq5iMicWvML
X-Gm-Gg: AYBFou2SB3mwx/GRh4cvoqFYS6yVDSUQwGoun8p4krDwSHGjZOuIDt16XZ7kipCN1t7
	+u4onml9CG0o8YtrOsSDo9O8+1VCXesue3chVhTs9b1/EbOK2X+yFnwOd5+RopFvo8spqKppsXy
	kni0SW0mXoFYGH1yS/+5ls5q1nyEjzMXvSs3QvkoY6lHdIqrKOaL/dHe3fS2jOfq0yd2W+qtiyt
	0+P9cUSQwj6XJjSSS6nHraAl8GKvPbuTFzQo53tYieBtS3ovUy5/ucpEKVPZeayibk5ujDaHBiq
	oFmyZODbaFFNIqxlDiWFleqpCHJyse5VGwE8SSMdABC6ipx3DMGCvcPZEjih0zauxnp35NAlyXj
	mPi4ucUQNpNTmvAtFbKYZLLvFSbxh/mK2QaZHbFSELRFaTQfyhScOk7Ayb1aaJ1wyx7L7JnNGCC
	A9wNmyZZ6g3kNsQXYbl2MqFgQi/i+Qd8xtXoSta2eOSAx+fmfpuJ3VmxCAwlSrP7t2ssii
X-Received: by 2002:a17:90b:224e:b0:3a0:bcc8:1549 with SMTP id 98e67ed59e1d1-3ab3afb180emr11995577a91.6.1791787530571;
        Sun, 11 Oct 2026 23:45:30 -0700 (PDT)
Received: from marchy ([2405:3800:8a8:86f0:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm15052355a91.5.2026.10.11.23.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:30 -0700 (PDT)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	azuddinadam@gmail.com
Subject: [PATCH v4 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Mon, 12 Oct 2026 14:45:03 +0800
Message-ID: <20261012064518.3497285-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a new drm/tiny driver and matching dt-binding for the
RAiO RA8875 SPI display controller. An fbtft driver for this chip
currently exists at drivers/staging/fbtft/fb_ra8875.c, but fbtft is a
legacy fbdev-based staging driver, and nothing in mainline DRM
currently supports this controller.

This driver does not use drm_mipi_dbi. The RA8875 SPI protocol is
structurally incompatible with both Type C options drm_mipi_dbi supports.
Type C1 encodes command/data as a 9th bit within a 9-bit SPI word. The
RA8875 uses a full prefix byte (0x80 = command write, 0x00 = data write,
0x40 = data read, 0xC0 = status read) sent as a separate 8-bit transaction.
These are not the same thing and cannot be mapped to each other.
Type C3 models two transfer types via a D/CX GPIO. The RA8875 has four
transfer cycle types and no D/CX pin.

My ER-TFTM050-3 board has RST tied NC, and VDD is a fixed supply
set via an on-board solder jumper rather than software-controllable,
so I couldn't test reset-gpios/vdd-supply myself, but added them
as optional/required properties respectively per review feedback
for boards that do need them.

Tested on a Raspberry Pi 3B connected over SPI to an East Rising
ER-TFTM050-3, a 5" 800x480 panel driven by the RA8875 in Linux 7.3.0-rc4.
Based on drm-misc-next (commit 73df79cceb8c)

Link to v1: https://lore.kernel.org/all/20260916175942.3186804-1-azuddinadam@gmail.com/
Link to v2: https://lore.kernel.org/all/20260924145400.1385815-1-azuddinadam@gmail.com/
Link to v3: https://lore.kernel.org/all/20261001144128.2336301-1-azuddinadam@gmail.com/
---
Changes in v4:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
-  Drop the sentence in the description saying the binding covers only the
   SPI-connected device (Conor).
- Drop unused panel label

drivers/gpu/drm/tiny/ra8875.c:
- Catch error value from ra8875_write_pixels
- Use consistent include header format.
- Return if fb is null in atomic_update
- Drop unnecessary extra byte in pixel data spi write.

drivers/gpu/drm/tiny/Kconfig:
- Add depends on OF, which is caught by intel 0-day[3]

Changes in v3:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Add gpio.h include in example to pass dt_binding_check
- Remove spi-max-frequency as there is no reference in datasheet

drivers/gpu/drm/tiny/ra8875.c:
- Remove debug-only ra8875_read_reg function
- Chunk large SPI transfers to 16 rows per chunk
- Remove unnecessary includes and spi cs setups in probe
- Create ra8875_write_pixels function for clear_screen and fb_dirty
- Use 2 spi writes instead of 1 write with 2 transfers and cs_change in write_reg

Changes in v2:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml (review by Krzysztof Kozlowski):
- Add hardware description to the binding
- Drop the display-timings property, and instead require it in the required block
- Add a required vdd-supply and an optional reset gpio property
- Rename the example node to a more generic "panel: display@0"

drivers/gpu/drm/tiny/Makefile and Kconfig:
- Remove TINYDRM prefix from the config name (Thomas Zimmermann [1])

drivers/gpu/drm/tiny/ra8875.c:
- Reformat device_id table to match current convention (Krzysztof Kozlowski)
- Drop unneeded linux/mod_devicetable.h include (Uwe Kleine-König)
- Use drm_dev_unplug() instead of drm_dev_unregister() in remove callback
- Move stack-allocated cmd/data buffers into ra8875_device struct
- Add mode_valid() callback to validate height/width against panel maximum
- Add optional reset gpio
- Use dev_err_probe() in probe function
- Remove connector detect callback
- Remove unnecessary |= on register write return value in hw_init
- Migrate from simple display pipe to manually-handled plane/crtc/encoder,
  following the simple-KMS-helper removal effort [2]
- Use defined constants instead of magic values where possible
- Use drm_atomic_helper_damage_merged() and drm_fb_swab() in plane update

[1] https://lore.kernel.org/all/fee2a743-d3e4-46b4-812f-05c3cc3a46ae@suse.de/
[2] https://lore.kernel.org/all/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com/
[3] https://lore.kernel.org/all/202610042347.idGisdDW-lkp@intel.com/

Adam Azuddin (2):
  dt-bindings: display: panel: Add RAiO RA8875 display controller
  drm/tiny: Add RAiO RA8875 display controller driver

 .../bindings/display/panel/raio,ra8875.yaml   |  77 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 719 ++++++++++++++++++
 6 files changed, 818 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0

