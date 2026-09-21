Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862E34A4995
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015199; cv=none; b=avlyQrmy2hEyHvxGY8IaPr8Q083ROFdDGB9USATFVOl9hGPC59/B6U/MPsr+xIxLwQVWAf/sbAQp6G4lrEh5PLcIGH+kvZ0sqwh7zR1rtcZY2Lyg8lWY+cp6tUY358uDVu+3GFuembfjjTqxAqAfj8xGtJxHB/nUcgTKbEBNxOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015199; c=relaxed/simple;
	bh=YJ3iCObGV0Zc4+NuCBLB5dg5QmmS/FLkUIuaDasMyYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsfoOof0Bnvi6Vm63ikgyc5pce+1QdBw6uTzkIm5IvVgjzZiD09zBUy05dMnx8kcN9sekDaOpMzqurm5kDwXv4g6XXbImRUHLxXIpNrQ0caCfu4cJFstrQrkbUr8ui9Xs3JMrn45QVUB3ot16xX/C7KaX+72eIeyGNHpTkm3WXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=XL+3gX8N; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="XL+3gX8N"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so24783365e9.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015194; x=1790619994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzuZBv/6+rRjuYTdPZhwsFKr+NJXaORBiijnRAhlDc0=;
        b=XL+3gX8NQen9TPPAg9HDgmzsrrcOWxqcqf33DQMmu5tJj2LPcuTOCJEo5kcUSBedsF
         GgasZXJ7LhvhKv/NTezzX0rqDV0sRE3LxHr4wWCJQ7nt62y6jBuIhTNX1qfWt7R5THyL
         dISVMklLfj7KyNol++InpoyoKQn3g2xYP1MW/nQ6xnZDR2F6GAuXt/l0O30pUpeq2POV
         dVH97wG2xvZX6oUEMkNQ1oc4TbmynYl9ZfV5QUR/y0UxL7N06kMDIKV3iZ17vj7XFskL
         5jnktjp1gKpH07hWrd73vXPAJq1LDvCy93xaAaWADHt+mMLuMKuO9jJWChGNNCA7j2G/
         FvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015194; x=1790619994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzuZBv/6+rRjuYTdPZhwsFKr+NJXaORBiijnRAhlDc0=;
        b=wElh5KkNPf6PJZw4vmpgMnwMlvftQBA1ntqYyoLZgErc/Dxd1w7hWEhsNKG4AWU53R
         o15HS5h6PuJgt2OY7UG70hFeeoy0dVsjeRWOE96BYeVpZDaK+0LDLrwF84A1p3uXEK+P
         hth5RF5zzwga1fkd7KfgJvLaH0nhIKWnmxolbJYY47hQPkpa6hqOeBRKUhiPRziSsyA4
         jriCTpwNMCZ4w1jHvUb7+D+Fa/28+wKfiFSOXF+BMaG7ubwMTXiEfi31zwKS1mpdffYS
         FaxFaEtFBLAhF2ItFSyKMboZ0EMekyDBz2wr+2NDgBwTeG2Hy4U3c0m8HglDo+GDjD4C
         PMTw==
X-Gm-Message-State: AFuF++mdRogcbrUcdbJeth2Cb73DLQHm7LLGplMnj5RC1InEuL2WEjxe
	lUoAdDAsl9ROzh7pEVlqyQNviRqurZpTdrTjcot3um+7QwhOhcSM8ipEiB0yNjYcmPg=
X-Gm-Gg: AYBFou1CfkUi/W8bv7C3Yw+x4Fn2AKefPJ+7QjyH5SKnFvz1cAeTZfXatS6L+nOlU1K
	/hs4uWz4Ub1P7EY3nMPRbrSzH2iI2Bg5HWflpk5tWdxp7eI8bEIrCBiQEN1jF/GEoA/FjaGBMNS
	EkB1nsaACGw7GVf2UaWdFytnIiSdxASss3E//fUw78s/zP6t0crQuMAALwzoXScb30JPIoJe5lH
	AlAIvv4HPsMObHZZL9zdHKMsUjNykJBJstH/bGgoA+8ycy4j7j3J8wXc8mZq5VWydOF2uF4rP+J
	6jhhS4teDKnV5/f3Qn6Y9e125vGKGNtgCeiNMgR1BMkIIJhol9aW9kS4z+5eFVGMcFQePCheB8C
	8BP5S7dBCeJ000ckjblPZPf2ciUwT7dZTNZcrTZ17waTrmenezGJ0tAZixrzeGQdfYJQL6PEX7q
	wBmZhX6oqeIevcrSSUsSzu1jYwWf2usJL7FOJaFe2r5iOSYyEGwYRSsINfCQtG41elt3yxwA7qb
	Dd07Jnb1t0aUqEtfhFDdCXpa7uZYDo54x4r
X-Received: by 2002:a05:600c:34c8:b0:49e:732e:6b79 with SMTP id 5b1f17b1804b1-49fc574eff6mr164403745e9.32.1790015194408;
        Mon, 21 Sep 2026 11:26:34 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:32 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
Date: Mon, 21 Sep 2026 20:26:14 +0200
Message-ID: <20260921182620.17597-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
https://tibbo.com/store/tps/ltpp3g2.html
It is the platform that underpins Tibbo's industrial IoT products.

This series adds board support to linux-next:

 - Patch 1: vendor prefix for Tibbo Technology.
 - Patch 2: document tibbo,ltpp3g2 compatible string in the SP7021
             board binding.
 - Patch 3: add device tree nodes for SP7021 peripherals that have 
             drivers (PWM, watchdog, eMMC), plus a label on the
             gpio-leds node so board DTS files can override it.
 - Patch 4: enable SMP via PSCI 0.2 (HVC) on the SP7021.
 - Patch 5: add the board DTS for the LTPP3G2, covering eMMC, a bit-banged
             I2C bus, PWM, watchdog, and two GPIO LEDs.
 - Patch 6: update sp7021_defconfig to enable the drivers used by the
             LTPP3G2 and correct a few defaults.

Tested on LTPP3G2 hardware on linux-next-20260916.

Changes in v3:
 - fix problems noted by Krzysztof Kozlowski
   - put the Tibbo vendor prefix in correct alphabetical order
   - remove bootargs from chosen
   - name DTS nodes correctly
 - fix problems reported by sashiko-bot
   - add tibbo,ltpp3g2 compatible string to sunplus,sp7021.yaml
   - rename i2c_tps to i2c
   - rename system-led to led-0
   - rename sg-led to led-1
   - add the missing pinmux node: pins_uart3
   - fix pins_i2ctps: use SPPCTL_PCTL_L_OU1|ODR, not L_OUT|ONV|ODR
   - fix pins_btuart: remove SPPCTL_PCTL_L_ONV from BT UART RTS
 - don't disable CONFIG_SMP, instead enable CONFIG_ARM_PSCI
   and add psci to sunplus-sp7021-achip.dtsi
 - increase i2c-gpio,delay-us from 1 to 5

Changes in v2:
 - fix issues spotted by sashiko-bot.

Andrew Gaylard (6):
  dt-bindings: vendor-prefixes: Add Tibbo
  dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
  arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
  arm: sunplus: enable SMP via PSCI on SP7021
  arm: dts: sunplus: add Tibbo LTPP3G2 board
  configs: sp7021: fix defaults and enable existing device drivers

 .../bindings/arm/sunplus,sp7021.yaml          |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-achip.dtsi     |   9 +
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 183 ++++++++++++++++++
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi |  39 +++-
 arch/arm/configs/sp7021_defconfig             |  32 +++
 8 files changed, 273 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

-- 
2.53.0

