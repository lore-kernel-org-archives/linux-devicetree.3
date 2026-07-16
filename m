Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA38A37FF5E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218794; cv=none; b=GznLy+Be0IeHDSuAbAY3SjA7OZ9SSEAT/BEz+UrpFFatCB5opb51qqhSiWkLWTsco7/P5u0FFiNmBSwrK3u+RwDXmK5O4riYkjxH1Z2gc9kKY0TImFrYDjPgrwTific6Gx/0LQIHcGHAJfw+EliZ9aU6baS9KKwXj9OsVjQh+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218794; c=relaxed/simple;
	bh=CoTdISyq29dSmpUWX0TJOBJrar1l27NaXaEJX/sfzL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QY+QXBuptfHSz1y5THT3hZes3nw5GT6nxeE0rrJTnHfplgKs9PCjZ+jYQYs+yW/uHGcXuw9oJO4MErmq8jn9XnSIFWMKhvd/4N2BBuftxs5W8d9wYU13jUWWsiNTdUi+QLXEkXVMXJRbvKJIzRDheYMs6AELIKtSvA5jAnDm5dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyMKZV2r; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyMKZV2r"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84830c774a0so2819516b3a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218785; x=1784823585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpV/surFpPC4mt4ppalNgv6Fp6w6RgS0HjdjNc272JE=;
        b=iyMKZV2r84Fk/wChPs6okiYYt0rpcp8DLcKicceG7Mtsk3J1XMnZ/qhrFb3xGtbVVW
         SUGf4VqZuIkFtHWMfqvRJA64+yI6FFO+25Y09l5fwyWJVbr2hXOF2mY0b5mZe0+wcIDN
         83HMrIS5x+gYCGw7J6J3tlhoExVs0FFZqoWgjXEXmRn/3eOjQ9hsRQtaPOnpHjbuODLv
         rquiisS/y0tKO4WDaOk5JH7oRoJ7YtBBVFwo3gha1p6UZAxmgoTb57O1FyjSsagcAEFn
         7c2qBGlb/e2PnF2JMgjWTYczSa4hdligQFXz+14fFSBokQ6CCGEBAjXCRdhi41NUOcCr
         4aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218785; x=1784823585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpV/surFpPC4mt4ppalNgv6Fp6w6RgS0HjdjNc272JE=;
        b=KPGNAKw0BPQNGXT5Ex0gh1Gsk4TnSVVurOIwOYXBBNXtZq+y/ZFKVcWx/feR4EmR4E
         /ZcS8S4s5yH0wC/iP2LoSzx2UIMR6vLh0IZV1AihY7Aw/lNpxA8VOy+l3ZBQtjfCM0C6
         oGISJJLoyeOPBYn/F1/7NIlHxNAMKBHu8iAwSpBgYg+nM8qQBZtoPkblIDpRUXn3herp
         6zh1GnPpvdkKglcqqo7AJzxaXa1fgXQ1a0wFC8XrNakxyAPyx/VBT4CKUknF5/gLY79m
         sRbzp8IUOSgBQh992FivEdmy/jqkYyFfHQKBuc3QfUFR9BA6/fSh0ca4gK9Rot45g9ua
         pM+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrXeg9pXCxBLPLDiu7vOtAFcgL87eWL85VcxfEi5JcgpGiNDrthapnPhwGSOCrn6DRDLplEYVLyGHMo@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwsFozhQd2aq8ZP0O1HNQvLkIR8gb+kaEYKpTAuPFdY1+8H6V
	AFjM0Jzan1RjXFQicaIEm3HjeUtCwC6/7ejA3EnMtZUCHHyiEeGYjYp6
X-Gm-Gg: AfdE7cl29mV2Gh/ZgzXnPxl2PZ2VRTavmYPR3EEG8cW08SWqaw1UdMBwuN9vbGuMy9K
	GAGFAuGRxxtRsdXVOpM4Bj8x139nHrGKoHGXJ4+lV3E94PhUY+fdun13JYeTXCtMRjw2bEi8i8C
	54F+nnGytryHoVUxtsXqKBxrWbagAKIYHjacCnSm3JrflMAR+9DXlNLiVEQjWBBd60gmkEeSoam
	pNQ7Urw7A0b4tc3AtUkU+D2uZHuBSbRMrciHFjM+bJEW6nQ2TUXnAuaaAtKc8HS9WGimccIyLHp
	ECxLtADjFhpAZz0L+a3pPH7sBQO9+zsv2ze3HOuHuQ6nct6xtVEkMDoJNlX6SEjYKKeBt/EoNWo
	Bj/gtj7aplrqVPI8oo9hPgj6PD//Vfgbsp+IJmN9lJJ85rcwWaOzfxQEOG+5fIHYCpkoAoWGkco
	dAIE5Rea1n70wSbcm8ulKhu4X81YQLqdsSdw==
X-Received: by 2002:a05:6a00:2d25:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-8488971545amr21155827b3a.24.1784218785118;
        Thu, 16 Jul 2026 09:19:45 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:44 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/7] Add reset support to MT6589 wdt and remove fallback compatibles
Date: Fri, 17 Jul 2026 01:19:16 +0900
Message-ID: <20260716161923.266315-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds TOPRGU reset controller support to the MT6589 watchdog
and removes the use of "mediatek,mt6589-wdt" as the fallback compatible
from many other MediaTek SoCs.

Many SoCs have been using "mediatek,mt6589-wdt" as the fallback.
However, they are not compatible with the MT6589's reset register.

To add reset support to MT6589 wdt and resolve this problem safely,
the series proceeds step by step:

 1. Add explicit driver entries for the affected SoCs,
    so they can be matched directly.
 2. Extend the dt-binding to accept the SoC-specific compatibles while
    still allowing the old fallback form.
 3. Drop the mt6589 fallback from all in-tree DTS.
 4. Remove the fallback from the dt-binding.
 5. Add the MT6589 reset dt-binding header.
 6. Assign reset data exclusively to the mt6589-wdt entry.
 7. Add #reset-cells to the MT6589 to enable TOPRGU reset controller.


Akari Tsuyukusa (7):
  watchdog: mtk_wdt: add explicit compatibles for SoCs using mt6589
    fallback
  dt-bindings: watchdog: mediatek,mtk-wdt: add compatibles for all SoCs
  arm/arm64: dts: mediatek: drop mt6589 fallback from watchdog
  dt-bindings: watchdog: mediatek,mtk-wdt: remove mt6589 fallback items
  dt-bindings: reset: Add bindings for MediaTek MT6589 reset controller
  watchdog: mtk_wdt: add reset controller support for MT6589
  arm: dts: mediatek: mt6589: add reset support for wdt

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 26 ++++++++-----------
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |  3 +--
 arch/arm/boot/dts/mediatek/mt6572.dtsi        |  2 +-
 arch/arm/boot/dts/mediatek/mt6582.dtsi        |  2 +-
 arch/arm/boot/dts/mediatek/mt6589.dtsi        |  1 +
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |  3 +--
 arch/arm/boot/dts/mediatek/mt7629.dtsi        |  3 +--
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |  2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  3 +--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  3 +--
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  2 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  3 +--
 drivers/watchdog/mtk_wdt.c                    | 18 ++++++++++++-
 include/dt-bindings/reset/mt6589-resets.h     | 25 ++++++++++++++++++
 14 files changed, 64 insertions(+), 32 deletions(-)
 create mode 100644 include/dt-bindings/reset/mt6589-resets.h

-- 
2.54.0

