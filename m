Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309545;
	b=Wzq9MqCITxA6+cHYSW09SKEiz2eTizSzwPhR5HlZsETUoC3i+V9tpbzZkEKD8zg1kveY
	 TcuVxvglc2hirjJvlOTS6OHvnhCcy2k+FmlixuQnMLkwtV9Cjf8mDy3805LEkRSZEsLNg
	 dU1COzaxfBHTgnd/Uxr1M3szYVpT2f1T9W7l3ULBYK4dI7Io7RDrtc8tD0DmgeiVQ1vZI
	 6O9ddl6Yo7pxs3DVDZwXMiqwfdULo+rFhmjs+4c+EEFBLROjh6HcItQHdg1NElznrkCrE
	 27jSLYN/kvptRkdIU4KwTfvKN8uRt6EWGB7au480URj225M7cHF9tLdTDsu9R2DPAVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309545;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jWEukR3PKqbO6EjG77oCSrWC3B9Aoel/x6Z2UOTxDIw=;
	b=svNjF2Axxt+mRwYLGIjWtcwXMMeesblCEigL98MOmNm3Igx4wffvZLiAq3EtXFjqW0uC
	 WVzyj23VaDrh8JrhIc8uLxF+KxmGMXTXkvzRMwiYKHvi0uFbPmz06oQ5kbZIcK5CN65RP
	 +hdNw4Fs66HbxNhQwNF6iITIml/AgnN2aGBhawabby/2ct/CatkStDOz2qvMtR4Xh/Bb6
	 opzFaHyEzPJnF4OminguTAUOnEyVhXrC+ALfIzujNTYL9GIeZ/6E5OyCL4JlzvjmCXfer
	 AIh6OoaLNnXUgnBbJjOvGv+M7j4FCDt3IO66U0/jMH335OvMM/XNI+gO6hlQuv8eelw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4wr6lZT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ADD606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4wr6lZT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6248C1F01816;
	Thu, 29 Oct 2026 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793309544;
	bh=jWEukR3PKqbO6EjG77oCSrWC3B9Aoel/x6Z2UOTxDIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E4wr6lZTcWnPzkVhyFrtZc1Fp9NSceJrRD0zgtEr4eTfu8aGCv+iUVzmy6naU0gdP
	 2BJCVv3FATm8kGSJMp4BLj5c1kBAd0BKOfr9bN0qOBVpDJ/LJhSqY0RJNIHpJVziRw
	 yqjfaJzh/ipLhVrTp4Uvv0iS5lyT0nvUuWlvzDoj0jmee3uEgdqZ1UUFlZoxmdmnD0
	 g/2pMDigTlKNUjLC6yne5lKKu1dWJri3vP89r/MdnrgiZu0kJPg73xuk//sPpBeXIH
	 HWm0ojkHzEo7Y75KPRQX8TYrEjZNF9bS+5lcXAbKUJaIVFeCy9ss0Gy4VRdPOMa4Lk
	 Y2dbc23dR/Ymg==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: stratix10: define the i2c1 pins for pinctrl
Date: Thu, 29 Oct 2026 16:32:01 -0500
Message-ID: <20261029213201.718625-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261029213201.718625-1-dinguyen@kernel.org>
References: <20261029213201.718625-1-dinguyen@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the I2C pins definition to the Stratix10 SoCDK NAND and eMMC daughter
cards. This allows the I2C driver to use pinctrl on the pins to perform
I2C recovery.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 .../altera/socfpga_stratix10_socdk_emmc.dts   | 20 +++++++++++++++++++
 .../altera/socfpga_stratix10_socdk_nand.dts   | 20 +++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
index bda2fe059beba..c63af8fa0917a 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
@@ -12,6 +12,22 @@ / {
 			"altr,socfpga-stratix10";
 };
 
+&pinctrl0 {
+	i2c1_pmx_func: i2c1-pmx-func-pins {
+		pinctrl-single,pins = <
+			0x78   0x4   /* I2C1_SDA (IO6) PIN30SEL) */
+			0x7c   0x4   /* I2C1_SCL (IO7) PIN31SEL */
+		>;
+	};
+
+	i2c1_pmx_func_gpio: i2c1-pmx-func-gpio-pins {
+		pinctrl-single,pins = <
+			0x78   0x8   /* I2C1_SDA (IO6) PIN30SEL) */
+			0x7c   0x8   /* I2C1_SCL (IO7) PIN31SEL */
+		>;
+	};
+};
+
 &gmac2 {
 	status = "okay";
 	/* PHY delays is configured via skew properties */
@@ -57,6 +73,10 @@ &i2c1 {
 	i2c-sda-falling-time-ns = <890>;  /* hcnt */
 	i2c-scl-falling-time-ns = <890>;  /* lcnt */
 
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c1_pmx_func>;
+	pinctrl-1 = <&i2c1_pmx_func_gpio>;
+
 	adc@14 {
 		compatible = "lltc,ltc2497";
 		reg = <0x14>;
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
index a450c42a6b35f..f69ec2f5b94b6 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
@@ -56,6 +56,22 @@ &gpio1 {
 	status = "okay";
 };
 
+&pinctrl0 {
+	i2c1_pmx_func: i2c1-pmx-func-pins {
+		pinctrl-single,pins = <
+			0x78   0x4   /* I2C1_SDA (IO6) PIN30SEL) */
+			0x7c   0x4   /* I2C1_SCL (IO7) PIN31SEL */
+		>;
+	};
+
+	i2c1_pmx_func_gpio: i2c1-pmx-func-gpio-pins {
+		pinctrl-single,pins = <
+			0x78   0x8   /* I2C1_SDA (IO6) PIN30SEL) */
+			0x1c   0x8   /* I2C1_SCL (IO7) PIN31SEL */
+		>;
+	};
+};
+
 &gmac2 {
 	status = "okay";
 	phy-mode = "rgmii";
@@ -130,6 +146,10 @@ &i2c1 {
 	i2c-sda-falling-time-ns = <890>;  /* hcnt */
 	i2c-scl-falling-time-ns = <890>;  /* lcnt */
 
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c1_pmx_func>;
+	pinctrl-1 = <&i2c1_pmx_func_gpio>;
+
 	adc@14 {
 		compatible = "lltc,ltc2497";
 		reg = <0x14>;
-- 
2.42.0.411.g813d9a9188

