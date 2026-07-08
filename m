Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0817F39C002
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522153; cv=none; b=Ed2TcVinvSEsGLqcMxQnoO5w8A2RMsd4zz0IjCLf/bhZVW9gm8SlGNgkQvIH+kGTRGrunVjGqd00YSU/U8ueCTCFa51l7YgorrKXhTKKhqFIJMRpf8BbZTUbOK4mzqzheVgTM8+1CuoTrEqfeYTJtWzZ+dnc10/m6K/rqkwEoaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522153; c=relaxed/simple;
	bh=PkeGhFY6Q42iKyZEdGoFgAB7t8bmf8m/485EG3n+oRY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eDBntN3gz/XNu1S081UV987FMJKGv9ZfOgVsieF/ETBbokNoIyM+T2tvVlaa7uKgHPJB94SjUjbdWk8XDdbKGBb+ZiAF/B7Vj8TlNXFBktm6Zu9qM8APjJABfSdw5zvaR2sFjpS0zmAle2PxW1vxhDzlQuog2sofnTJK2cmBfzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=o6yL/UpS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="o6yL/UpS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b7612475so6836775e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522149; x=1784126949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+9UPnmVuCFG1wL2SpxDmmWCbWX/vi6kSuhm5BA8bibE=;
        b=o6yL/UpSmSDW2dVhQoz4j/Q4cZCyABd8cE9AmDURtvPlwE2/A8JxsG1Y8QJXs+/r6R
         kMySTvdp/VZZVyphXtGIkoXIUslKQxptH3I/bvtkbz/Lsuhn2QK4NXDpbcRuM7H+/n5H
         Vf36/mfwcrsxfzUhBZzFnfBdgDjVaJk4COp//EonzSnip5b6Sg+qh3UQ5nZRsVijgJ+r
         I0gZsQ7bPVDD4DJfHSXKNbsfLWdRcfYXtJvTjM4g29mSiP7AdBAf4otS/8hbCFqDc2iU
         YXQsQPfcT2T/eubmJF8QcOOtTGGVBBwb7otmbZndnSvnmOvs98+J6PF3gjdIbDPpRmzo
         XtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522149; x=1784126949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+9UPnmVuCFG1wL2SpxDmmWCbWX/vi6kSuhm5BA8bibE=;
        b=jf9gcRiP4R9Y9oinn6xbdiHDO0hq2vCIunklpd8hDaTLeYwEsPm1piBvFpUA9GErV3
         kq7UeKQhAcv1Y6ElS6yXlszUkpcNpXt0/wmhXoK2SnNLrROXZV0Crz1YXErB9+4DN/ur
         6UVJOvt0fsNy/GH1PeEDGrJA0/J/a2lEkWdszsOvdcQ9SY7V0V+a1A2wJ8XPNyJt2awa
         Oeww0kBSa7SmJ0gTUeN1rn/tj4PtMMqsj+D8Wdy5BU0B5trx6GMX76mGL7MoRg28bDx+
         QF3xbYcyPSA+xkC+LyrCgkKaXVDws5TxaMOLREE23Gp2NyjiWm3kawmrkuea/aOJxqcv
         5NwA==
X-Forwarded-Encrypted: i=1; AHgh+RpEZ6/4oFYflRlOPPUfbAQThQaANwvoY2GKmlZZqDngSRmhH5mCwMqk/aQoT8I6EoeTuaMScndATcpP@vger.kernel.org
X-Gm-Message-State: AOJu0YzIKktTDc+hkDOcFTIgT8aIYi92MGAzrMVOMzgMbRCQnqlcp2bZ
	RJsbccoD9SicnIEdIXF2Es/KkXtckTk94e35YWav31BqBUCEzY7egsZ6mh0iF7Pw9peTsBD5VbL
	qP4J/
X-Gm-Gg: AfdE7cnlsz/aPQwNMt40qlaPy2J3MeuBPepwSIttOQG389D//Qtltfe41dCq+smIklD
	QoND19olHmgZ3e9ZXUyjyQrzlPI/RTq4A7lo1Am9aRfXiTCd6rxKHBleVRm7pPCHjATFgbYKf4a
	K20sxRVexKs9tNfbVD6RJ5+Es5A/VOPdQFl1/x52AVdLFZRWOxPKID3cXvBIkN7GFcp0ArpE3Iv
	dk/c6O3kx4xBehjPUdMlokxu33u7YnHWgryrBNOzFTMGK80Mv5eQIDtUguSxg7jxkiq5N6XEShG
	K0jS4fvBkOEMzCzDlKP3Yboq6omvx2cuK/iNYIzzhYgDl6oB5AajxhRJG3j6D8HWHVp84qxd9Gc
	K8BkHA7YDf1QYKRyfIhNBuDOEBGbykyZa9XVcQJyGfpiWdLz14Sy6BVc9Vc5TTJyxbaTGLPsi6j
	TIOhPK/z07JSDULx3MZP5sGlrrMXKOP2X417Prfuy+uyTgRVbxRRuNBUHSet5UUdlx
X-Received: by 2002:a05:600c:1c0b:b0:492:4c2e:9613 with SMTP id 5b1f17b1804b1-493e6864191mr34475145e9.18.1783522149227;
        Wed, 08 Jul 2026 07:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:08 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 00/20] media/imx355: General code cleanups, and adding
 support for 2 lane operation
Date: Wed, 08 Jul 2026 15:48:36 +0100
Message-Id: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERjTmoC/23OTW7CMBAF4KtEXuNq/DN2YNV7VCzseAKzCEntN
 AKh3B03LJBol+9J8827i0KZqYhDcxeZFi48Xmowu0Z053A5keRUs9CgHSA4OVDiIHm4GkQZDPQ
 YySRKQdSTKVPP1437Oj5zpu+fqs7PUsRQSHbjMPB8aDTa3u6dsUTKBW+U8jbpQMbGDiEm7C1Sr
 cWvdeYyj/m2LV3Uhv0/alESpHPgWgQDFvEzhzJFyvk28Uf9vXGLfhEe/BuhK6Fca6gDH9u9/0u
 s6/oAPZoVtD0BAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

This series came about as we had a customer ask about using imx355,
so I had a look at what was going on.

There was significant duplication between the various mode register lists,
unused parameters around, and no support for advertising the crop
rectangles through get_selection. It also wasn't using V4L2_CCI so
had all the boilerplate for writing registers.
The customer also wanted to run the sensor over only 2 CSI2 data lanes
which required some rework of the clock setup so that the MIPI link
frequency could be run at 445MHz instead of the 360MHz used for 4 lane
mode.

V2 has some fairly substantial differences to V1 as I obtained a datasheet.
Whilst some things worked perfectly, the datasheet declared them as
prohibited. This was largely using dual PLL mode in 2 lane mode, and
LLP is restricted to specific values. Link frequencies are therefore now
derived from the PLL configuration, and pixel rate is computed from that.

Being able to refer against the datasheet, I've pulled an updated version
of David Heidelberg's patch for 24MHz clock support into this series.

I've tried to keep it that the earlier patches are largely cleanups or
minor improvements, and then we get adding 2 lane support, and converting
to using subdev state as they are larger patches.

---
Changes in v3:
- Fixed a number of issues picked up by sashiko-bot
  - Unintentionally dropped writing reg 0x030b, which is at the default value anyway.
  - Swapped len and val in intermediate patches adding imx355_write_reg before converting
    to cci_write
  - Initialise colorspace in _open for try_fmt.
  - IMX355_REG_TEST_PATTERN is a 16 bit register, but was defined as 8 bit.
  - Call pm_runtime_dont_use_autosuspend on remove / probe error
  - Missed subdev_lock in set_stream.
  - Not addressed the pre-existing issues of double power_off in _probe error path, nor
    potential for VBLANK update on mode change not calling s_ctrl if the new value happens
    to be the same and therefore exposure range being incorrect. I'll look at them as
    separate fixes.
- Variable definition for format and state in imx355_set_ctrl got pushed into the wrong patch 
- Collected Krzysztof's R-b tag for the binding patch.
- Link to v2: https://lore.kernel.org/r/20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com

Changes in v2:
- Collected Jacopo's R-b tags and implement his review comments.
- Add patches to switch to using the subdev state, clean up colorspace
  (sets RAW), use a define for the exposure offset.
- Added DT binding update to permit 2 CSI2 data lanes.
- Link to v1: https://lore.kernel.org/r/20260506-media-imx355-v1-0-660685030455@raspberrypi.com

---
Dave Stevenson (19):
      dt-bindings: media: imx355: Allow 2 CSI2 data lane output
      media: imx355: Remove duplicated registers from the mode tables
      media: imx355: Remove setting FRM_LENGTH_LINES in the mode regs
      media: imx355: Programmatically set the crop parameters for each mode
      media: imx355: Set register LINE_LENGTH_PCK programmatically
      media: imx355: Set binning mode registers programmatically
      media: imx355: Remove link_freq_index from each mode as ununsed
      media: imx355: pixel_rate never changes, so don't recompute
      media: imx355: Remove redundant fll_min, and implement fixed offset
      media: imx355: Add support for get_selection
      media: imx355: Use pm_runtime autosuspend_delay
      media: imx355: Convert to new CCI register access helpers
      media: imx355: Set the colorspace in the format
      media: imx355: Define the exposure offset, and use that define
      media: imx355: Use NULL ctrl_ops for HBLANK as it is a read-only control
      media: imx355: Compute link frequency from PLL setup
      media: imx355: Support 2 lane readout
      media: imx355: Switch to using the subdev state
      media: imx355: Remove storing cur_mode in the state

David Heidelberg (1):
      media: i2c: imx355: Add support for 24 MHz external clock

 .../devicetree/bindings/media/i2c/sony,imx355.yaml |   11 +-
 drivers/media/i2c/Kconfig                          |    1 +
 drivers/media/i2c/imx355.c                         | 1518 +++++++-------------
 3 files changed, 498 insertions(+), 1032 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-media-imx355-a30f5be3deda

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

