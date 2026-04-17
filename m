Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DA93D3CF6;
	Fri, 17 Apr 2026 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417939; cv=none; b=P+M3hCS1GC3KyJntFX3kCLxyjmT2l3n4T2ixBEh9LUtYPdpIMV9YXR7OE7TEM5bBneqE9bLBOrWu7hlPXMN2TCVSkjPoXbneMCRxL7bNwNZ+DMUth9O8qmQiX5c3rxsaLBV8RGycWojvx+LqiLZIJt37jZoNxxYXJWnahgklqic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417939; c=relaxed/simple;
	bh=0WZ67nO2zp4/q1aptEhQfM5nNxA1QDs2Kvu+W6lQ9S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/Kl/H7dRKFLh+BpA1wdx5cYdxLh/ij+z/dSHYNTCLw+FjZFL1fJrKGAEIRaQacpkj0S849uKwkt47JVRzeCiCfQHPsRrx5DCJ2ZkDvcd+C6/yNvZfrmizAQPEos7Sal2nTezWjAlD2Jr759I8C5ybC3SqJCSND3dQSYDIpyWOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N1N4eH67; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N1N4eH67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417936;
	bh=0WZ67nO2zp4/q1aptEhQfM5nNxA1QDs2Kvu+W6lQ9S4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N1N4eH674oexPKWMEVcZxv+SyD9bvJ4WHGdPIdtTmRSfP8tS7yvZtZu9VzHx/kkwr
	 B2/d/M4boGYKHzMJiIGWCOotH/0KFCjKX9HaNNOpuK4TtNMuE9+CkINb5JEessd8T+
	 JigYL/N1LO4my54N39sVoT+f9IRMM3pDMrdAJdFEoFVpn4LYrCqUNOhjZ8c6KMIF9w
	 CVVKtesvMT/BvowCvxQYjyrCSHzqvRW+ZLMtllZyluwyx/NqmGAtzCfWZlz3y5QhOl
	 g1Oos2IqdXUEp6MTxwoLFjJugk7MffcUX7+nuzEqOZfV53EpAyfNW5BLH9gV5XMQ3I
	 4megHLtDHnmFw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CBA517E0CA9;
	Fri, 17 Apr 2026 11:25:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:09 +0300
Subject: [PATCH 35/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-orangepi-5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-35-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B6 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..2fb1362ee15c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -181,6 +181,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -381,6 +384,12 @@ &pd_npu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

