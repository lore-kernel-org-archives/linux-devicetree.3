Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E23D0905;
	Fri, 17 Apr 2026 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417935; cv=none; b=eepDxPrlF7OSSdF26Iwez4rlnmOG4VUCn5J9VmzKSuPZTEQ8faGpck5ypMlJVIsa/yxbhsD8+8VLEzr2sFIrHDb6ZIiDVYQh/1op3MY+R8RHOwpVIy46GDbeZS6fRC8tCEhzaf0EnmTuXu/QNLzZOx1s6NNeBxoetGn5Z3S8a9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417935; c=relaxed/simple;
	bh=MFvZsAweErYsM8rT/Ug1tTVSPPr+xfkSfDEwWngml94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0y+v/IKxQ2TQk/zK3/yIjwNf7TgjrpWDQqYeIgBKoPonWDEDzb47KBhoShvTxg1hLyf491245HEtaZDQp5pLFOxwceyD+O4Ot/hqvLkqk6TsbC5Y7hVF7iynBNjc85tlqRFMzd+LqQxQj7czXYOIZ1mNZMc3JBq5QUiiHiXkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mFgvM3RU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mFgvM3RU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417932;
	bh=MFvZsAweErYsM8rT/Ug1tTVSPPr+xfkSfDEwWngml94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mFgvM3RUcUwFLEwr4/wtsVIpA6ODqHbt71iqjuvTZ30WR9ACUomrORwUUDBipBZgI
	 NVaMMNdiybacN+dTGQ88g3KbqccnXxuk8u/yXuwvKkQVnPMhBeM9UbbYnBeh5hePj0
	 s50rxbEuEmUxJtlpG/irHlRZ5+cSCZ7m/UbCJL0XePJubMWmNJPzMZqWEaA08p8PZY
	 hpw5Vemq85p/X6caNR8Z8SefNeXerlBnkPNGbNMb8FPxnR+F54mH2cJ7zanqSfc2L9
	 aWunggAjpoiNz6fA1sVw3f/OY1XgE/l/oXseAephyLn4Rq+T/X47qJzomAb0tAa0vR
	 fsBlLwZbSc9qg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6439A17E131B;
	Fri, 17 Apr 2026 11:25:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:04 +0300
Subject: [PATCH 30/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-gameforce-ace
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-30-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B3 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property and drop the line from hdmi0-con to allow adjusting the bias
when transitioning between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 89618394c0bf..0270e5b046eb 100644
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
@@ -515,8 +512,9 @@ &gpu {
 &hdmi0 {
 	no-hpd;
 	pinctrl-0 = <&hdmim0_tx0_cec>, <&hdmim0_tx0_scl>,
-		    <&hdmim0_tx0_sda>;
+		    <&hdmim0_tx0_sda>, <&hdmi0_frl_en>;
 	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -893,7 +891,7 @@ charger_int_h: charger-int-h {
 	};
 
 	hdmi {
-		hdmi0_en: hdmi0-en {
+		hdmi0_frl_en: hdmi0-frl-en {
 			rockchip,pins =
 				<4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};

-- 
2.53.0

