Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645D3A0E8F;
	Mon, 27 Apr 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327076; cv=none; b=NA6cBRLN8PCnJJfcOFYN2aNLoCVrIhz3cFrRARyyrdRkun/56666e3HEo7hL74d8M73hGpTOqKXUrz4Ytj1Az1YA9Swlok+XSHi8BfcHxTmROt6XgsYD1u8Rbk9pngNLje+KyK3oGsakAwqM/ckmm+kBr/NQ1RMe/SS3kPjbbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327076; c=relaxed/simple;
	bh=QiwGrdG0SKqA0YcCyJt8BpLcG5qeGatw4PLR1WkcGT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rSiLyIUAIf11SwSZvXlu/Bm5uE9Xh2hv3sC06QhC7vOA9t/ikhBzDX0x1TdJJNrGQj2ZgY77NWanERhMmaZOHq8fJbxVSCgy+fP0KgEjlIj7hnYIZFicIxekoutys1L5ckEKTBbyvowAC1J10Tg9tjuZbOBbWif3A+j55Uo34rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GGPtUx9y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GGPtUx9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327072;
	bh=QiwGrdG0SKqA0YcCyJt8BpLcG5qeGatw4PLR1WkcGT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GGPtUx9yzRPBAYSiwEaXVrq8EE8qf/Hm+hhhbjn3uVaV74DetDpnVZXX31KHcCINt
	 n002Vv2yiwFImGSieymF+AIoliIKnnZt6DQStherNWSsZUzz8+0F0BhfdLTTWHRHeO
	 VUALhbiF7a56vkon7CNrunlTCFDFwwZDcrDcw+JfWXD+00O68XAzHdMlp2NmnDArFl
	 pm6Ym2g5YwsWjoKIeMuKNd3gS5VZ3mypko8rlQi5AwYHNMZk4hbCFSm3FlpKrDP/ml
	 L9RSZxf1wKm736ELM9pw/dcpuJMrVv7mQsIGafKyNYgiemBC5gxpM24arD9QqLP3Fh
	 YyX3Rxh+idk+g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E1A017E1274;
	Mon, 27 Apr 2026 23:57:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:30 +0300
Subject: [PATCH v2 12/13] arm64: dts: rockchip: Add missing pinctrl-names
 to rk3588 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-12-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

Several rk3588 board DTS files override pinctrl-0 for i2c, i2s, pcie,
pwm, sdmmc, spdif, spi and uart nodes without re-specifying
pinctrl-names.  While the property is inherited from the base SoC DTSI,
add it explicitly to the board-level overrides for consistency with
other nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts         | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts            | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts   | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi          | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi    | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts             | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts             | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi           | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi  | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts    | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts          | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts               | 8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts          | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi           | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts      | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi          | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts               | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts           | 2 ++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts         | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi               | 9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts          | 1 +
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi          | 2 ++
 24 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index c4854c0f22e2..1005b15d708a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -788,6 +788,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
index 3bbafdd89ede..faeddcfdeb32 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
@@ -439,6 +439,7 @@ &sdio {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index e05e6b2d5136..37d7b82ad553 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -335,6 +335,7 @@ pcie_wake: pcie-wake {
 
 &pwm6 {
 	pinctrl-0 = <&pwm6m1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
index b07543315f87..33dacaa6af4d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
@@ -143,6 +143,7 @@ &gpu {
 
 &i2c0 {
 	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	vdd_cpu_big0_s0: regulator@42 {
@@ -219,6 +220,7 @@ hym8563: rtc@51 {
 
 &i2c7 {
 	pinctrl-0 = <&i2c7m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	es8316: audio-codec@10 {
@@ -244,6 +246,7 @@ &i2s0_mclk
 		     &i2s0_sclk
 		     &i2s0_sdi0
 		     &i2s0_sdo0>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	i2s0_8ch_p0: port {
@@ -656,5 +659,6 @@ &tsadc {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
index 08920344a4b8..2751f84a4b8b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
@@ -252,6 +252,7 @@ &sdmmc {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 977849bfd509..8969b56f3063 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -510,6 +510,7 @@ &i2s0_mclk
 		     &i2s0_sclk
 		     &i2s0_sdi0
 		     &i2s0_sdo0>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -1386,6 +1387,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
index b7d2cb456148..059ab02411d9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
@@ -921,6 +921,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi
index 4331cdc70f97..d3fb2677a855 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi
@@ -558,5 +558,6 @@ &tsadc {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
index 80e16ea4154c..ecb27b4a29bd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
@@ -443,5 +443,6 @@ regulator-state-mem {
 /* rk3588 preferred debug out */
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
index 6726eeb49255..80ca7e78354c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-icore-3588q.dtsi
@@ -439,5 +439,6 @@ regulator-state-mem {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
index e43afb0c53fb..8dac069f8351 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
@@ -568,11 +568,13 @@ &sata2 {
 /* uart/232/485 */
 &uart0 {
 	pinctrl-0 = <&uart0m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
 &uart1 {
 	pinctrl-0 = <&uart1m1_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 7c2a1e6bcff9..3811f9a73bb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -784,6 +784,7 @@ &u2phy1_otg {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 033db78aff67..41758fe7d368 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -307,6 +307,7 @@ &hdptxphy0 {
 
 &i2c0 {
 	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	fan@18 {
@@ -417,10 +418,12 @@ regulator-state-mem {
 
 &i2c1 {
 	pinctrl-0 = <&i2c1m4_xfer>;
+	pinctrl-names = "default";
 };
 
 &i2c6 {
 	pinctrl-0 = <&i2c6m4_xfer>;
+	pinctrl-names = "default";
 };
 
 &i2c7 {
@@ -439,6 +442,7 @@ eeprom@54 {
 
 &i2c8 {
 	pinctrl-0 = <&i2c8m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	typec-portc@22 {
@@ -1054,18 +1058,21 @@ &u2phy3_host {
 /* Mule-ATtiny debug UART; typically baudrate 9600 */
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
 /* Main debug interface on P20 micro-USB B port and P21 header */
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
 /* RS485 on P19 */
 &uart3 {
 	pinctrl-0 = <&uart3m2_xfer &uart3_rtsn>;
+	pinctrl-names = "default";
 	linux,rs485-enabled-at-boot-time;
 	status = "okay";
 };
@@ -1073,6 +1080,7 @@ &uart3 {
 /* Mule-ATtiny UPDI flashing UART */
 &uart7 {
 	pinctrl-0 = <&uart7m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
index 36a5977d0795..9052e0d5494f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
@@ -185,6 +185,7 @@ rgmii_phy: ethernet-phy@0 {
 
 &pcie2x1l2 {
 	pinctrl-0 = <&pcie2_0_rst>;
+	pinctrl-names = "default";
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
@@ -236,6 +237,7 @@ eth_phy_reset: eth-phy-reset {
 
 &pwm8 {
 	pinctrl-0 = <&pwm8m2_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 3b0903d0e3e2..7495af5bd973 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -579,6 +579,7 @@ rt5616_p0_0: endpoint {
 
 &i2c8 {
 	pinctrl-0 = <&i2c8m2_xfer>;
+	pinctrl-names = "default";
 };
 
 &i2s0_8ch {
@@ -763,6 +764,7 @@ usbc0_int: usbc0-int {
 
 &pwm1 {
 	pinctrl-0 = <&pwm1m1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -1174,6 +1176,7 @@ &tsadc {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 7142938d2971..145986695720 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -351,6 +351,7 @@ &pwm2 {
 
 &pwm3 {
 	pinctrl-0 = <&pwm3m1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -369,6 +370,7 @@ &u2phy1_otg {
 
 &uart9 {
 	pinctrl-0 = <&uart9m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index 3bceee948458..4e9fe872b581 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -822,6 +822,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
index c50217a7b559..02d532c77a26 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
@@ -1059,6 +1059,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index d5c0b01987fc..f9bd30e6cdda 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -894,6 +894,7 @@ spi_flash: flash@0 {
 
 &spdif_tx1 {
 	pinctrl-0 = <&spdif1m2_tx>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -1228,6 +1229,7 @@ &tsadc {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b2ca041b8e8b..13aaf63ad093 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -975,6 +975,7 @@ &tsadc {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index 08b7d477d8db..873fbeb8daa1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -274,6 +274,7 @@ &sdmmc {
 	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	pinctrl-0 = <&sdmmc_bus4 &sdmmc_cmd &sdmmc_clk>;
+	pinctrl-names = "default";
 	sd-uhs-sdr12;
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index ea5c264d1537..139f70e7bbd9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -156,6 +156,7 @@ &hdmi0 {
 
 &i2c1 {
 	pinctrl-0 = <&i2c1m0_xfer>;
+	pinctrl-names = "default";
 };
 
 &i2c1m0_xfer {
@@ -168,6 +169,7 @@ &i2c1m0_xfer {
 
 &i2c2 {
 	pinctrl-0 = <&i2c2m3_xfer>;
+	pinctrl-names = "default";
 };
 
 &i2c2m3_xfer {
@@ -180,10 +182,12 @@ &i2c2m3_xfer {
 
 &i2c3 {
 	pinctrl-0 = <&i2c3m0_xfer>;
+	pinctrl-names = "default";
 };
 
 &i2c4 {
 	pinctrl-0 = <&i2c4m4_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	vdd_npu_s0: regulator@42 {
@@ -205,6 +209,7 @@ regulator-state-mem {
 
 &i2c5 {
 	pinctrl-0 = <&i2c5m1_xfer>;
+	pinctrl-names = "default";
 };
 
 &i2c5m1_xfer {
@@ -302,6 +307,7 @@ &i2c7m0_xfer {
 
 &i2c8 {
 	pinctrl-0 = <&i2c8m2_xfer>;
+	pinctrl-names = "default";
 };
 
 &mdio0 {
@@ -441,6 +447,7 @@ &sdmmc {
 
 &spi0 {
 	pinctrl-0 = <&spi0m1_cs0 &spi0m1_cs1 &spi0m3_pins>;
+	pinctrl-names = "default";
 };
 
 &spi2 {
@@ -771,10 +778,12 @@ &tsadc {
 /* Routed to UART0 on the Q7 connector */
 &uart2 {
 	pinctrl-0 = <&uart2m2_xfer>;
+	pinctrl-names = "default";
 };
 
 /* Mule-ATtiny UPDI */
 &uart4 {
 	pinctrl-0 = <&uart4m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts b/arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts
index 5a428e00ab93..85ac072f64b9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts
@@ -675,6 +675,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index b11d24dcc180..9d5d4cfe0170 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -704,11 +704,13 @@ &tsadc {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
 &uart9 {
 	pinctrl-0 = <&uart9m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 

-- 
2.53.0

