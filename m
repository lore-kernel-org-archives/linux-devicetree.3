Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C593CCFCF;
	Fri, 17 Apr 2026 09:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417927; cv=none; b=esBal8PWeAF0F84kwptEHdhD6mRY23yZySL4eJwz/i31dpwer1/h9746Y7L4xk2m6nxL0mTMT4r6m7Yc3GmC4yWPkHYi9ipI+oDBj6ywIe+wJyCuZNr2HDdMOdAeAhrn3uS9c0o9fEkt1HL0E479fB0QieCpR8DaTzY+/ir1UhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417927; c=relaxed/simple;
	bh=nF1T+r+JCN9rFVyC9cXzS7DYsZMNPcB7zjJ02lPzLuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=beCDRBHdRnu7sJ3b1AtSDyg9QyGP4+PmnMSEachYhPpazscxlnB7A2KTeYdvwPq1F4/4BhNhXjpOwhE7bJgLqsRZJqkzm5lymb0bXi8OsIniHLM23Utbm2ld2jgmqHyOEf/sU9BPMqsWbYGX6fcY+nOsL3tofwvFqkOUVlJtHZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=doNH3EBl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="doNH3EBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417925;
	bh=nF1T+r+JCN9rFVyC9cXzS7DYsZMNPcB7zjJ02lPzLuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=doNH3EBltlt+XKZvDLEyW5aWjGbWQ7XYPGil8AmLQTTnQBEyAuDBDLGbHG81WQZE3
	 36GcEP4VXciDdeWa2ENrW9C5ulnIcxcGGNgLQgzxdwvzeCPKCwcQmE/pxntkWRKmkY
	 rAqGK6GMMpux98ptpuACwz7RISlC4bxYV9GsS/bjVOHzYQfTuQE31Tfa7ESn/EhMsF
	 Fl7lwqTDzBaprGhyTun4A6nnV4laAku0fC0zPi0PPWFnpz0KqsXMxMJD6BysBEEfGt
	 QHomNXEEaEXAFLG47QHpa6aNSGVD4pmz/MlDAitByibIRk4AGUXu/OsMeaEwjYK6Up
	 A9Vku0v4uGyUw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0174D17E131B;
	Fri, 17 Apr 2026 11:25:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:55 +0300
Subject: [PATCH 21/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-nanopc-t6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-21-a19c0dd8c9f6@collabora.com>
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
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 84b6b53f016a..be6f834264c7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -361,6 +361,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -381,6 +384,9 @@ &hdmi0_sound {
 };
 
 &hdmi1 {
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -682,6 +688,16 @@ usr_led_pin: usr-led-pin {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
 			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

