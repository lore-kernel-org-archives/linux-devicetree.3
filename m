Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECE7371065
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706300; cv=none; b=ZFYU+T7bPcrYVIUy0pHyY8VNCNyUErC7iDeuj7pV7x3xZsNzKwXxtrw5mbYugD4k568/y56whGriP5/hyWveKuaFY55LitVCsJuEI1t7XcvLWZrOoNLERX5b60u2ORbkXIh/+SG5xn12FVfbY1pD59GrdKVAM5p2/CdtBEZUt2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706300; c=relaxed/simple;
	bh=f5DHgfTDON8Z7Hqcg/RAB6ffOcn9hbOp5DGUcqANlZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTuPdY6ezIfwki0NxcJs4deXZAC2YCK15wdSJPUVYa2t+QFXhrGPieYkSaWcK08hOTPRrKFgajrUNSnIrIpMNK/562xskrOdCGjvJb8HHbFWYuV8A2JT79YkzAFaDMeEK0Lkz2WUnG+iX0oj3ogJFnxsC0l9e2x/cXDK7iMGJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVCtwXkx; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVCtwXkx"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so5193345a91.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706297; x=1780311097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dHO2VvSt37xok9aGTo5VhiAMv2Gtm77tddVwXTG5HfY=;
        b=iVCtwXkxKp2KF2yrkPBESX7gbm5KMJ8wDk7sDQsVqJipj8USWqaXXF+buN0XmPZDbk
         3WpXg8MeL5Wea5Nj8wiGVZE4Zao2+ydcjhm09YL5RR6mni025OTOWhvuWFxvkXjca3Lp
         r8VxxpFo7Rsyq9MM7k2AG4+Y8bVb/gpXFKOxVlCPW4JSqpvWjezHOkK3zGU5XxM/+j/F
         v1kQw5hVWmLizkit7Gk6ojJt2sxDsbM2V/aqcDrkPn0vlXqU8EhBlW8QHzEIILWLqmRW
         +ilbXv60Wy2WMVNTGc4tIAdjjZaiMlcjJ6SP5BJqrpHRJvaDA6RuIHIgsx1oZZj7E9gA
         GH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706297; x=1780311097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHO2VvSt37xok9aGTo5VhiAMv2Gtm77tddVwXTG5HfY=;
        b=hdprMlBVcCscJN93vEiSZiHhBPTLA6QNi1JVDbT1QODNSYsgQH3Mx+1z7mycs3BQCV
         8RUjF7iQ37soH1ZvXaM5NE/4s6CCLRcJGncLwBvCjMKWtymsLNg06Uv2KMH5hfapIXIk
         G5qjmpswSJ8YW84ywaXcdOPo5q/HgeLJJLbYBsBECBjTgh/at07uuIHnW9z0wEJ7XOBr
         VjaFRB9zL3QHir0cZrsNd/EBsQZdSju53ugHlSuCuv7Jk6IMaotU3OXhteuNFhuQCsiT
         D0LYVGo0EdIQRmf/tOibpxJj4kAksdcB/aJQfhIEum1+gb3VU2W/grk5yR1K5+EeenIR
         tsDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0F8GsqX2WuglMJa3ZFrQrhwY5QjvvDx5yRaxjQkWjGwiJ8j9sLJ4aBuKIKMsPYL28DcmWBi+m8n0T@vger.kernel.org
X-Gm-Message-State: AOJu0YxB27VvRsEqGLIJbnzwhSCpuNMQ5vQdhGA00T65FAV7Wh6fkilG
	AHzod6fesrwDuN7BJu69gBnOoylRTSG9NZ0t0RwPCu3hBPByxbWPAkQUxvdFTihn
X-Gm-Gg: Acq92OE+TZpHi4nj5UuzKvsi5pkiEJYm6C3XdfB5PP02ewBWr4d8s2ibSaX/iBFMueX
	DIwx8/YrqfDEs+PWLma/G6b0MP11rPpDTCgEr5pOQgYayKDAlW5W1sMfbT7oxfmYmx/ZWENOHql
	tkgIzsdMobj4n1v2Bn9C6kywYHJmmBUkTjotY2HohJ/wh3Y4TBgLQSD5u+ZdgzMZ0fKXQFZ3Xjk
	avpJmSsbvEPIUp+Qrc8kKEtgNpDbavgEh+3rPO1AnfLmqaT8pHovQULwPLEvxuZEtt2Tg4BBZUk
	js4WIhwkooPrm2YYHvM/nXAngxOXcG/ztyvSy4rv24VsatmXDhwJinQRGeMm/WdwYB3Z4PWzFpp
	fs/JQ5xPy3/Rtn73S0vBGfOFROd8Jmc9PR0hbUt/1QxukRFaQHd/bQJKEQjvdhCG48ReJVYbj0G
	KhiI0z3WIheX+p17TguDtehD66qnsFytrzwMgtoTYxghop4nZUVk073kNjwnRTYZJobd3ewhVRz
	bJmR2awzJ7r/4QvYfu+HowT9ZUKKyQkfj5hZ3QRWw==
X-Received: by 2002:a17:90a:d2c3:b0:36a:6ac2:8bc8 with SMTP id 98e67ed59e1d1-36a6ac28c1emr7212752a91.14.1779706296688;
        Mon, 25 May 2026 03:51:36 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:51:35 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v10 00/11] iio: adc: Add support for AVIA HX710B ADC
Date: Mon, 25 May 2026 16:21:16 +0530
Message-ID: <20260525105127.180156-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HX710B is a 24-bit ADC from AVIA Semiconductor, related to the
HX711 already supported in this driver.  Unlike the HX711 (which has
selectable gain and two input channels), the HX710B has a fixed gain
of 128 and two operating modes selected by the trailing PD_SCK pulse
count after each conversion:

  25 pulses (1 trailing): differential input at 10 SPS
  26 pulses (2 trailing): DVDD-AVDD supply monitor at 40 SPS
  27 pulses (3 trailing): differential input at 40 SPS

This series first extends the existing HX711 binding and driver with
preparatory refactoring, then adds HX710B support on top.

The differential input is exposed as a single IIO channel with
IIO_CHAN_INFO_SAMP_FREQ, allowing userspace to select 10 or 40 SPS
without needing two separate channels for the same physical input.
The supply monitor is a second channel at fixed 40 SPS.

Patches 01/11, 02/11, 03/11, and 05/11 have already been applied to
the iio.git testing branch.  They are re-included here so the series
applies cleanly as a unit.

Changes from v9:
  - 02/11: Added dvdd-supply alongside vsup-supply. Per the v8
    discussion, DVDD is a board-supplied digital rail on the HX711
    (figure 1 of the datasheet shows it as a separate input supply,
    not merely a bypass capacitor point). It was missing from the
    original binding. Moved its declaration from 04/11 to this earlier
    shared-supply patch.
  - 04/11: Removed dvdd-supply declaration (now in 02/11). Updated
    commit message to reflect the patch now adds only vref-supply and
    the allOf constraint.
  - 06/11: No code change. Removed inaccurate below-the-line note
    about __counted_by_ptr() commit reference.
  - 08/11: Remove blank line between val = hx711_wait_for_ready() and
    if (val) check in hx711_reset().
  - 11/11: Revert IIO_DECLARE_BUFFER_WITH_TS() to explicit named
    struct (both variants have exactly 2 channels). Add
    iio_device_claim_direct_mode() in hx710b_write_raw() to prevent
    concurrent hardware changes during triggered buffer capture; drop
    channel_set = 0 reset (hx711_set_hx710b_channel() re-programs the
    chip automatically on the next read). MODULE_DESCRIPTION: change
    'compatible' to 'similar'.

Piyush Patle (11):
  dt-bindings: iio: adc: hx711: clean up existing binding text
  dt-bindings: iio: adc: hx711: add VSUP supply property
  dt-bindings: iio: adc: hx711: add RATE GPIO property
  dt-bindings: iio: adc: hx711: add HX710B support
  iio: adc: hx711: move scale computation to per-device storage
  iio: adc: hx711: introduce hx711_chip_info structure
  iio: adc: hx711: pass trailing pulse count into hx711_read
  iio: adc: hx711: split variable assignments in hx711_read and
    hx711_reset
  iio: adc: hx711: localize loop iterators in hx711_read
  iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
  iio: adc: hx711: add support for HX710B

 .../bindings/iio/adc/avia-hx711.yaml          |  79 +++-
 drivers/iio/adc/Kconfig                       |   8 +-
 drivers/iio/adc/hx711.c                       | 351 +++++++++++++++---
 3 files changed, 363 insertions(+), 75 deletions(-)

-- 
2.43.0

