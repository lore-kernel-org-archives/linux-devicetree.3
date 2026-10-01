Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537451AFF8
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865700; cv=none; b=rfLyYSaDSgmYby2XVgKDuf0YTFIvkFK3WKyPMMF+EjqZjhJh3CEjtl0OwfAU/fwwgwDEmfosv3M0Q1diMp+QXo2ixHvQnCjgIhQbLr48vU969yyKu7f7Q09GUhCdys60f6jfs4TqVRS+1OWHBZKBhW9ZR2Dzm1DgFRF2HNtr+0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865700; c=relaxed/simple;
	bh=SmCaPRW5RB/lhe6ewDGMORKqP7nGfg2f1E6wKHp4eIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mz1BmnMfzZF+XoQoy6E86u4lAcB+UPCyQkgkyCLTopLM8GxfFQdUgTKNRwQUk4ABCmhHn8A1BL9704/r81LfSomtlewHX3ktICHzw4h1jfKrJ4tbqguqprTdU/gaSlURjRjbi/4+FgWZt5JYVkSgzrJKahcN1pDLzbzIl6ds+5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1Hei5Gi; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1Hei5Gi"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff2b84fdso3823025ad.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865695; x=1791470495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCSnuGxp9XE7dQhnhZvQokcC2NUIPJCMksF4os7NREE=;
        b=L1Hei5GiXQ89bBJYnq03Najnu+KIXzbSwI7LBsTVbHyCOYF3peAzEGs2vpcBu+HLpt
         KpvaMt/o/lJEk/AIOLOQ/f4VRRTPn7VJK3hOBXFVN0Th1DqZVIq1kL4SJZaRnj66OcIZ
         AIqN5UNeEuRizMmKRJIa8Z+nI6v2NkvgZWCKpOPanyvzOdXDDmPZZ5MJ5dZu10ZjhmIW
         lpKFl0nzWDBD5IFNo/8p+/RL85nDsPjs8P7d3qvgX9yEPlEKIR4IjptfmUDJjQSzewto
         UMS7M72IPRUFSz9kmijOpGVleiTI/eKcI7+9WYTzdbik5r23DatbqYluRTv2l5hvt1Se
         cpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865695; x=1791470495;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QCSnuGxp9XE7dQhnhZvQokcC2NUIPJCMksF4os7NREE=;
        b=UUinqN7i6ulF8XN8xHTS3OUMbd3uodHpcvLVSoez6IGbOP/BV/N4h+UqL1TJHePfyZ
         DWhRUTEt2xsJs1MT4AolIbiUV3c+Yor/uuc6ydbsTX4NkN5RkI9ZtbB6d1e/1kw5UZQa
         GT5gWn44oQZBNgwtLjTUF/8O+EoGLvmunGeOm1wc0o/l4U5bTJn5LOJKqOfwx+lUplQb
         15eeFdZd1ycL5fk5M69/bxAGMN2cQYOYid8ACeD+P9SAwQNIzfVarCwMwnPfDFCMAdWt
         lPE5C0P0gUdJM1uKhC7mhUtSBdYySZaXNWX5hROLUpBP4jTuDv95I2P7cdKvUV+M2e3n
         jewQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtRjLYTJdXAQOQNjcEQAdFz/YfzkSaExVnZzt/w39wlJOMwt5C97i1AeUXagKo4nYlxSn/4Kk2umiO@vger.kernel.org
X-Gm-Message-State: AFq9FYLn83IeR2Zs2eMIgniRI1r6wnpw/DoaeIxO3ySFwZ9BhX25+EJW
	qnNHpW39NAWSYzigJ78oUUQBXwHFw8LUn2VXaO1E6kvxNtPfY+ss10BB
X-Gm-Gg: AYBFou38zy2NHkhYGT8nvpjAvUJ9GbK/qCkmnS8Ceffm3AFKOV59bbQRPy8GW4MwSMb
	XUtn/Bwa0KOIOlD6zen6ket0nzZsEsggXtkjUbnIY0Tsqpyxg80D/DWLlh5uKrWxDRINxVozAmD
	5vNHbbZtcjwUQwHF1Y+33wf7QS9gxGZrz55+DR+Esj70UEz78EMnU0wkbnGb/ohBc6RIN5XKEu0
	PgWvWHuKSlQm0RCKZhlWr9/tQg0w8GMT3NyDVgS+3VSWVMjzMMJ7ExxDTy6BYvHSQFqCsqOwFuu
	bKdP37g4LyP2hg2nHRGA91sDUela3Gr7VZ2BnI3GmyBrKbZtWUhTt2nY3dm8iw6aWCIQ02NZGzP
	pm79rsnNqCz8cZ5MsFenbCTmXzMMSkPhDITkJOUiqmAFvbIvsK8k9OQafzVkzxCf0ce/3I3rJ9u
	XlyuBSv37/J/IPX8GmeH7W2zxsu4Oj0A2mKZ3ILhk4wc6f1CgmjTTmNs5oW0IhOjl9Gknl
X-Received: by 2002:a17:903:9cc:b0:2e2:cdbe:bcea with SMTP id d9443c01a7336-2e2e48cd1b8mr64108075ad.1.1790865694615;
        Thu, 01 Oct 2026 07:41:34 -0700 (PDT)
Received: from marchy ([2405:3800:8e5:44e3:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099c306sm11988435ad.21.2026.10.01.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:41:34 -0700 (PDT)
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
	Adam Azuddin <azuddinadam@gmail.com>
Subject: [PATCH v3 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Thu,  1 Oct 2026 22:41:24 +0800
Message-ID: <20261001144128.2336301-1-azuddinadam@gmail.com>
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
as optional/required properties respectively per review feedback for boards that do need them.

Tested on a Raspberry Pi 3B connected over SPI to an East Rising
ER-TFTM050-3, a 5" 800x480 panel driven by the RA8875 in Linux 7.3.0-rc4.
Based on drm-misc-next (commit 7c4bda20eb0f150315d19f1b51058820e75d3f3d)

Link to v1: https://lore.kernel.org/all/20260916175942.3186804-1-azuddinadam@gmail.com/
Link to v2: https://lore.kernel.org/all/20260924145400.1385815-1-azuddinadam@gmail.com/
---
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


Adam Azuddin (2):
  dt-bindings: display: panel: Add RAiO RA8875 display controller
  drm/tiny: Add RAiO RA8875 display controller driver

 .../bindings/display/panel/raio,ra8875.yaml   |  77 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 713 ++++++++++++++++++
 6 files changed, 812 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0

