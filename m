Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820323B4E9F;
	Fri, 17 Apr 2026 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417928; cv=none; b=M4+Qa8YEpPDP0ID6X9qPzkY2q08NZz8LeOXTumMuyWFR3/lvbD4jUUCZ75r5XbNT/PIctp6XGG3gzdfga17U8qnz1hU8CKaEYqYXposf2SugVgnBVBieXynx8UoxDSfs/2H/xNJU/dNiMXvWGU01C11qE/8jt41FbYQiZCUAq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417928; c=relaxed/simple;
	bh=k4fv7FLscxi4zjT/qCu8YnVssEr69kCSvYKLDAyF+cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQLhNtQn9mxXzXRhCyuN8k8ZZ1bdjEjhgEz31eJC0AHM2ijpEWLLwAw9trTQBXlG0As0DiIBiyX9aUJ+M+HWWIg9Lyb3A+uLa8HMfVtm04xGhvB7TXRSH79+lqVXcOe1wntKX2zdQnBDuPJQIz5aLf+PbUprH6D7+n3Vs5njGdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GCIocr8J; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GCIocr8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417926;
	bh=k4fv7FLscxi4zjT/qCu8YnVssEr69kCSvYKLDAyF+cY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GCIocr8JfzXEDKrYjwzeIBnsE4e59vRFiQ1BzTvDWFyymva0yJ10gvpWcwwrmvfCE
	 Tuo9dB1wP6KsTHKxdM5frWx1Wg3cl7hkCFdqqIFUxt6HalCNPY5xQAZDDAC8nSz5M1
	 HyHi0Tq6pBzD7UjKVbVgTk+jmw2RrMqUQb/fjvGk9gA/1IAiKcjrG4slW4NZuB0xFm
	 f36tjSG+wS5+Vr+lk6+auDqw/6yY0/TjKw3nbvoLLiUXjfGkmePV6z8t3bCgQw74qO
	 57fa2zB4+zRbIUnsKY7RXA7L9kLFc2uOMydrMm61JuXD+Gm/eh5qhQrYBCaXnKq5nl
	 nK7HUUh/1MT2g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC92217E1340;
	Fri, 17 Apr 2026 11:25:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:56 +0300
Subject: [PATCH 22/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-orangepi-5-max
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-22-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B1 and GPIO4_B2 lines to control the voltage
bias on the data lines for the HDMI0 and HDMI1 ports.  These lines must
be asserted when operating in HDMI 2.1 FRL mode and deasserted for HDMI
1.4/2.0 TMDS mode.

Wire up both HDMI ports to their respective GPIO lines using the
frl-enable-gpios property to allow adjusting the bias when transitioning
between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
index 8b1d35760c3b..f2cf61e28bbb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -35,6 +35,9 @@ hdmi1_con_in: endpoint {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -57,7 +60,8 @@ &hdmi0_sound {
 &hdmi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -102,6 +106,15 @@ &led_green_pwm {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 
 	usb {
 		usb_otg_pwren: usb-otg-pwren {

-- 
2.53.0

