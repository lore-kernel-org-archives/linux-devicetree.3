Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00A3B583D;
	Fri, 17 Apr 2026 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417937; cv=none; b=LGVKON29XzXatZI6oslkDeJj7smvLScdsQ6IqQH0dS2pCcYvN4vmgKTk8eRXn5TSv98VFM7AzvQ4QS+AUpzhC8ItZ+4DYlqfT+d6lHaO3AD0SiL5coZ8L4ceAGPqLD9bxQYNVlTD3fzB6zBATWY/M142yiN5RVCkyotdLyCUSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417937; c=relaxed/simple;
	bh=8BVv2+9i5rVUtWjWzUURXxzhxj6Yejhxy2SGX2/xM+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBjd6HRYNFA1wU5Kdkdxq3nit3p28eNu8LfT0qIKVdHrVh/sSlhImhMI34Meis0oWcOTe/aLjhuBUazx3EXTb+mgyD4aEALscqZeeV4DLff4qs3Qmktr1sQ1uko9+oD0LmMclwyvByZNAR9NML1B3ZpyVq71Q6qlosA4BP5WTDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j/hC1OmQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j/hC1OmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417935;
	bh=8BVv2+9i5rVUtWjWzUURXxzhxj6Yejhxy2SGX2/xM+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j/hC1OmQQJCI3lBkHLNWJ7qAjE2drYECiSsToRbGZMhnloefT7mjs/8C6/UObcgeJ
	 /FtV1U+bEsSQtIv3AqdQ4Y1hG0pasLO8ANN9cPdhx9Mncpvkg61WOkA6/8oQHiq5Hi
	 PEwX7PPyn76Umdc/tJtXOaoobfHuRHiIbysGhK0zY2zJU8bds2K2UBxXLWjSm59fSD
	 cI0siCVg6gh9TFuTbM10TMmAMVEAKJrnRqZFCc+YKN82LHOmR1Hf1RToe5savmAg0c
	 L+vpWLJSHNXRp5f6Jj1Oxza7SMQyWLiyb42FEcBPsdPkACWs5yY19dLIbJ9OTKsEKj
	 6TpnvgYFVyNYQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4C1D17E0F7F;
	Fri, 17 Apr 2026 11:25:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:07 +0300
Subject: [PATCH 33/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-nanopi-r6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-33-a19c0dd8c9f6@collabora.com>
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
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 1b6a59f7cabc..d4560c0d6cd1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -236,6 +236,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -404,6 +407,12 @@ lan2_led_pin: lan2-led-pin {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

