Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06004E3244
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420104; cv=none; b=Ov8EkUo926eSLJZYbpknL+AGjjHF0y7O/6AjEiyuOT9e1jS6tef5M1U4WECXOqbBGBBU9+31r+4OQTL166eCAF6Thm/yFHHL1lpNiO2VFdbPU1A89O2MKq1dR6WC/hYjyMSxVFDqkzURi2Wia8Zggs4AcpX8dV8gqOL7EpYHRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420104; c=relaxed/simple;
	bh=u3yqHBU03QsLqMft9KIPPJ+/nOaInNkvfdJsD2ofFYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KwvFSWfmVHwg1ginfMbmzd3ShKTXwnBAyJx2RkA1potuiG9FMaIBlPn9dzCxUZ4UBwqt1pC3WzyLgFWAHcFPZQ6TmF+kkLl+CUVLHWw7aTZ4FywC1DUMlPakfPOtpSHw0zu0O6++HN9RJguXErr3WQzEp0Wx1bVaeIpjE1lx/8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=C7/jtdNi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="C7/jtdNi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1798159f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420100; x=1793024900; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aFenL6WtKoIB0uGYWQlfKEQvrS5xFRsP32DbZWJaJbU=;
        b=C7/jtdNiOMA9nQrBZnOtq2x0bpTjHn1Zbpih2s8rjHys0xfIUJMaGT66a9r8C2Ad3n
         5yyW5et+knULifFtngFrAUFGEc/t1re7xzhekDWsZ51iYNzEiy1+uoRqFcqLY7+UPHmb
         zKozhi2Wz4pb4jF5x1nG5IGHUwYGfjnRIxjdzP0G0aeB7iKSOjP/yPblzjzsmlWUPDs+
         TUMD+ll3UMmUBxDmx5mhoaNlvCB/AlFpY8YjjHQD+WLRkt/CHLoFl6vJF9fkRKup4u3c
         GScstrp0AgGxlNmbtb+e9heRAu0Uz2NG7PmwZ/3e6nDh6tOPqqllUeGdi/7flT7iHJuC
         SesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420100; x=1793024900;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aFenL6WtKoIB0uGYWQlfKEQvrS5xFRsP32DbZWJaJbU=;
        b=ksiz63BMTkL9rD2lsUFmbRwopSySkeDFCt8dbouEn8ez7qNsnugpEszch+hpg5uGGS
         TK1+VS0Aj6zzXv3s4lt1EIQr0HAYZJqK2BZCS7os/hMKNLseg6GKok1bnUeSAJjnn7hA
         bo6ptjJEpeTzZYSm1C+GX1iH9FlP9VOL7bkNhawwlTYuksWsWH/S/tIRYMDHYTptGpoR
         6ZtJ6qgM9Hn9gN6ZOB5QLoZkPQMA2/yq50LPC+4F/PJjMaaystoA8i010GtxUdDl2pRZ
         Gw/CReCBdBVsvvKKWS8j854ymcwAfSOVauh7Nl6CnIYJKRIHV4Xl2XBf9mpGprZVCBdy
         Aewg==
X-Forwarded-Encrypted: i=1; AKwUvBy7qOh/03Jp0gYjGlVgKiPsDInZWwpCuQMUJXJ0VjljlBoHmIK525BDi4aCqKvfZSAsi0vb46cAxVBp@vger.kernel.org
X-Gm-Message-State: AFq9FYLb4FEcKwG29PRG7o8ljykETS+58vwql9gRMxqMuEggNF0YsN71
	vJfp+YSIrgfcN0CL6LuSlTpKLoaYuBR+T5wGTC4Zz3rXoxHVPaVblpLHsDcwI/6iwUo=
X-Gm-Gg: AYBFou3ClvoESBVwRLzlAYxPo1iKjO+/AP/gKdRLP4d+LVLjsq2q4BgiR8RZOWIv2Ss
	OH4ZBJkt9XWrVDAmBj9mufPMRd/CV2qCRmypk8BeAYonifJe7NhJ//1lQPcVKs29Av69+CsM7l2
	qwLsbdOYLyfsHyUWIvjJQApNibqtZ+AKsIaB9AMVpVNYHUOHvdEf8OlTC72RLBau/Peh11s3hA1
	hxfRcH1FHnPWODt1gvyncG4CRQkaEpUT04A5JOKewnDGaq/a1QzPYXIu39XnWTJX2JCAlYeObmJ
	8LtuMIbV4go/YEf9U5L5p7vyFnJdejvbn22J2hhB/i7rrvy6CMpiufnwhThG5ZvGFySDXE+ukdD
	5w+HQosQAulwH6snlM/w5FQTrz/jqX25jFwd+TNeT1bBsRQAPBg6B+Ms2HD6soZdKhRm7TmzJJn
	fQShs5kD++2W6Hw0HMt9wgabfV3Pne+GmT0+dn9fbeuRVH5xG0CYw7px3e8vOp2COrFTqi/7YXf
	F1nzeZ5tDADfksHr82fxg3KGPED2Le7iKx04JFrwIAIKYXOxg==
X-Received: by 2002:a05:6000:1aca:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-48e07bb5837mr15910092f8f.18.1792420099554;
        Mon, 19 Oct 2026 07:28:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v5 00/16] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Mon, 19 Oct 2026 15:28:07 +0100
Message-Id: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPco1moC/23PTYoCMRAF4KtI1maoVKrS7azmHsMs8lOtWWhLI
 gGRvrtBUGTaVfGg3gfvpqqULFV9b26qSMs1z6ceeLtR8eBPe9E59awQ0MEIpI+Sstf14kt/Ru3
 Yc4gEHAZSvXTI9TKX68Nrpp/fZ5X/V5vRoHdGRiHxQjT9FF/PQUq5nvNXnI/qr4MNX4gBY1cId
 sS6AQbEhAz+M2LfkdWIZjsSdzxah4ETuM8IvSPrOdSRgaeYAhlnJ7tGlmW5A32u96pxAQAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has already been accepted into the
kernel.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated. Subsequently I was able to
add IMX585 (8MPix) and IMX832 (1080p).

The Sony datasheets are rather lacking on the limits for HMAX.
They list HMAX (and VMAX) values for nice round framerates at
a number of the supported link frequencies.
These limits have been adopted for IMX662 and IMX832, but for
IMX675 and IMX585 they have been determined empirically by
observing values of HMAX that start to introduce image issues.

Now cleaned up over the RFC V1.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v5:
Fix Sashiko issues that were present in V3 but it didn't report.
- v4l2_ctrl_new_int_menu failing for LINK_FREQ could avoid
  printing an error.
- Make setting common_regs_written conditional on all cci_write
  calls having succeeded.
- Please note that the checkpatch failure on the first patch is
  a false positive. starvis2_of_match does have the sentinel, but
  it's not shown in this patch as it's being renamed from
  imx678_of_match. I'll report the false positive.
- Link to v4: https://lore.kernel.org/r/20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com

Changes in v4:
- Added Krzysztof's tag
- Made the variant_def structs static (sparse)
- Put the sensor back into standby after identify in case PM is
  disabled (sashiko)
- New patch to enable pm_runtime_autosuspend.
- Not fixed a Sashiko report of potential use-after-free with
  v4l2_subdev_cleanup vs v4l2-ctrl_handler_free. It is a
  pre-existing issue in imx678, and many others are sharing the
  same pattern. There is no immediately obvious solution as the
  active state is sharing the control handler lock, so the
  suggested inversion of operations will use a destroyed mutex.
  https://sashiko.dev/#/message/sashiko-outbox-171674%40kernel.org
- Checkpatch error "missing sentinel in ID array" is a false
  positive, confused by the comment in the middle of the array.
  That comment was pre-existing in imx678.
- Link to v3: https://lore.kernel.org/r/20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com

Changes in v3:
- Sorted compatibles list (Krzysztof)
- Corrected exposure limits for imx585 via parameterization (Jai)
Issues identified by Sashiko-bot
- Fixed the Kconfig for VIDEO_IMX678 still depending on GPIOLIB
- Removed the remnant build rule for imx678.o
- Fixed sending the common registers if CONFIG_PM is disabled.
- Fixed potential NULL deref and lockdep in link freq handling.
- Fixed the duplicated active_area definition for imx585
- Link to v2: https://lore.kernel.org/r/20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com

Changes in v2:
- Switched from an RFC to a patch set.
- Add the dtbinding changes.
- Added IMX832 and IMX585. Tested and fully working on all 5 modules.
- Updated 2 lane handling so that the higher link frequencies achieve
  the maximum frame rates.
- Adds a patch that corrects the minimum exposure time.
- Allow userspace selection of all link frequencies specified via DT
  (makes testing all the link frequency options far easier).
- Link to v1: https://lore.kernel.org/r/20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com

---
Dave Stevenson (16):
      media: imx678: Rework into generic Starvis 2 sensor driver.
      media: sony-starvis2: Reorder link frequencies to remove lookup
      media: sony-starvis2: Always program the sensor in window mode
      media: sony-starvis2: Parameterise the configuration to allow for other models
      media: sony-starvis2: Rework 2 lane support for higher link freqs
      media: sony-starvis2: Allow runtime control of link frequency
      media: sony-starvis2: Correct the exposure range
      media: sony-starvis2: Put module into standby after identify
      media: sony-starvis2: Use pm_runtime_autosuspend
      media: dt-bindings: sony,imx678: Add other Starvis 2 family members
      media: sony-starvis2: Add support for IMX662
      media: sony-starvis2: Add support for IMX675
      media: sony-starvis2: Add support for IMX832
      media: sony-starvis2: Only update bits for window mode
      media: sony-starvis2: Parameterise exposure min and step
      media: sony-starvis2: Add support for IMX585

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   38 +-
 MAINTAINERS                                        |   14 +-
 drivers/media/i2c/Kconfig                          |   19 +-
 drivers/media/i2c/Makefile                         |    2 +-
 drivers/media/i2c/imx678.c                         | 1447 ------------
 drivers/media/i2c/sony-starvis2.c                  | 2362 ++++++++++++++++++++
 6 files changed, 2416 insertions(+), 1466 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

