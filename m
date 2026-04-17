Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B4371868;
	Fri, 17 Apr 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417913; cv=none; b=m60Fgbf7cxxzZyDkGsPu6hlibs/py1SvMShbi4PStNRyyVtEXmGNTGrHYgeN6H4o1eDxkxFeb/H3aCnFItGxRCLy3JgH6eea+/a0K1CnwC9qkUZUh+qfuyM2TstzgXniorESlqJ596PbePWICSADTIskqxhvE+qAMaGLdnc4zkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417913; c=relaxed/simple;
	bh=pIkr2lvmVoiMJarejipGAoVFydRK9sYCHg56kEfAWiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxLzbYOORBbtOMaIASblTicGzoTWLmCDNB+kqJsQwZgVM0X2qiE2isLwq0RzJ2jZfr4A15FrpZt2KB1i+7kX+Ac/tWlx6bGBKAn9O0UIdw3dDbzJ9joE/V8SRXC3g6k6nyBBxvItkfgObknXBHOsAlVUABh6rFZX1Pds4XFCXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JtY6+cDq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JtY6+cDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417910;
	bh=pIkr2lvmVoiMJarejipGAoVFydRK9sYCHg56kEfAWiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JtY6+cDqZPSv0LM5EWwQuGVclhFlfcSBVDKECLaI3lxcPunZvR1QS9fxoA5xJVe5C
	 w7C01O6KiBGWszgM3gfgv8c7EGZWFjyaqwCn7D6VOfPK39RjT7A4jMg+6izzWK8HSY
	 8bj1IRKybURM++38vS4XsUUzfwv7g2W6pSY6wvC5Woj0ap3ccSbbH5d2g1GwPccUna
	 8TwmYjx9mpFO+LT0djemEiF8Khx19Oj3x6dYHyAC+bBY/GSzs7JZo6eS1Ia8Hj67mx
	 /V8AWbxUvqrupDhdB2ty4SNHq9RV074V5yvQFx4WRtx2+fWaCh88sFzeLmHwQvX4Hw
	 MavJSytWW3g4w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5257217E137E;
	Fri, 17 Apr 2026 11:25:10 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:37 +0300
Subject: [PATCH 03/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-evb1-v10
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-3-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO2_B0 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index fb0dd1bc5148..b112432528ed 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -370,6 +370,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -895,6 +897,12 @@ host_wake_bt: host-wake-bt {
 		};
 	};
 
+	hdmi {
+		hdmi_frl_en: hdmi-frl-en {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

