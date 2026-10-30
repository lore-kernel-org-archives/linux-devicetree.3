Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350161;
	b=JKKaZpwdFErlUzom8tQ41AFXX/PawE111TY294olfo0JPqdQAYmBpoGLqdKjIXR/nih8
	 ffgcJZc+mUg+haIirnmYfLS6ozcb5CGibp9v99/4RjPi4mIzNuFkcJcavb5o+d+wTz99E
	 gsmhv7cYyLzsOuUu+JQGCp2Thcgjgvm+Caq8yNCUkjVSOt8s7GFmAdg1oXdqloEhQZUxM
	 RXjh6A+ll6WMk8R88kbXvOP6e6BOjDKlihO+4SZZ7AbzSm//Zdl0h7Ldw8M8Mds6taQfW
	 D3jZrVj75mSl5o1KUExJVYs8/FQqZlqkYFqlmSmKCuAyfjFs88GCW1vbErzXJcRP+6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kKraBs2ABl72GsuXTCZX2vWgKGWo1rPo+MH8y/IARx8=;
	b=Ti3Cq6tE9TkPm3VNlHxr8UVjntYH4UJQ9O22WxR8Aw4/BbNs6Lkjx2b29p3gHP92LJM+
	 JTGGKTBi3IRi+m+3ccxpzxs6r5Dz14lIHZ8m9KR1nCj+jeBQ+RsOyBIY/CB8CLJDjSebT
	 pxvKtzSDSSlI9xGo8VIyjbCXKwhPs/yeVMAqxbtn+ytm9nG0AY3ljFd8R23r4PuALOIak
	 HzH6S135NVvTy7a3lGLqWks6aeXybrckzEgWVRWOE07/gnC6uwlEA3DiqMwLhmwUiKK77
	 i3BS0CH43m8sQyScOR8lexvyooFufYDk3J3++Tv7e7daX3Oayga++0dR0ujvEs8qPkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9rVe45i;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168EC606A32E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168EC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9rVe45i
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9ae47b00cso1058945ad.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793350159; x=1793954959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKraBs2ABl72GsuXTCZX2vWgKGWo1rPo+MH8y/IARx8=;
        b=F9rVe45iQzNrTv43SxJqYE5QpTfIRjJfY2rSlIKv1Onaf8bTVerOql16Kt/Q72POHq
         Zfp7C6Onm3fo4qcxJZf7VpFN91JjGZEkroajWVC9f3Cqb86nw6c6ue1nNmfmAso2RoKK
         1hd6dfLCWC+UoKh+L2BV47Jehvb4/v9lXcM7Xbd0rU7YU4WrWVnPFg6vjxKfgDChfxhT
         SR3PeK/0a8rdeA7nRFoHRIMqnFubMBUqSdf3iQ/aHtO9VVjvpT46ucE5lHF1/wXAVOYZ
         Uyo/9YEWG5gcxUW2fnD6zC9jT+aIv64AWUxOWcQXhWQf+SgUlY2LWvIr1+kL1K3OEiOu
         9FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350159; x=1793954959;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kKraBs2ABl72GsuXTCZX2vWgKGWo1rPo+MH8y/IARx8=;
        b=FZJ3aBG7SMw9jUdmnv4xa1C1R5H6gtmDo6q+wIkKbQxnuz9Gt98gb5YkGbJ3OyoJ8K
         kqwkzjE88cCP71j9KnFsxsRsB83vbzEVFZkIUVhNGA278H7vPYYolGEfB7DYInB6FOWp
         Dpfw6qYhTqI1cRs97WkKR4e5ja+wDWHATDx8VtXLGGLUow17ipM6IsqoHsd2wKYBU8xR
         lJsHymcebEzJST9xfBkd5TLstuKc9AK/nXv2neei5qoCsJSaMlRv3DF1c1EBBD9Bc/VQ
         e2Wet+bJKdzPjxcImHeHE1bf4RhGtFbeM1+Xb+tUdjrNHlMMQlLkmUfTgR5ckJyFTBV8
         jd1A==
X-Forwarded-Encrypted: i=1; AKwUvBxo5o2wpTII4B5s3wharAADBkILmbdHLXxZdBqG/jjShRZGIMwJmkdO9+eY0XZp3z42m1hpAcFE6kM+@vger.kernel.org
X-Gm-Message-State: AFq9FYK03lpN0I7GoE1axeue9QKD52FbeuRMCqAD7mD1rxiOPZEr2TnN
	gNjCGHOrLrxAJ1b3tnbhQjTHfNSt1RvqGGLrybBVufZMHV5zbRg/Jdpi
X-Gm-Gg: AYBFou31b+dVS2lFWee/3CCvcdVhHVXEfm/yQTT0udn4Glw1e5ti9SUMb/D2bRb1ZWC
	yiryWTRLJFu8X4qy8ImbFiSuPomLiKH9+Rx3Jw9yKAVKdC3Gxh2w/C6waX9gyfJs1hp4/8SK+7M
	o0NFotsbdaKKJFahaQqEfm0/o76vqkaCbwsxT28XhCLwILkC6bnk3xJA/1SwGa1cfsLv2glJjcu
	UHtdeV8LOxviDlsw/c0+VBVsys/9/ZAFjRkUhgTSCqGwYxRjU8tWZM2EVh294BismAujuUmy75J
	SXyj1vpwFtiMYYf0kQKVjeQhmzyz3m9TqJ/D9qBNeIHvajQJDpIiZgtnkC8ZcHRLyyQi9oxW+PG
	7/HhN7qpohcphssOqQKPYHVHYnUBdkoXR4I//vWQLq5JjOI6fMgNBU9oPtL4nxSSqVNCJcw6Nuk
	Y2WqfJPlRJQEimNu5pURZjE/6I0CXb6woKA56/wFieyKhz9z5pzLSxOmTqutxyfSnRwz4amOje+
	ufXGmUvVpR52DEBl9u2Vr9L29yyAUdKAPmnTu5E9wlRdFo/4XKp1X/1tKGWO5ri9q8rMjAvDOdU
	vzH83zVBMejytccWTkXZJg==
X-Received: by 2002:a17:902:d502:b0:2e9:6788:937d with SMTP id d9443c01a7336-2eb364bbb77mr30486455ad.4.1793350159314;
        Fri, 30 Oct 2026 01:49:19 -0700 (PDT)
Received: from marchy ([211.24.73.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm4576265ad.73.2026.10.30.01.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:49:18 -0700 (PDT)
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
Subject: [PATCH v5 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Fri, 30 Oct 2026 16:37:34 +0800
Message-ID: <20261030083737.47188-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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

Based on drm-misc-next commit 73df79cceb8c ("drm/virtio: add ARGB8888 support for primary planes")

Link to v1: https://lore.kernel.org/all/20260916175942.3186804-1-azuddinadam@gmail.com/
Link to v2: https://lore.kernel.org/all/20260924145400.1385815-1-azuddinadam@gmail.com/
Link to v3: https://lore.kernel.org/all/20261001144128.2336301-1-azuddinadam@gmail.com/
Link to v4: https://lore.kernel.org/all/20261012064518.3497285-1-azuddinadam@gmail.com/
---
Changes in v5:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Drop the "Add YAML binding schema..." paragraph from the
  commit message (Krzysztof)
- Add interrupts property for the INT# pin

drivers/gpu/drm/tiny/ra8875.c:
- Move bindings table to above ra8875_spi_driver definition

Changes in v4:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Drop the sentence in the description saying the binding covers only the
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

 .../bindings/display/panel/raio,ra8875.yaml   |  87 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 719 ++++++++++++++++++
 6 files changed, 828 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0

