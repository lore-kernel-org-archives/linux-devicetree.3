Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A206647ACE9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799727; cv=none; b=i96vZOb1V1t9B5grHJUnoO5eW/Znmq9oP6vY4T5JYhwck3RmxZ4R2ADnA7XyO0+N6XjdCxsyETvLxtNdG5pPoCvhdx35/WocDKvyOiwiMgbH/4pQBVv9zArXNPf++9Cu4Ohvojl9zydonbQ9vkfsHJ9kBnkXCAkTThqahN5BYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799727; c=relaxed/simple;
	bh=8Mnnl0Z3pOG5cs0RKth4xk3lylmk99qeafTSSPrIRo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TIxv1p4BhtFiXhNT7fTD0GlPBnEVRHsqnE70V0On/4VBAzBmpjTWKx6BLc0DuE1cpfyhr1lRL3PbFIICLt5ifbKX/pngvB2sb8f4R4i8HLOzej6BY9OzFyoZBaPKXHvv8XhId3U0R9KDsfIhVIp1aYO0T6LqUQMqt22esH9dPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kC9HoJS2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kC9HoJS2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso11238225e9.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799716; x=1792404516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=58Hpz3IL7+FBFo99aVZrTh8mHeTaosnWqfT/ede3fC0=;
        b=kC9HoJS2nVLRsUWKN3F5hqe0CP4h6oBT2igIDW1TkWOgwyCJWxPPfjNSSJzMSJxmQh
         LQV2XkXu0uBKcH894XYlh3ANsyCW8Os5FUT9g8uSqQ/uR/sXNrRRrMlC31AqEh+oicnA
         aJrOihq0Gm7ew8ks+4XcSo+A+CiXk49nINmVeM3YfN7w63a6HFdIF8nAtBS7HKOCP5h/
         q4KiBoDnhylbgjKSXP1XKqGNQwhzaZ7K7Qv6iHeLYkEsi67HxJ/f7Wmg3nN0qQX+sMWB
         Fs7W2okVDyJh5HgO82D+cnzB5/aXd2pgm87X1bcJKTmwqfi/lY8D+vKlzM0oteoFv7Of
         rPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799716; x=1792404516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58Hpz3IL7+FBFo99aVZrTh8mHeTaosnWqfT/ede3fC0=;
        b=acHJn17nOzd5nRsHFrqEizVCKZI8qjBTezzxIYYU1bzWnIorTxyEXuknW83XYkYy77
         lzX3UhKY9ENrjlAPhlSXoe+bokW4q+9pINdCy4LLVmhDWGj6vDn5+IM7x8pviqBcQrBz
         44lY0wUQC2mvyWkg6N5I5+agg5LqPisJsY0hbwhqKZ/XVJp7o4egEypvOQi4Rr0TKNRg
         ojXVlOsijXbEoWmC7EJn/8xIGZAOIpkSsYZFuOpOgVboQ6oqiwetnqB1aDi3KPkFAXxY
         ygFUNqP+azXTBU+JuFFO28VLOiL+TRcjWrCRVdbcr4QcziDu9Nqo5uOy9jS50amIWTXA
         iFkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJD6UF/+ffS5QSqHmpTuDF/EvGri5pIVJ/pGYqSoNM9ROu7eis+ag03AP0VuFcMOI8GvyWJA+s4KgL@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2VHQkE6fvfAcmzqpWD4pOFTQK6L7Ag7dGu3aaH8ffxong3KQx
	TY7AdA/T8bvzOGK6vidQu9hbbbmeu3Tk7D78dtmXx9Mdij5K8aZyBhhC
X-Gm-Gg: AYBFou2np1mswaibHN7sGq1Q4ghkellGqDRwjqeYOdSw4xXxHq+GkLeZDMddE1btK+n
	Hu5EANW0yz45S/CtsP7fh0WSmEGFcOwIevn8L3SUHbsjp8lKcgy1vXf/TxjZ29XBDGOvGG21zhJ
	aad4+7LimCLy2V5bS6ZOrjxM2l3GlPEceGZcY9+bumtnGDO37BmEQShMY6p7GwpFaPumJF1eDZK
	S3r1qdAo9Mm3IIFZJSclNtEXgPbdKOu20DFmrciTOe6HEt0Z7taQWpaNsE8FtPqruYdabZS6xYQ
	R9j2mfpCVeouJ9DgsalNlGuGb6b6B2NEssF40ybksGLTA4dlJOEOK6vQy50u+WJ7nioqn3waxGE
	bQUT5PycSLFrPM/26xMD2e5D354SGMDeEhffERmxZnKyy4J6rI/6eI/gCjdgIdLKwmj8wZDylSv
	5CxclR7yCZ6XheuYfAaS9m6ThDNyzACeEWVk5Op7OTRozVcaL3pl5c9T6Qk1d9wlXbHmpVXZrht
	byAyXqUoyAIebNLUbNLQhesXkJGmwqd
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr155420775e9.21.1791799713755;
        Mon, 12 Oct 2026 03:08:33 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:08:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Mon, 12 Oct 2026 11:08:05 +0100
Message-ID: <20261012100816.331033-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This series adds the CCU and pin controller drivers, the RTC,
I2C, NMI and watchdog compatibles, the SoC .dtsi, and one board: the
PocketBook Verse (PB629), a 6" reader.

The B288 is closest to the A64: most of its PLLs are bit-identical.
The clock and pin descriptions come from Allwinner's BSP, cross-checked
against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.

The pin controller relies on "pinctrl: sunxi: dt: number the IRQ banks
from the first one that has IRQs" for correct PIO interrupt mapping.

Changes since v3:
  - CCU: reference parents with clk_parent_data and clk_hw pointers,
    as newer sunxi-ng drivers do; add the audio PLL's sigma-delta
    settings, as on the A64; fix the PLL_24M rate and parent the PLLs
    to it.
  - RTC: register the 32 kHz clocks, reusing the A23 data (Sashiko).
  - DTS: take osc32k from the RTC, as on the A64.
  - DTS: allow the eMMC up to 150 MHz, as on the A523.

Changes since v2:
  - Drop the MMC binding patch, applied by Ulf.
  - Rebase onto sunxi/for-next.
  - Constrain the RTC clock outputs and pinctrl interrupts in the
    bindings (Sashiko).
  - Add a B288 watchdog compatible (Andre).
  - DTS: drop the memory node, the arch timer workaround and the
    sunxi.c entry; add disable-wp and the eMMC 1.8V modes; DLDO1 no
    longer always-on; mainline pin function names (Andre).

Changes since v1:
  - Add this cover letter.
  - Drop both new bindings; add the compatibles to the existing
    allwinner,sun4i-a10-{ccu,pinctrl}.yaml instead.
  - Rewrite the pinctrl driver in the DT-provided pinmux style.

Pablo Mazzini (11):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver
  dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
  pinctrl: sunxi: add Allwinner B288 pin controller driver
  dt-bindings: rtc: sun6i-a31: add Allwinner B288
  rtc: sun6i: add Allwinner B288 compatible
  dt-bindings: i2c: mv64xxx: add Allwinner B288
  dt-bindings: interrupt-controller: add Allwinner B288 NMI
  dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
  dt-bindings: arm: sunxi: add PocketBook Verse
  ARM: dts: allwinner: add B288 and the PocketBook Verse

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  22 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   3 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   1 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 114 +++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 292 +++++++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 749 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  49 ++
 drivers/rtc/rtc-sun6i.c                       |   5 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 ++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 20 files changed, 1398 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.52.0

