Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37444302FB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417527; cv=none; b=HFgWnpJNpe10RREo6eGdXg+ste89N7RiC87TmSOsJOaqJbGe/gLntAxfs7DFSdpab6NoqDVefxFlJMA7q5J7SYrh+ZKLMoRFTGQzTWkCZ+DCfp4MdclOALz22FwuFdaR55cuvYzEvWg28npFcKf41A8XDgBb5aq3UvyBvTgar0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417527; c=relaxed/simple;
	bh=RXWQ9W5UkGfoACGJL08ahy2X1XzfSAb7VW4LOVyGc1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgU90qby4UCwEtxC6LfYplzYTPIf0Eb8vg9l6fDQnYr8WOb7zXgbzdKCzouXKj4yQDNg1deshM4f8ZlwDY1Ae2dvQsNYNBs/EGKsOta7WnZ7JKyxUqyOvwk0zKAyEWQO9NwvT2YM57nOxvdHGcyBkuSAN2i3G2swqm1DzQF/AEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=WYQRBlrC; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="WYQRBlrC"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4h9qX90GCjzxr6;
	Thu, 30 Jul 2026 15:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1785417512;
	bh=m8mayst51iY72mvdSiqi9wVfJxee1rgOkUeHmMnudiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WYQRBlrCJCEJvAxFrSf4os72LF2WLYnvvctHQNUNWnyJLWhKtNHcjCzC8MlGWZ8f0
	 AqA6ysKoSE2NKa/G0RYdy/FYhMmPgIYbLijriV642uUfiP28FW/eqh9lAwM03m6Gsa
	 Lo2ZgJ3HAXzEisUwGYWmGCMj2/HnRXRrLT78Hu8No6xrLgaD8HtQUuuDDaueUBz8Pt
	 RMmLAbZPRPSD5unkVZHrrbEGd1QLWIAZvfVYxsdgAPlB6kagXPavkGy2sjtJW72ZZw
	 R2j1HO9VygtiLksIRR+LukXL6X4kYSOQuldkqmapFlRSKTzNzbAoSU2dRuXUxcSBfT
	 QJqyDP8tqbCig==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4h9qX80PtxzHyr;
	Thu, 30 Jul 2026 15:18:32 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 30 Jul 2026 15:18:28 +0200
Subject: [PATCH 2/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter
 for RK3588 Jaguar
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-jaguar-can-v1-2-9b566bd785da@cherry.de>
References: <20260730-jaguar-can-v1-0-9b566bd785da@cherry.de>
In-Reply-To: <20260730-jaguar-can-v1-0-9b566bd785da@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

RK3588 Jaguar has a proprietary Mezzanine connector which exposes among
other things CAN1 and CAN2 controllers as well as UART4.

Add support for the CAN1-CAN2-UART4 Mezzanine adapter for RK3588 Jaguar
which exposes two CAN busses (CAN1 and CAN2) and an RS-232 UART, limited
to 250Kbps.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  4 ++++
 .../rockchip/rk3588-jaguar-can1-can2-uart4.dtso    | 27 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     | 10 ++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 761d82b4f4f2a..11c96e06b122a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -307,6 +307,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-wifi.dtb
 rk3588-edgeble-neu6b-wifi-dtbs := rk3588-edgeble-neu6b-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-can1-can2-uart4.dtb
+rk3588-jaguar-can1-can2-uart4-dtbs := rk3588-jaguar.dtb \
+	rk3588-jaguar-can1-can2-uart4.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtb
 rk3588-jaguar-ethernet-switch-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-ethernet-switch.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso
new file mode 100644
index 0000000000000..9dfb81e5d0a0b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Cherry Embedded Solutions GmbH
+ *
+ * Device Tree Overlay for CAN1-CAN2-UART4 adapter for the Mezzanine connector
+ * on RK3588 Jaguar.
+ *
+ * This adapter has two CAN transceivers and one RS232 transceiver.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&can1 {
+	status = "okay";
+};
+
+&can2 {
+	status = "okay";
+};
+
+/* RS232 */
+&uart4 {
+	/* ST3232B only guarantees 250Kbps */
+	max-speed = <250000>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index ed6c1162bd821..0446834e84d5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -201,6 +201,16 @@ &can0 {
 	status = "okay";
 };
 
+&can1 {
+	assigned-clocks = <&cru CLK_CAN1>;
+	assigned-clock-rates = <300000000>;
+};
+
+&can2 {
+	assigned-clocks = <&cru CLK_CAN2>;
+	assigned-clock-rates = <300000000>;
+};
+
 &combphy1_ps {
 	status = "okay";
 };

-- 
2.55.0

