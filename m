Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A005850EC07
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866377; cv=none; b=MIlA/ZuptCMgeCZcgK5XHCpTSDeVAHJoPb18Awj/LhBHzgNo/P3ZZKgnkF0y7pHuNzj1U8jZRrliJM0b2oY8y2Ltfbd8LPVlq+hlq4I6Wo9TDm8CgsYeOHoubtX8SgE+VL0eLKCuZmJyh7MGtiVAC7h8jmdBSmfwOQHGyprgcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866377; c=relaxed/simple;
	bh=9O9kWGGQbODtRL5UAdOuaAinJL8bBPDsv7WUv1hTnnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Im7bktB4pTqj2epNVe1S8edTrEI3CsJ/y7XlyR36H2BJjY2wPkZei6FNI4NDGRoB8COdeJ47Wtu16zBCTpOJXJGXdYQl3KWwONRvcLtcgCbXctrXtmlRFg3I62AA/MU7PE/yCGBN2f6fd5X5qHusSEDC2AiEdnsySGxvxsjtF/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rxsm3lPX; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rxsm3lPX"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858a186d5bso367759f8f.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788866369; x=1789471169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMadN6VBiKEQvvZox4M1avk0HRML78KU4CFtSbLK3WM=;
        b=Rxsm3lPXjtOsq1hx/7RxBKcxjgKMvn30bD6YpJJ4fVzzU+dDl7uVNIMHh/T1gahU54
         S6P9oHrfld1hU2yw9l1mtSedUlysUtSzXGUFgZvnmNdjMSsQHmdr0CMLeIqVAweH40kR
         tj7LGOi2fhwAhR5baHueT7rHFTZ4S2fWtWtpD8R/4WpbGLQTAZtnXyc55l2cpgXLIG2B
         rJWK3VES0Y37wMkFMH8sHJL41Dbm38gcROwCDPdfJW7Wb3b8D0toJ3ewEt5zORQMY/la
         JghS6sv65UYICvQ5xmFVj8J5EBXt6CwUbnv0xncJbJsbVa+VwlOyB16DKAfs0V8tiaex
         WXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866369; x=1789471169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMadN6VBiKEQvvZox4M1avk0HRML78KU4CFtSbLK3WM=;
        b=f6dlwpyAyHT4p+WFPIUclTLzlNdw+y1ZhgTE1uqQ4rVRxamz66Uw7O/QiPzSZL0qJU
         NY/ZMGaUpnRy2J4V+grrczUhXX1o45ZB4R14eXo+rSFdZiKSkMbasB3b2hBLPSq+9Jjn
         xDfsJWJKaFk66ApgWcthnWAFvzLsIxjx4tKXhRPOVn/WwhysYOQzxchlLWyzJu3iiEFZ
         iAZILmjFxwmkzZYOxnhsx6o/kaW87e5Gq+1RNeJavL/kSHC2vnqCU1SiJenfzzWmqNYJ
         m+ogvDAGSItKk+TwIjlgV+GmYkpkrO47YgWzoaOwdn1+xnV1jo+0O8M9L4twLhKTlmgs
         YThw==
X-Forwarded-Encrypted: i=1; AKwUvBzDgfHTECwIrTgS8+pTqRGIPaq7slfph34WhjG/EhjKXBQpa9YppLKmxziKNs/jEo+8xU/5cRSHaG3k@vger.kernel.org
X-Gm-Message-State: AFuF++m9pYVKswBSHhwZle5BhVxPChbFQ17Gd4nQ6MXZFsl7Fm5zd4co
	rlJ0kpO1JQ0ZGeNN5WhhMVqN4MRt1SzHas+dayNLM94rgCZmgBpXejrJ
X-Gm-Gg: AYBFou0BoMJ0jheG8hinNxMGzc7VTPTAoCK5GVfpibCH5412KF0mb9AT0uhrLWyRB6P
	TFPAi40/jYBpldnLKgFbLBENxY4Wh5DkASHP6Oj/lYHO6QrStPJxF9rZDrIvQ9QJrJ00GjXXfOx
	V5T3WpfAcDUjmnp8Io69mCI1pgzRulciBoTSTYjS0sr24Fa+SNsBVxBAvmbnELdtX0uQ75wE8xD
	+tiEVM6ScNzXmta6jzIoTBWmcNsSlbuberR/xad1ngaHa5Lg674/h3tWRtbExBel6nY2E/38zWe
	EZ3+uWpnUXdhEnAu2ycNA836Q3jGz3QO3VpWVCzhnZ3E3fV4jRk7guAnegszgs4AIxFe/wyjGvl
	ppY//3V6NyyvC8ryaeycGl2iBBO6F1/bKekhmYBys/m/lWKKbBn4JANJ8KrgAHKLNAJQ4UfNHUD
	MBBnb8qbu7gAik5Ga14Z/wBg5sANVvSeAzZy6tD7J0rg/xdwAp9NeJiGhhsNTEwzQvV2spv78ge
	EUlYDoNQIjnLR4vqTX4InTQtaulg98schYM9CjAmrgsVP5f6OoiBRfWOn9VjTXaB7wv
X-Received: by 2002:a05:600c:8b2e:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49d01dcc1fdmr173785985e9.2.1788866368697;
        Tue, 08 Sep 2026 04:19:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D009E74109367A274C5.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:9e74:1093:67a2:74c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm973747855e9.0.2026.09.08.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:19:28 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Ondrej Jirman <megi@xff.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: fix hym8563 interrupt pin on Orange Pi 5 Plus
Date: Tue,  8 Sep 2026 13:19:08 +0200
Message-ID: <20260908111908.19371-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt line of the hym8563 RTC on the Orange Pi 5 Plus is routed
to GPIO0_C6, not GPIO0_B0. The vendor device tree uses RK_PC6 for this
pin; the mainline board file uses RK_PB0, which does not carry the RTC
interrupt on this board.

As a result the alarm interrupt never reaches the SoC, so the RTC alarm
cannot be used as a wakeup source on this board.

This was verified on the board by enabling the alarm interrupt (AIE with
AF already set, so INT# is asserted) and sampling the EXT_PORT register
of all five GPIO banks: GPIO0_C6 is the only pad that follows AIE
(high with AIE=0, low with AIE=1, in two off/on cycles), while GPIO0_B0
stays high and its interrupt counter stays at zero.

Switch the interrupt and its pinctrl entry to GPIO0_C6. The board has an
external pull-up on this open-drain line, so no internal bias is needed.

With this change the alarm interrupt is delivered while the system is
running, and the RTC wakes the SoC out of s2idle.

Fixes: 236d225e1ee7 ("arm64: dts: rockchip: Add board device tree for rk3588-orangepi-5-plus")
Cc: stable@vger.kernel.org
Assisted-by: LLM checkpatch dtbs_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Reviewed-by: Ondrej Jirman <megi@xff.cz>
---
Changes in v2:
- Drop the internal pull-up: the board schematic already has an external
  pull-up on this line (Ondrej Jirman). Only the pin number changes now.
- Reworded the effect paragraphs to state only what was measured; no
  functional change.
- Link to v1: https://lore.kernel.org/all/20260906181622.11991-1-royalnet026@gmail.com/

Notes for reviewers (not part of the commit message):

Measured on an Orange Pi 5 Plus. The input levels of all five GPIO banks were
read from their EXT_PORT registers via /dev/mem while toggling the alarm
interrupt enable through /sys/class/rtc/rtc0/wakealarm; GPIO0_C6 was the only
pad that followed it.

The s2idle wakeup was measured with the v1 form of this patch (same pin, but
with the internal pull-up still set): 'PM: Triggering wakeup from IRQ 52'.
With bias-disable, as posted here, I re-checked that the alarm interrupt still
increments the hym8563 interrupt count at the programmed alarm time, with no
spurious interrupts on the level-low line.

Note that on this board the resume itself can still stall later in the USB 2.0
host controllers (a separate issue reported in [1]); with those controllers
unbound the full s2idle cycle completes. It does not affect this fix.

[1] https://lore.kernel.org/all/20260907190000.s2idle-usb2-resume-royalnet026@gmail.com/

 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 145986695720..3f2806284754 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -189,7 +189,7 @@ &hdptxphy1 {
 
 &hym8563 {
 	interrupt-parent = <&gpio0>;
-	interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+	interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hym8563_int>;
 };
@@ -298,7 +298,7 @@ hdmi1_tx_on_h: hdmi1-tx-on-h {
 
 	hym8563 {
 		hym8563_int: hym8563-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

base-commit: 1fc5a74b108fc90951890ec513ac81869f5eaff1
-- 
2.43.0

