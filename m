Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794773750B2;
	Fri, 17 Apr 2026 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417914; cv=none; b=nTE5JGjs/c2QfVggMBa+V4cBFDbnGrgOAA5K9ILD2zExiFhHteqxT8RzWCeYjBRgKcbNgWApT5nfoldv05BHVpHjATZoN98qhrNG91hbRMdxc5jOu5ri727tmB+PQhJi1CbpksJg4JuevnjnpTEnfDkScvjT9XoLCZ+eF6tuhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417914; c=relaxed/simple;
	bh=mlqIEopefDt9DLJ3QmuEh2a4QEM5ojLoa61J/yBARMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5G2mXnOpX0ERU86gSWVJ7aG34GjePxeNNvc28Gw14DJUD+8KyFU2TXHgpivV4dv8ecY36ZA/8LHBUWgFPUHJItgr5o4NVNgGHv8GawpMiEnQoKfK9dpFfNABFUZCdZ8gVJnOEDMu/2pWtnyCMfv6ZXa/+kb84u8wEYz1WWPjQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S+Pi/iFV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S+Pi/iFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417912;
	bh=mlqIEopefDt9DLJ3QmuEh2a4QEM5ojLoa61J/yBARMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S+Pi/iFV/k6L1vqAds+YHDLPuHGizUnlQTg8tjsP5/RrL0AMRgCxC924awepwgAKD
	 bjW5IclAYH2aIXFREa6V0lvShP+WG8v3RmPbshVh3EJs29cctadbcjxJ6/HUj97W1B
	 wSPaPG4pxLZIcXMdYAzPUGps7MBMxkSqjPcTSWP7qx9ga6plKfcHUyOYTdY/hUXuXs
	 scNjvzyQD6Tk5ZQYPhqWAJ/n7n5KPV18UVKybDucmk/dtcF6R/c1ILck7+5AUiQ3Ig
	 FIyyZU8SuOGwObycuvalQ1eVHJap2mB6gO0tz2Eh4cR09vydi/sqJv7GC5lYvN78XY
	 jn59EesUJ5uPA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA9C517E1396;
	Fri, 17 Apr 2026 11:25:11 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:39 +0300
Subject: [PATCH 05/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-5-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_C6 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property and drop the line from the vcc_5v0_hdmi regulator to allow
adjusting the bias when transitioning between TMDS and FRL operating
modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
index 749f0a54b478..93ae37699366 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
@@ -140,10 +140,7 @@ regulator-state-mem {
 
 	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
 		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_con_en>;
+		regulator-always-on;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "vcc_5v0_hdmi";
@@ -231,6 +228,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -655,7 +654,7 @@ &pcie0 {
 
 &pinctrl {
 	hdmi {
-		hdmi_con_en: hdmi-con-en {
+		hdmi_frl_en: hdmi-frl-en {
 			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.53.0

