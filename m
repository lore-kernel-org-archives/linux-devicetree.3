Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57E53A75A6
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438250; cv=none; b=egsrRoHLlWm/9WsPVkHskzNNUZQIQMDMWGHWewBY34N/UG8xcv9MVsnM6ZMIs8eBtYxSC2UW5jcX3vf3a7gCXna8jcbuIbLF4wdHN2bX7qXUa4BNPGzWHV/o747u8gG6E6OtexLelLwM54wU/dIlHlOPVL/SGCnz0li9H84o5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438250; c=relaxed/simple;
	bh=3q7Of61NRAonCCG64eOeQNKQfyhqKqxdG9RLjiPKTXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/Ul0Vd0TGFCdffjAr6lA2Oz0Wz8IvCf/lSSFJ7rDa53kEnizIxlAjKoAfaMK7HS0BfY1vFHXmW9cXX6+M0HInOHYwP7Lq/ncCuc1hB+xpKw4y9znWxSG1PcHNYy8CZQY7cdmmzmcSN9mzIAhhwGIrdyYcvCkB984wBOEszJxCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BHVo/xNt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BHVo/xNt"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d73422431so4945152f8f.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 01:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438247; x=1780043047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rOd1e3lZNhkcxa+BicVSQFmQVFgFvl+9kN36m8Y/6A=;
        b=BHVo/xNtTcMsYkytIFZqvOvCOqc6FOeuF9usdLM3/SS7TaSD6r66rVTV4isN4/C8/R
         A7jpg/24nHR7xqlYRJF0DwyUV17mc8TRwg/vRabI7UF8tes/MK0iwoiFSHzGFvCOgmcb
         9dSf3P9UhdZdYj+aLWgvdcLve5354JEs6v2OTbwc/IGBopjNxQ3txF+LYHrcS5E7nxM9
         c59EAnD7OCpSwgFlv/ILv+E+Eusyxk4dtGVYO6G5uox4Tl/z6o+yMw+hZHCEaW1e4Xoe
         HD9do4ASAHCfeU2dErqMOcbyBV8PMWn1nH4zTydJ9NuQ0vH1SpIlFtE27GuBL/42x3Wi
         JynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438247; x=1780043047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rOd1e3lZNhkcxa+BicVSQFmQVFgFvl+9kN36m8Y/6A=;
        b=R+BPavpER3B/uH7bVaV7idkdcPnJ69ze4J4GHXNfEmtQ/u8UsLiqwbTeQ6hXTWsQuK
         qSy0oCcwplaHczqolHQYG3mDbb8kdKqM5JeghkYpXF5amKSGN5WCTcaLbYCoa5NOZCt0
         SU6vxM9t0M/8zBWH7Z5Sj6BNZDd/mYX8JGcCXFz2SyQfwAhcrbIbBmJHW0hx0cnDFV6a
         Xoz4a0w8Kt1/yR0cA3MPl6ze7VbAfMyLHZ+JxmEX6FNwIrX9y/crLy8n/Q5YpMKglAi2
         j8vkZAcDuXuSk+afW3ABF6t17HVaxdp3u/RbVPSeLoglrCLnruiR5w17lTQi8MeGFl57
         EZzg==
X-Forwarded-Encrypted: i=1; AFNElJ+WcqvfDc0I6rTxDJq6R35ml5Wl/Y7geRedSlxgStip3BYvdw0Ys/s07lBsQxJOsIbHzLyzM9cSf1Tr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PAc2o3jyrszl2faJOhsgUD8afv65QrV4KU4cgR+uajETCCEz
	cDquQQuY2QRWHzezg346Y2daolbcDkyt7393bim2qDA3x0DZJsrAL1CyECtzMk769bI=
X-Gm-Gg: Acq92OHAkCKVHFwJ+usGvXcGycBLQYVLvXVFwadINCrcY0ZWZGN0/rOjah+813CHU/P
	+SgYAA8ukX0V0Cy/vOjoP9ifIOf1j4m8XYWuv0mUte501cBonJCJ4wiDNucrej6RhLqbeaJZ0yz
	1x+Gj7l8zCgTcuDW9v+VNvesSE2ogsmz8zIDkdaho8OgNyxqUIlW2PZ/HAtREMBVQAmYse5ejkB
	OODcJnBPDAa5aOyynLkxyqTPp6ZufzmdbVLWP4SLmvJQHciHZTS549S2/u0Ijjl+dfYmum6fbHl
	aqyhRhx4olb7Qzh8FGgSvH5t2xLo7XpbVenfAZtkvRNpVNqqnzueMPnzUfhxA2Nw27imi6yTD28
	Mae/84wR2RTC+gFwansORzwfg+nDf1XBd704kLYu4HN6dIGvdnwdwIp3mCdaS+575z7jcF5sSHU
	9lGro99a1+RyIPGabrL732Q+vEHYteG0evHy4W7nSM7SU9MJkE17dB7XVMukKF86HRFt5pjkeqc
	cc5bPDcKJweWpvciiIp/A==
X-Received: by 2002:a05:6000:2888:b0:43d:7d6f:f529 with SMTP id ffacd0b85a97d-45eb38b796amr3607454f8f.31.1779438247244;
        Fri, 22 May 2026 01:24:07 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:06 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v4 0/4] Rework TPS25990 direct conversions and add TPS1689 support
Date: Fri, 22 May 2026 11:23:35 +0300
Message-ID: <20260522082349.2749970-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks the TPS25990 PMBus driver direct conversion
handling to provide a unified and maintainable approach for devices
using non-standard direct format conversions.

The existing TPS25990-specific conversion defines are replaced with a
generic parameter enumeration and conversion descriptor using the PMBus
direct format coefficients (m, b, R). A new local structure combines
pmbus_driver_info with direct conversion data, simplifying support
for related devices sharing the same conversion model.

To avoid duplicated conversion logic in drivers, this series also adds
and exports generic helper functions from the PMBus core:
pmbus_reg2data_direct_calc() and
pmbus_data2reg_direct_calc().

With the conversion handling generalized, support for TPS1689 is added
to the TPS25990 driver. Both devices share most internal functionality,
differing mainly in supported voltage and current operating ranges.

Link to V3 at [1]

v4:
- Fix non-devicetree support as reported by Guenter Roeck
- Rework direct conversion handling to use exported PMBus core helpers
  instead of driver-local implementations
- Update dt-bindings commit message and ti,tps25990.yaml
- Clarify commit messages to better reflect the final implementation
- Add and export direct conversion helpers from pmbus_core
- Eliminate duplicated conversion code in the driver

V3:
- Fix error detected from kernel test bot regarding division

Tests:
- Test builds for x86_64, arm64, i386
- Retest driver on arm64
- Validate driver direct conversion functions manualy


V2:
- Fix error detected from kernel test bot
- Add Acked-by to dt-bindings commit
- Drop "support" from dt-bindings commit subject

[1] https://lore.kernel.org/all/20260217081203.1792025-1-sbogdanov@baylibre.com/

Stoyan Bogdanov (4):
  hwmon: (pmbus) Add and export direct conversion calculation helpers
  hwmon: (pmbus/tps25990): Rework TPS25990 direct conversion handling
  dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
  hwmon: (pmbus/tps25990): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   8 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/pmbus.h                   |   2 +
 drivers/hwmon/pmbus/pmbus_core.c              |  59 ++--
 drivers/hwmon/pmbus/tps25990.c                | 261 +++++++++++++-----
 5 files changed, 243 insertions(+), 102 deletions(-)

-- 
2.43.0

