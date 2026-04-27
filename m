Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88AF39F190;
	Mon, 27 Apr 2026 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327068; cv=none; b=dpTj4RRomXaVOeRI8YiXgcotg6fVrlRJgRxyu4aEcGPmbHl8s5hnAV+oHcLkwI70e/VEuBWQWb2MVFflycDQoXjYvUIK5gBJRmvFVH9eDxTYe9ZJJy68e+pak1HZxlffwKlCJTRSN73L6HadHmyUhHa+GMljz39wrFmeq+y/EFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327068; c=relaxed/simple;
	bh=/vBqt9UZcZFgAFm1ZsAr9FZXZJaxsAIpfwkQQgR2SJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkR5CUyFeF/we2Vu9dJFvGcjOpaPZguzpJ40ZZ5z7J2j+wDhCte4IKodZs5wfQkgxvzN4t547FXSqx6N4vdC7MLwRueKpJRE/Bj3DwJIvX1ezEi12f7sZB+y3IcBkJfIaXL0n7YM5cwJ19jQniKB9vG82a1rblSZ0PQOlE05HUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cdF06wVZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cdF06wVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327065;
	bh=/vBqt9UZcZFgAFm1ZsAr9FZXZJaxsAIpfwkQQgR2SJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cdF06wVZD/rNIwL5iUuHOlH/u0AAsbFbiMf/jol7/U2i2VMxCs3608IFIPhn8oj1o
	 m7D28H23UoYGpLOURhHVM1fqJsOHruJPNqx5UGv/56gOcdMSjDZ+GwTBbeilv/x8PD
	 NDiBwzoMu5opewZayvBsgGXsj/KHxIjArPQchDqf3xr+Xy0V2VX2lxvLpjwgwvA1gq
	 fdSpk8ks3HMTh5EgUoAtcm2fho67XGD2AclqD0GP3txToU3Qv3+KWnVhzZA7W+rC2h
	 lkDWa62r2Cxw+ViuA4lAldXoAyMLR7u92mz2G7u573x0bZCI9XxM9guzjub0GzmUvv
	 wRQzt69EZzpzw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FFBE17E141F;
	Mon, 27 Apr 2026 23:57:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:21 +0300
Subject: [PATCH v2 03/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-nanopi-r76s
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-3-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_C6 pin to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

Additionally, drop the now unnecessary workaround of using vcc5v_hdmi_tx
as hdmi-pwr-supply solely to drive the GPIO into its default state.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
index 7ec27b05ff10..0a5cd5f6fd33 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
@@ -70,7 +70,6 @@ led-2 {
 
 	hdmi-con {
 		compatible = "hdmi-connector";
-		hdmi-pwr-supply = <&vcc5v_hdmi_tx>;
 		type = "a";
 
 		port {
@@ -109,18 +108,6 @@ vcc5v_dcin: regulator-vcc5v-dcin {
 		regulator-name = "vcc5v_dcin";
 	};
 
-	vcc5v_hdmi_tx: regulator-vcc5v-hdmi-tx {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_tx_on_h>;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-name = "vcc5v_hdmi_tx";
-		vin-supply = <&vcc5v0_sys_s5>;
-	};
-
 	vcc5v0_device_s0: regulator-vcc5v0-device-s0 {
 		compatible = "regulator-fixed";
 		regulator-always-on;
@@ -252,6 +239,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 

-- 
2.53.0

