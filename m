Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404E3B9DA6;
	Fri, 17 Apr 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417918; cv=none; b=ivW+S3uOL/udDnAvzKr5ELgaU3+/jHzyW8TNXtfzQWEKwFhASex6cfwB2koyULVitmadrU83cReL3b3NwUFCLWukVq/6i+dMcva9hacwyVyuN4UXPZa2OUhBK/2I7rQmu33ybDjNxxjhYbpr3TgEIeIxfc91E6AlXbshXMOP2qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417918; c=relaxed/simple;
	bh=Bliv9OjduCor2p5Z6Xh83r8uB9R/edJ8ADNSUs4Y1Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PAdixfsfRyNpeyLRg0dzgX6W9HRRpqhjR4mw1dN58X3fO93CjwuVZSnlp4VHBL4sLTf+lnk51AZnKwEw8qxmJKc5zqRa7TCLlcPmxsmUWVgYV0kxvyqZpxbuYYkt3KUj67moGWHYbtlK/DoDMoDdGBUyAqtzEqLgL/lLBaJFv+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NWcokwwn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NWcokwwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417916;
	bh=Bliv9OjduCor2p5Z6Xh83r8uB9R/edJ8ADNSUs4Y1Ss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NWcokwwn0yjsPnBYGMr8BNzWGjx1+08UdvGRXw1wMyk1N0m2nsyxktihszT3vEV+k
	 zj9Q0vLaFRTAMScMaKx4h2nstaJcbeIgauZEcik0KwjEm4NoxZeS/oLr3FAFCP81Pd
	 0Yi2JzzH4jbEV7C7KiVonLOoyyOIRombjgPxPE4rlKMx8owKSQ6YCS/8p9kRFDvnHU
	 jfmy/jaAymCL2YHKIM60xHAojiL2DzG/AxpUVQ9EvilNer241k9gCUZoan68/Mj3Qc
	 Tpq6plv13jMMlgi/cSVAdmuD1NWrat1kNbbYG6xtTFyUNvXFZIUZ9O8BrlLQ3/fKar
	 ngAtCpC7zZShw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F379F17E127F;
	Fri, 17 Apr 2026 11:25:15 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:44 +0300
Subject: [PATCH 10/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-armsom-sige7
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-10-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B1 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index 39197ee19837..3e64d573bb89 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -177,6 +177,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -347,6 +350,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

