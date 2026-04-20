Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F652348440
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776720971; cv=none; b=GJ5PTlurNbB/l92eknqk8I/pbeyYG8cxSAEhv80z+8jeDgf9FTSxFSupl8a8YJIjtp9P+zqzp4l8K/ko5vCIj5EJgPDGjn4Zlx4phR0MLPB8Jme1Mi5BeHjqiiM9Aq5w65n6Em40KVBUlkrWGfD0xa8S3ZQN6iinD5dDgXzJ7Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776720971; c=relaxed/simple;
	bh=UgW3k1vXeuAXYJVVUE3uw4fYebqcjx6HXfLWRx4YEts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6jwFYA5EheB7li7H3elACf5iT36C7u1hDyd/5wS8Jh1dgr9fy3SZ1sqtq9JS8XXAYOApj/sirgmL4l01COkfX1AVpcsfFg+yZwRK1c2KOpUENhlpZbyRuAdJ11wK49iaXuPzqIrBbZBkm2jXtr6lx9bmfhH+HONsG0gqUBJPUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET5GGz6P; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET5GGz6P"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso27243905e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776720967; x=1777325767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=;
        b=ET5GGz6P3Sud7C9voRyK0mRbRtxGpYw+gBrgsLLVB+Cy6JlkzDDMT8BK3XvP+yYEek
         P4OvBv9lVEj0oVUt8YiG7X/XXmyZO3etqGaGAwvYuE7bmD4TMtWrJ49hJSnYDLU2S+3n
         TiaRPMAbeL75wRAlIgU4iDTq18x2ns/JCqV+YpWu7nVRuG7++m31eQgtQHqQsfOAQzpL
         m5Bucd48Wruf6zFk0IA/F5PhHG5jGiz2ickyidvabpUOHG2CHfIMr5FVH2NTYatXtIsG
         MLCL7xM5x+21r3QsGGJyEQgNz6YKqwOevNUdyAUJlRhICL+/iFjqqPbNSs3gBmeWewzV
         Raug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720967; x=1777325767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKbbLjMj5a+s95ZY4aMoYwg6sSM5rUeqb55KfE7XVeI=;
        b=X1sotFsq7Asyw9Nb2YdtnkCQV9AZUVS23D44dZ6nfIZPgHYh++RS8GLD8sU7OiKN55
         UbGaR922+ZHqZq56PizYmRGepgc1mkoLAOpS7CmrQ0NAdrl/hQDheiVG+Pz61WOeXUwv
         SzaRZR0Zeh69AaFM9ed7TOkF57A93nUL8rGl+HpOAydSH+VAqWZxS2oGgzC9eLRrwGYt
         mi4w8/2iDCfNAB1nrDqbvsP9XzGmjOtH/nc3JF+i/3NUFhMSO1MufyXVOvYt2ep8xY/O
         G+Hu2A3aJIGLZfZFnIOv0sin3LS/93KOrwFs9jYcuP9WvfFNLr9v37n0F10XgeZd9fhu
         e7LA==
X-Forwarded-Encrypted: i=1; AFNElJ/GiE2BPawWHexn4ksRypNeftSu8+UjkBtCSadMofqdILMNC7TbDbTM3Pq8J5jq89egV3L0gFkN18GQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1mHRHqYLfjetfSwBXZTiPovH1dmo3ImBUYgnu9rq3lOtYtnKa
	Uj09GvJcMZHtnOBMlcPrfMLtJdMH4QqHwP21Jcl6tiffriwbTyOKDFWw
X-Gm-Gg: AeBDieuCsGOjxIn0uxPQ2JgIICPm2By/OptLy4JxVEdjRhZr2rX3zIde1GHkpnBiiG/
	HMi71Q4M9vvtKVOBlyhjen13vlUVmPQeyYX4OjCbRWmtIp6s4BOSx51ILlBLB42sqm4LCOkg9O/
	x2Lmkz+UlnCfI9Isi6uZIIJkeSvTD83WQcfWoNaK+yd7NYUibCxUOHtYbdYYPQPE9qPEsAwaaaa
	B+1xzqF/1Ip82RrVNENibJdSfi0BV/Bz6z1bASTrob+WzL5BXjWYxT3GDTEaAtWOlDuN8D5ZDY0
	fG5LFtP4i8zI2UGcWCvaS6rONz20KAc6AZi6mznamBCoq+b+p8LSKk0Llv5btpYLs/Les7ce1jm
	c2Ck+gRV/1DZ4Q/9NIrIvIO3poJbs85pAq9inXCwcXA3e/IY5OmBR1r2p7AY0HDNGXFUHMYUiaq
	cE2mpUHSqddQvgN55YM9os522hc5qd5g==
X-Received: by 2002:a05:600c:34c3:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488fb792dd0mr216654415e9.23.1776720966527;
        Mon, 20 Apr 2026 14:36:06 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:36:06 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 0/9] Add support for MT6392 PMIC
Date: Mon, 20 Apr 2026 22:29:59 +0100
Message-ID: <20260420213529.1645560-1-l.scorcia@gmail.com>
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

This series only enables four functions: regulators, keys, pinctrl
and RTC.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

The series has been tested on Xiaomi Mi Smart Clock X04G.

Changes in v5:
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

Fabien Parent (4):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (3):
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |  27 +-
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 .../regulator/mediatek,mt6392-regulator.yaml  |  76 ++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  73 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
 drivers/mfd/mt6397-core.c                     | 118 ++-
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 740 ++++++++++++++++++
 .../pinctrl/mediatek,mt6392-pinfunc.h         |  39 +
 .../regulator/mediatek,mt6392-regulator.h     |  24 +
 include/linux/mfd/mt6392/core.h               |  42 +
 include/linux/mfd/mt6392/registers.h          | 487 ++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 19 files changed, 1776 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6392-pinfunc.h
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0

