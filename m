Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9E3CF67A;
	Fri, 17 Apr 2026 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417931; cv=none; b=DurmxeK8VBMF77/IKV0T2G43HQ4z5PgjhVsBo8rHerhszudXX32dg+1bISdRSvUK1iTqUG8Hzkx1TD9kPc3syKB+DHbKvNPkT2UzhW4B7DZwRinx80w0it3jmLg2KTJ6mgMGKcOC0m4gU9IsLfKYr2WlRRu8bakoalQsn4W9aJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417931; c=relaxed/simple;
	bh=Z95797xqJopjC1U4EF9RsvWzRebhi3RZXrEtV2+buw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6GJSAcvY4OtvKZkvyik8D9qnoVO6woGLtS4Bu6zyx/3sv1iuEIoK7M3CqI/2i58uavh5SY1RYnHZVVI3HVxE9N5SrliyDhnnHEs4Y3YVHgKa2DjV9wYXrF+KZ2npKerou+4q8vUgw+i9pBpPPgTLXmnjPugeC7cDbPAriXI+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UYKm4YAC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UYKm4YAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417928;
	bh=Z95797xqJopjC1U4EF9RsvWzRebhi3RZXrEtV2+buw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UYKm4YACgu6JJ6FzPoszbO5Wgrr57goy2YnjLX2YojFj0gKotZ72f2RcXPVsHFrZm
	 93s+H9gn2eMt3Cz33L5RPoA36QN+nBfOiZv6jlat058nQe2fxKHDKhHTBXOQPPGEKq
	 UKDWOJH963awPMOFnDwVQpgywTdFwhPXLjD/zNBbc7QxN9jXQj8CKU6+d7EH7i+X1E
	 gJ9WUBApDMiM44LKjMpGbAXUDjqNuohhtJo06Gs0ZdIjjFTv0RIP2FoOWVseyqEkOk
	 au77vc8vJZU3xcbDHmove5WhElJh5JbJclMynfth72GJcSJt2I6XtT/wH8aDzjoX98
	 nGPHtJo/hOvcw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DDD217E127F;
	Fri, 17 Apr 2026 11:25:28 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:59 +0300
Subject: [PATCH 25/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-roc-rt
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-25-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B0 and GPIO4_B1 lines to control the voltage
bias on the data lines for the HDMI0 and HDMI1 ports.  These lines must
be asserted when operating in HDMI 2.1 FRL mode and deasserted for HDMI
1.4/2.0 TMDS mode.

Wire up both HDMI ports to their respective GPIO lines using the
frl-enable-gpios property to allow adjusting the bias when transitioning
between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
index 2d6fed2a84a3..f2ab82b2ab6a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
@@ -325,6 +325,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -345,6 +348,9 @@ &hdmi0_sound {
 };
 
 &hdmi1 {
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -583,6 +589,16 @@ led_pins: led-pins {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

