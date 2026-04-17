Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3F23CF050;
	Fri, 17 Apr 2026 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417930; cv=none; b=odFWu4UXbqQprKuwxd2HwDjKLMv3F0uaXu7rY59LZAGpCPxqAb4/mOW2SI09sRr4VhaPMbZCgUejurXfU1UNISM/JrpcCcdW3oA6iFl6OvXmodS6pekNBaxRTmNOshGBMycNqVbpX82hJQSR3G9JB3P/unlQZqinnlqspNka61s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417930; c=relaxed/simple;
	bh=XA64gsmd6KJbIrvvu5Dmgjjt7ajhyMvFMl5Ha8MY2ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i9KI79f7OHgAqxtIxbMExHMOoSCSH+Jz2wJ5JAid1MT3oFWvmv2xMX9rWHg7gpF4TGH1i+uH0UmVSqgMNgaXz+rKduNZIsbLQOIRHLPqKna+FS+/odWyVf02dKihTdMS3NH7e+HMpjPIGbQsvwWX3FkJKP8Idq8sIq1d0VFVy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lHa+o5Yf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lHa+o5Yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417927;
	bh=XA64gsmd6KJbIrvvu5Dmgjjt7ajhyMvFMl5Ha8MY2ws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lHa+o5Yf1xOxjhmRvLuJPzTjGUd/ptUBq2qIdB41sGUMsYzIgHx/F7l4zpWkQmgkm
	 J21/gUk+QAmrRxD6b53gzVewGJgE0gFF0jX7EI7bUW6cib+Piq6fgE5yiYFtYrhNUk
	 VvyD/WJMfzlvACZwdiQME7+vSfl5b/cBLdMDJHybJcMUrvoupePadoHNRNlfmOJE6I
	 WGJ68jNIDDFLSI6bEvUgE2OhtlW2DQ5OprYwsS6JaYdVpifxZMk+XZGVJvxs6jZtYh
	 5b8nG7LE8p+cxNt4bg88dOZzNiR+2cO+keNRwvTe+LPjepLa0+OwvncXUzTt8Bu5I3
	 xOEsI9v978NVw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C7EA17E0F7F;
	Fri, 17 Apr 2026 11:25:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:58 +0300
Subject: [PATCH 24/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-orangepi-5-ultra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-24-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B2 line to control the voltage bias on the
HDMI1 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI1 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index f8c6c080e418..8a3040ad7450 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -27,7 +27,8 @@ hdmi1_con_in: endpoint {
 &hdmi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -64,6 +65,12 @@ &led_green_pwm {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		usb_otg_pwren: usb-otg-pwren {
 			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

