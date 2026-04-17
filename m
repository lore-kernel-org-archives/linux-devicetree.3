Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1364B3D523C;
	Fri, 17 Apr 2026 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417944; cv=none; b=Re9+cX1SV1+39fVK/qHoEqt6nL0T0cBheL4QHTcZrqad8ZRn+At8QR+31O9/XvM9X0DX13I4CqrjLOYbO0Qcb7BkvYb8bB490RoJL5JOLECCUuy2CFOlkf0RtybrCyrz4m0h8p0PQ50DGzh+nr/Qq/vI/ecbgFNIVs5HrKADygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417944; c=relaxed/simple;
	bh=lpb1hcax4usyNX7lqoPIuUba/4R/HCMdkmK68NfSmjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7VewiWQtqYP5BfG5wAfd4SguK2oO6HbKFjZ66wRAczj1Axdq6SAyDJbPXYckZFn0j7r+TE6iV3Sj05avvx4n8NNWBR4alQiRtrejjRk6OiZqYXPdNPV8pq6TxYDOpM+Wy/mKfu7BYu/B/szMunlWjOOT5ik1UuZaCQrfc1VkkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Iw9Gyimb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Iw9Gyimb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417939;
	bh=lpb1hcax4usyNX7lqoPIuUba/4R/HCMdkmK68NfSmjA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Iw9GyimbkSVNd25yXiy2uyO2SeW4oSVI8o2oNwxlywvVQ8NilXV0yIPMwNwvn8h2I
	 NL92v7o4jZAfZ8YbfWLHmb1pzUX3tPnVAkjNXGrpWHRAK+uDZ/TJ7CVg3TjJ6DdTuv
	 Vvv0N6WtF8/Edd9CyU+TzBiW4uPlbOQxQNnVHSw3GNr9I1ZQNGrZLf7I6lfdjmKSo/
	 gfb7lv33j+mbGgsTjN6icYWl4oiXVtT4ma7ktXspxSTouMbFBkCqQPOmjrMMFDllyy
	 FS280n35jsdE8GHthdhRSBrj5NGfxPhbVsYcvScxi18xZ+oF+r6Uh6bMHy7vTwFHww
	 lBytwAp2c5GLA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E86CB17E1274;
	Fri, 17 Apr 2026 11:25:38 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:12 +0300
Subject: [PATCH 38/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-roc-pc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-38-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B2 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

While at it, move hym8563 down to fix the ordering of &pinctrl entries.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index 7e179862da6e..a54d1aac284f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -224,6 +224,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -367,9 +370,9 @@ &pd_gpu {
 };
 
 &pinctrl {
-	hym8563 {
-		hym8563_int: hym8563-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
@@ -379,6 +382,12 @@ hp_detect: hp-detect {
 		};
 	};
 
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	leds {
 		led_pins: led-pins {
 			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>,

-- 
2.53.0

