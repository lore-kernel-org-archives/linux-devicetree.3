Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA1A3054EF
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507931; cv=none; b=BAf6+tuF9K9HxjvML8pBA13ij3x+TZYvkGKAMsy9TooMMu7BwbL7Gp0TYBD+O4SMiCyEPEF1rE9rr+7klrYKVhrJyHsrTIkgXAYSleAhX/HD8Z2YUegO5wQs9u6wVIUeN+fKnVhR4czgllvOHfr+H0P3X6hIHd2ILkbGnkNSwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507931; c=relaxed/simple;
	bh=Tp6cmU/RGc1ogH1+TBTz7hZfRd5EAUlMRrlBwPLgtGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAOwD9JXddTTUfoCLL0oa/sb/4rXlZz7OvAg04tHt7TBjvtTPaPXpss2TiYEc/dMClRKafBYt+7mOb1ntgiXdWtT7OB6Egcs7du1THHa2iIciypHpUVa7ujd1NbGIgymwIOTneURpqrkQ000ZvrJNUQyhYWCTUaTbG1WOcXEXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM+29sei; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM+29sei"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso21989865e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507928; x=1782112728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kB/u4VLuYTRIxSTjaGgA4kG1SxYpk8i9RP3w3UDvgAY=;
        b=NM+29seiNbwymV1yYBHyPFSlzKBvEyxBolZKRo60z2aBQ6gvEzFT9YiQA2W1IDiLqo
         DwQnhGqe6NJMVGX5nGpF8967fOniDTP9BVIaTbzRQdq1i5MKFbXgJa7rL3EzfWuWJCYH
         RWbtpWB5I1YVIJGUgenFXVePiUF0l5iXvGslw0Oh67YrHquVIDu84SE81hXaUTb+6p8V
         WV7F1hfbSIevMabejyUQ9ot2EnuTWfKThPtOTMHJ6DWukGP6XV6esxzbpo/elb/HrDk+
         ztWl5LeMWaphmjKQ+gUGT5Y53LXMTxB8pOhlViESdUKlca+8JT7hHXCJYwHDOJbjuNNJ
         QKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507928; x=1782112728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB/u4VLuYTRIxSTjaGgA4kG1SxYpk8i9RP3w3UDvgAY=;
        b=XzUv6KGHfLYwfP7vEPh8WPwQ3CuTUUngpS9hbX+IN5AF7DzG7jb8nBTo7bO5BLZczV
         5NWN+jm2vPw43ylmxun0AlVbrJ8pTpD2EujEuF5syFmVll74+cfchDGe8zB5mf4YQgXB
         fcgj/oGBcpamcgzFemzIUu7WTh654D/fWkJ8bxw5bOiyeiDHOQZ1XoVUsjW40RSjV8jm
         4cKiBZmfox/LeyGEG7KfLYnwlccjcwiqnF9VymDAroamuk4wsKMXISJUjVBj2aohbcCS
         wkEyXeSwVNWiPOL+gcH+MGUEOJkrzbFOtzWPjVyXXd3XOKEa0KjBTCaCu4KoF01t7wmP
         dfRA==
X-Forwarded-Encrypted: i=1; AFNElJ9Q5xq8t8QHYg92sDfDoeosJ6wpHG73UIgtgHhE8wJAASH7K7KirBkvrIbBrekgBAFiYjV5qxchOdw5@vger.kernel.org
X-Gm-Message-State: AOJu0YzK8hn/rDgdHEvYe8XZHxJzNpL7b5O0OrRQ4lImch8Y1lfREgeT
	U+GQEXPTzLcTVtKBaHSEcH0sXvVmnQIDQ3L4AAjW6NIijnovYo6BzRRD
X-Gm-Gg: Acq92OHtvTqDwpufVRcG2AESN4+VUxH589ylA6KqHiU6ZT/QbTdZdP1us0D+qmZAANP
	7uQFH0tz5OgEykqXW2K6c5fWocgdzjF/lR2wG51YLymtVA8H96AqkTPvqDrjmkjhzerL4QVZ4Kk
	ZJY1qdtPxA3bY95HGiqdEzKBdvhxSBv2m6HjaIbnKLn3fd0XrVqDJbnpDpXXg6T+5ckeU5OyKHM
	MhOh8RIqJhvWP9GxjovlWp5LQg96+6VE93gHryz4X6rnIQb2+i1MZPgNbiR+PmP1npnmjEC56DA
	2jtPGaduSdp7MiLWJR74tGsxLCV4dHCXIenx7nqSTuKP5Wq5JPpjA74OhFvOFa5wbeJO0V1DMRd
	JF+DDPpEAivW3v5u+/B797tjXvOWDan1XnuNdD5/v/UoQG1BUBC0pzuSB1ks2lM0O42U28urPcI
	axAahfgfZVBN1v/iL6
X-Received: by 2002:a05:600c:820c:b0:490:e913:6564 with SMTP id 5b1f17b1804b1-490ec4cc6d8mr166377465e9.3.1781507927328;
        Mon, 15 Jun 2026 00:18:47 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:18:46 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 0/9] Add support for MT6392 PMIC
Date: Mon, 15 Jun 2026 09:16:06 +0200
Message-ID: <20260615071836.362883-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT6392 PMIC is usually found on devices powered by
the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

These patches enable four functions: keys, regulator, pinctrl and RTC.
Mono speaker amp will follow later as I need to work further on the
audio codec.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. I'm not sure if
I'm supposed to squash them even if they belong to different driver
areas of if it's fine like this. Any advice is welcome.

The series has been tested on Xiaomi Mi Smart Clock X04G and on the
Lenovo Smart Clock 2 CD-24502F.

Changes in v7:
- Removed patch 0008 dependency on patch 0003.
- Reintroduced the regulator driver. In earlier revisions of this series,
  it was proposed to remove the dedicated compatible for the regulator
  device [3]. The driver does not use actually it, but it is not possible
  at this time to remove it from the bindings since it's a required
  property.

  Making the regulator-required property conditional was NACKed in [5],
  with the suggestion to create a separate binding altogether for devices
  that do not require the compatible property. I tried implementing this,
  but since the parent device needs to be declared as compatible with
  mt6323, it leads to a warning in dt_binding_check since mt6323 would
  be declared as a compatible in both mt6392 and mt6397.

  In the end the only regulator driver from the mt6397 documentation that
  still declares an of_match is mt6397-regulator and it does not seem
  to be necessary, so it should be possible to remove it and make the
  regulator compatible optional for all regulators, but that change would
  probably deserve its own separate patch series.

Changes in v6 [6]:
- Dropped the regulators driver for the moment
- Explained the FCHR key name origin in the commit message
- Introduced the MFD_CELL_* macro in the sub-devices definitions.
  A separate, independent commit introduced MFD_CELL_* to all the
  subdevices in the mt6397-core.c file for consistency
- Replaced of_device_get_match_data with device_get_match_data
- Removed the mfd_match_data enum in favor of the preexisting
  chip_id enum
- Adjusted the error message if the device is unsupported

Changes in v5 [5]:
- Double checked regulator driver with data sheet and Android sources.
  The data sheet I have misses a lot of register descriptions, but
  Android sources have been helpful to fill the gaps
- Reintroduced the required attribute for the regulator compatible
  in the bindings
- Fixed the missing reference to the MT6392 schema
- Fixed casts/unused vars reported by kernel test robot
- Removed Reviewed-by tags from the regulator patches as they have been
  modified in this version

Changes in v4 [4]:
- Dropped usage of the regulator compatible
- Fixed commit messages text to properly reference the target subsystem
- Added supply rails to the regulator
- Reworked the regulator schema and PMIC dtsi. Now all supplies are
  documented and the schema no longer includes voltage information
- Removed redundant ldo- / buck- prefixes
- Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
- Modified the MFD driver to use a simple identifier in the of_match
  data properties

Changes in v3 [3]:
- Added pinctrl device
- Changed mt6397-rtc fallback to mt6323-rtc
- Added schema for regulators
- Fixed checkpatch issues

Changes in v2 [2]:
- Replaced explicit compatibles with fallbacks

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/cover.1771865014.git.l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
[4] https://lore.kernel.org/linux-mediatek/20260330083429.359819-1-l.scorcia@gmail.com/
[5] https://lore.kernel.org/linux-mediatek/20260420213529.1645560-1-l.scorcia@gmail.com/
[6] https://lore.kernel.org/linux-mediatek/20260612200717.361018-1-l.scorcia@gmail.com/

Fabien Parent (3):
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (4):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  mfd: mt6397: Use MFD_CELL_* to describe sub-devices
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   9 +
 .../regulator/mediatek,mt6392-regulator.yaml  | 234 ++++++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  75 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 295 ++++---
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 756 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  43 +
 include/linux/mfd/mt6392/registers.h          | 488 +++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 17 files changed, 1942 insertions(+), 162 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0

