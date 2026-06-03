Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4743F6616
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512550; cv=none; b=oBTwmyIaTt6lyBS+6tVY/YQtKTFvYab7imzKXgxmiAYEjiTW4D6y1JGSKctz2hinKFRqppAYgcn+99pOId2Ci309JCMAMMxh4h5Rl1vKpYOdk+x7yCMneMeI3WIbV7LMPZsqLzpHUrVTF9ZJqOJ3fHyijJWfaa+TdSE1UiOoPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512550; c=relaxed/simple;
	bh=R7ry8+1p2KFj22v87Id+msOrdyHFLWM2BhV+4BVrqhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KmLk1wRGdCDy8pC39jOkkZEDceODnTz1klrVe4U3bXL5nCul3fE9Tc7zJ/aQIFROeoVOW9D+PTRyfvQhPW2SQGgC8AU8sDVVrZ2Rt7sLg7ajXnTx9HYhTZ4URmf5uua6NiDJ5s3/W/L0ER3KrXSgFgz3RtJtX/On7/nUaf+Ykaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZuIBI2o; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZuIBI2o"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so28308355ad.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512548; x=1781117348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkcVdKytMoPBJ4y+eUSKashKKr7v/AknLWHa6cp3BZM=;
        b=GZuIBI2oRYlQeBDtvZvBKG0Nh8IjUATgPTblfr2xdyNq9hYNes0z1eQ6SyowfnRMVo
         zthPGoJCz4em01T7QOpyXxyw8+XBdAqJzPJW9ZSAXxxke1jlsl7iBkb+SVFgkMus6xrw
         QyGcIlLKGYydPuBTTTRRENXXz0MZS764FATZKZ3/04G7X/ndkw44gJ3UBaOtU2ourlLc
         7Y3MEyXWQZYXD9tn6YzAGy0Av7nBvk+PGLmxf0W62MNnOnvTImulypRyidviE1H5ae8y
         SIMScKC2gJ/Cnxg21uuB5w/9x4o/OtD8xcgcg9s5hs6nrPWsqSEDqWAUpgUBBKnjeCdc
         LndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512548; x=1781117348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkcVdKytMoPBJ4y+eUSKashKKr7v/AknLWHa6cp3BZM=;
        b=S8H3VFO/e4RvfPM86XVukUYN3i2cjMdmKJOBFRhRkvwtLTgujhwlmAyT5utrcW/fLS
         UCrdVFQaCxufwhb5MvKru9Uj39GZDgSDNwWkLytU87QuOZiZW3gOAkdFDOaKhxL06/f7
         Ch/JtaTuINlQCXij5qH4GNWkqKrvPRNM9oaDzzQFbzOSqW2d+150zkTVPAFp7MxOi8F3
         4SwlThs7mkxWt032HxF82mZ7brBc98GyKPJN86U8abMvDv8u2oERGdScbiNn5Af2nYer
         HlieyS6HiyP+z3Uc6gsb2a03YLsufmhjA+/yGTUF7uORsQYrjQN/28ZMWXC7EEMmjZ8Y
         st2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+0G4DDopmJrriIDO2N98jOmsM38RGeBvrt5/0E+DnhRO1X7NIq0mGqDvc3+Ll5Oj8t3vteGCyv+4bN@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRXWUnG4d36HlD21dUnWDhQSmiJCPRHxy6dZLnJn7YLagwT2G
	8ytw69gHj6rV9jyGrYU5TICRg0A/O3bv4HJXxb04m4clYxXxe7CGOelC
X-Gm-Gg: Acq92OGpZm/rZgIoICoRY67mr5t0ZuWIUO98w5IuFoQd+kZQDr//cYeIRJKqHoL5P67
	HosFQkQ2zivV8sKH1sGRnizLyHE2155fHPoTMrGqeUhGGjhGLneHQ8/Irx4aoy8cq+T6l1jx5AC
	L83mmobxqcIo34GjVqPccmjHqdNQAuWeb3x1EQTjSUcfTDS3jaBaGRSERKUsutvYUyb/bqOL9x7
	9V//5AfIYzOeR0C+nhP8P2d+CCSfNxrbjQf40YUkK3CwDwmcAfOopaS2MjwkTeNPlj/WH/2ymR6
	ACjs/bRLRSfVNKr9EOZve+AJZ+zdQCEsoUROjUSLjcQHQrZAqBjQSM8IwI+xFMx3p76bbUjZG9E
	Ly6nKdWZ6jyPKuOEbdeAc78DMcgM8z8H32fxNmknGVK2cMbiiCsVzifdLdu13ERZiSPxuoxJXFO
	fIoqAc2kSgqpwhx8PVU69U3P0MwSnT1et1zaTerZcmLi1B7wgt3YtJ9l2XMyRk7qMiqBzeJJVX2
	AidjW4EQvcj6+B+975klfyz8cNDkuvChtC9gx4sUz0jV7+X6SWe6A==
X-Received: by 2002:a17:902:f78a:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c163a1e038mr50337385ad.13.1780512548362;
        Wed, 03 Jun 2026 11:49:08 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2409:40c1:4015:6e6f:ee79:7998:9a6f:65e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d59csm32139675ad.4.2026.06.03.11.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:49:07 -0700 (PDT)
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
Subject: [PATCH v11 00/11] iio: adc: Add support for AVIA HX710B ADC
Date: Thu,  4 Jun 2026 00:18:48 +0530
Message-ID: <20260603184859.89693-1-piyushpatle228@gmail.com>
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

This revision is rebased onto current mainline.  Note that
iio_device_claim_direct_mode() / iio_device_release_direct_mode() were
removed from the IIO core since v10, so 11/11 now uses the replacement
iio_device_claim_direct() / iio_device_release_direct() API.

Tested on a PocketBeagle2 (TI AM625): the avia,hx710b node probes and
the driver registers its two IIO channels.

Changes from v10:
  - 02/11: Retitled to "add VSUP and DVDD supply properties"; the
    commit message now documents both supplies (the patch already
    added both; only the title/text were out of sync). [Jonathan]
  - 04/11: Reworded commit message so DVDD is no longer described as
    HX710B-specific (it is added for both parts in 02/11). The
    compatible match now uses "contains: const: avia,hx710b" so the
    constraints still apply if the compatible is later used as a
    fallback. dvdd-supply is now required for HX710B (in the HX710B
    branch only, so existing HX711 device trees are unaffected) and
    added to the HX710B example. [Jonathan, Conor, Sashiko]
  - 11/11: Kconfig title and file header use "similar" instead of
    "compatible". Simplified the tail of hx711_set_hx710b_channel()
    to "return hx711_wait_for_ready()". Dropped an unrelated
    reindentation of the iio_push_to_buffers_with_timestamp() call.
    Converted hx710b_write_raw() to the new
    iio_device_claim_direct() API (see above). [Jonathan]

The Reviewed-by (Andy Shevchenko) and Acked-by (Conor Dooley) tags on
02/11 and 04/11 are carried over although those patches changed; please
re-confirm if you disagree with the reworked constraints.

Patches 01/11, 03/11, and 05/11 are unchanged from v10.

Piyush Patle (11):
  dt-bindings: iio: adc: hx711: clean up existing binding text
  dt-bindings: iio: adc: hx711: add VSUP and DVDD supply properties
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

 .../bindings/iio/adc/avia-hx711.yaml          |  82 ++++-
 drivers/iio/adc/Kconfig                       |   8 +-
 drivers/iio/adc/hx711.c                       | 343 +++++++++++++++---
 3 files changed, 359 insertions(+), 74 deletions(-)

-- 
2.43.0

