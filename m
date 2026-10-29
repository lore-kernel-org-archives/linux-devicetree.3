Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309544;
	b=OUr4VFHMY8X/mbq5Y/Ceh3LLXu6X7gMn1ZqHm1nEWEKFHMmvtEl3XvJwmIQx95PuDHCF
	 c9n9AX7wijC/w5gX8yy6guBfBN6z+3IMEVSPZdzEHkeAV5gbesMv8BdxCkFWCQpyvOLSv
	 Y7C9VeniN6lEjmMu/wrIbe1VVlAAPW7hAQMMnHuO8xWlfIEGaBsl47kyHSecLravGcfss
	 Bn2BzcdXyO4tWpOiztU3LZGvJYCBkn8yTk1xUj6TpcP1gk//i5cluzaSAkj02d+QOneGn
	 bc6PDrbPPztWbPcwwjERuVY0Z5gWcdiU9ZOYqxTuN43AXlaUbsLmDq3zL/rMntZo3Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309544;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6h5Z0pmpZmadH2xXHKdbXgxhuaXKIuJvu1pxPeN27ko=;
	b=HkhiuvFbDSZDyjt2agvOgm3xfaICRqbIfV+aJmgSvvughIh2dJwEBZmzfMvTvJQz/K2S
	 GOwvuJIbwJ+czo/MOdcn8i2IGppRY5aZss2Nc7ayHYSgwx2xOhSp+U2PJ+zd3BIxkwREm
	 IAXpU9vjAGPanXt95zmxBrIaAvOmkzafzgXAeUnXGvhOi6txmh0lcu869DMcFYE3TEt+D
	 vuTWHp8p14vfxqGWKkdofWB4xxTsfOVB64fXJKJXKDdxO9mLaA9kf1zLYKDXo2tNgZAwe
	 5YtzJTNec9TWlQcnIXAzSAl0+QC8g7ih8KSJ2hKG5NXemAIRKZK9nlXjn5eRWVQ/CNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRpj2Qwy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B1606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRpj2Qwy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D2D1F01824;
	Thu, 29 Oct 2026 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793309544;
	bh=6h5Z0pmpZmadH2xXHKdbXgxhuaXKIuJvu1pxPeN27ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GRpj2QwyqRDVRE9hoA4pgZUDuDB3Prwab8pPYG3dDlD3c/cvKU2wfrdTyD7mDpKLV
	 Qup/NYif/6qZZKHvV9MUc5qKBHTH0zY6yMFgmCvi0o0cGG+drnZIFnwyl859cqblM5
	 4EFW22lp4vA+Fqrdtfry1hiMaIUtis+oxc29ul2xHyfbMlpwbyW2Nf+Xhdn0GgdQYr
	 JiGHLqhpDPdzK+r9dF37i8ganXwwTxgnoO3vonZU3MMHEVI+pk/KzR8czB/yDWmJLy
	 1zDd5eYFYVoSg3vqmdIggSX7ZV74GznT7T258SqnpYQwm6SbILFIS8OrMCB18NpP0f
	 uZtuF4h87AQcg==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: agilex5: define the i2c0 pins for pinctrl
Date: Thu, 29 Oct 2026 16:32:00 -0500
Message-ID: <20261029213201.718625-2-dinguyen@kernel.org>
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

Add the I2C pins definition to the Agilex5 SoCDK NAND daughter card. This
allows the I2C driver to use pinctrl on the pins to perform I2C recovery.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 .../dts/altera/socfpga_agilex5_socdk_nand.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
index 81443096cf991..346a4ee22f95b 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
@@ -39,6 +39,22 @@ memory@80000000 {
 	};
 };
 
+&pinctrl0 {
+	i2c0_pmx_func: i2c0-pmx-func-pins {
+		pinctrl-single,pins = <
+			0x10   0x4   /* I2C0_SDA (IOA4) PIN4SEL) */
+			0x14   0x4   /* I2C0_SCL (IOA5) PIN5SEL */
+		>;
+	};
+
+	i2c0_pmx_func_gpio: i2c0-pmx-func-gpio-pins {
+		pinctrl-single,pins = <
+			0x10   0x8   /* I2C0_SDA (IOA4) PIN4SEL) */
+			0x14   0x8   /* I2C0_SCL (IOA5) PIN5SEL */
+		>;
+	};
+};
+
 &gmac0 {
 	status = "okay";
 	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
@@ -66,6 +82,10 @@ &gpio1 {
 
 &i2c0 {
 	status = "okay";
+
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c0_pmx_func>;
+	pinctrl-1 = <&i2c0_pmx_func_gpio>;
 };
 
 &i3c0 {
-- 
2.42.0.411.g813d9a9188

