Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6CB3A6B81;
	Mon, 27 Apr 2026 21:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327076; cv=none; b=Dty5NY6jQutkM0k/a+HUZsABT8Aok1LKOZP8T2bEUxOlOybhJTOeN+jvsTS3ikQeHJDgj0hkGvrzVGzrNYZ6oJMCf5KZ0V+OiC4vRFT/ezw7446l8pG8TWfdzKIuWScietws6ElTWTY1nIqqvGCTYV2Llof8X5+bQRnNyz7TG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327076; c=relaxed/simple;
	bh=fsbtfxnHKzRAMurlKmT5vTCPiS8SnkUNBPVNt3XJDIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEjkLu1CxwMvHJbwD8/y3aa7/7ydHTmIpnpL9KXr23gJs/cDtYeyuMR7d8l1N4IgtBr+UEzW0yfcpFOnkNG5nPpdJjwuEKZ9aNSx6hTT/hpwpbLYWLB6RzIdrfoy3SJpFHJ2Sln1O53v7xsie1Uf9Lmt3zmfHNedr0PHMUFaIcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QH+HEcgo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QH+HEcgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327067;
	bh=fsbtfxnHKzRAMurlKmT5vTCPiS8SnkUNBPVNt3XJDIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QH+HEcgomXbn+Vl8Trn21QyTg1vyJEJn6ai2tYU+ZIFptUSunrfo8Bk+kvKigYAhR
	 kUXpcMdcaIAmKLmJPJr5uSSsW65kc8lkEoFS1mYsn24U+HGkDeKuM7IiUkRrHVCZ0u
	 j/AGiv+9wa8UlcVlfiV5hZ8CibbWwfthY0OnWfkRMsG1Ee5ptELiDKngWZ0rQ1VTeZ
	 IEf9QxL4J++WxFYxrYfxfVSpOPCAMZDh/+9rh6C1M1OTsKRN13K4VXhNCykshBYsVx
	 lrcuAUNinKMzOhw63k8e3y3ZA6X8i17/s4QMmyQ4/2ShqqAUmdgUarEDv25Yg31dxD
	 zd2JI3ADpl+TA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 903DC17E1534;
	Mon, 27 Apr 2026 23:57:47 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:24 +0300
Subject: [PATCH v2 06/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-gameforce-ace
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-6-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B3 pin to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi0 node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

Additionally, drop the now unnecessary ddc-en-gpios property and the
associated pinctrl-* entries from hdmi0-con, and rename the hdmi0_en
pinmux to hdmi0_tx_on_h, in line with the naming commonly used in
RK3588s-based board schematics.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 89618394c0bf..b657d54c2c59 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -302,9 +302,6 @@ amp_headphone: headphone-amplifier {
 
 	hdmi0-con {
 		compatible = "hdmi-connector";
-		ddc-en-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
-		pinctrl-0 = <&hdmi0_en>;
-		pinctrl-names = "default";
 		type = "d";
 
 		port {
@@ -514,8 +511,9 @@ &gpu {
 
 &hdmi0 {
 	no-hpd;
+	frl-enable-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx0_cec>, <&hdmim0_tx0_scl>,
-		    <&hdmim0_tx0_sda>;
+		    <&hdmim0_tx0_sda>, <&hdmi0_tx_on_h>;
 	pinctrl-names = "default";
 	status = "okay";
 };
@@ -893,7 +891,7 @@ charger_int_h: charger-int-h {
 	};
 
 	hdmi {
-		hdmi0_en: hdmi0-en {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins =
 				<4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};

-- 
2.53.0

