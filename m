Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367989;
	b=lycY7aEQ6Et/47bhxb1RqNV/NcibLs1sKxo7rGDbmaI7JCxjCsx1M230zIj5DgVGeYqt
	 y4ZsLV5kmLgUlhvEj8JWxSGVn5GYhnJ0jDaSDSIHWONt82e1WkKkOzqENrbv0oOqYxZ+A
	 RFsN7prJ+OEF47RaNs3kGvBDlpzbWCL7pau+8zVriA6SxNLfLQa7x9pXb8q5UB2gVE/6A
	 xZ8GfsAnbhEddYcKUmsTIjqnxPSDWNlogpn3Ykt9pNrvdTnD4uRZlFGP/jMUIZ0dIJy7P
	 L+sW9eJc3xBZZGt90rSF9A7Pi9uQdky5Tbs/WOHJ3XJqYjjkJSfr7LP+ucedrUga2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367989;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QHSm4db2SlPaNtSU+7xYvDAThcu6VcPl6213mSjo+4Q=;
	b=oxVsfiFJktdcVaBNpA/tk9Y2OG8HanV8Xh5EJ4b2GwYf9rLv1L4lEhx8a+tRZsqUpNeh
	 dOtx3pE9eFxMKKgePn9WqHeUngvUvxF0bO+6oQ0tR9dxq4r5BmrvLrzv/WEmr+5qCXDfv
	 mLR/hxKTZvE5FQs7AeAIchCQJt/I/X/jG9ZJP0CsZjJNEj0hfKVmLfymEiviyLzLERsV/
	 O/Ze/ng7yylivV35kQUHe5pwnuJk2vy9u+EABeUjnEyLzz1FduI9GOi89NP7DU+HMmUnd
	 cFxi13fVoahyO0utmn866HoJE+BfdldcFrr4ftj/8UtMQ5hOd1QDtQVLckfVNcoSIXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=lmjnV4vT;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5E6606A332;
	Sun, 22 Nov 2026 17:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB5E6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=lmjnV4vT
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 033A6270BC;
	Sun, 22 Nov 2026 18:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795367980;
	bh=QHSm4db2SlPaNtSU+7xYvDAThcu6VcPl6213mSjo+4Q=; h=From:To:Subject;
	b=lmjnV4vTqfuqYvJWlYIRfcMM2+htrhFRHSqErruwLNPxFM3IgAoRHRA9zfimm4GSt
	 JDzt8pOMiF+qzLuuw48YswIaHnKJftXt3X0MKm4M24+NlHJYOhzk55UsvKqSAgWuwl
	 0eW39aS3PNl7CRuaBobmX8n4ZXWs8LXNfII8vqZODOQ5GZBR5G+LktrzyxLnxz9L5s
	 eiatNmqpPwJH9oBIIAhDGNaqIrOKmtUhsrVpfU+RqvPbrpdHNe8Qua4tJScqd6rDb0
	 k1AdCuQh5lHop0+9PY1SoIoYqaw7HF9y5xvTN6MWRhFS1NP/Y6q3VlsXQQReRvhDt4
	 FxvMjMNTM8MFw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix SDIO_B definition
Date: Sun, 22 Nov 2026 18:19:29 +0100
Message-ID: <20261122171931.295307-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122171931.295307-1-francesco@dolcini.it>
References: <20261122171931.295307-1-francesco@dolcini.it>
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

On the OSM Development Board, SDIO_B goes to the M.2 Key E slot for a
Wi-Fi/Bluetooth module. The slot has no card detect signal and M.2
modules are not hot-pluggable. The slot supply is not software
controlled, so the module stays powered in suspend. The SDIO_B signals
are fixed at 1.8V, supplied by the on-module +V1.8 rail.

Describe the slot as non-removable, keep the module powered in suspend,
and add the fixed 1.8V I/O supply. Without this, the empty slot is
polled every second.

Fixes: 39be5a7e3ecc ("arm64: dts: freescale: Add Toradex OSM iMX95")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts | 3 +++
 arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
index 24cc6d4d917a..bbb2010eecfe 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
@@ -401,5 +401,8 @@ &usdhc2 {
 
 /* OSM SDIO_B */
 &usdhc3 {
+	keep-power-in-suspend;
+	non-removable;
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
index dc2ef7035246..ff44e8c71bf6 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm.dtsi
@@ -669,6 +669,7 @@ &usdhc3 {
 	pinctrl-1 = <&pinctrl_sdio_b>;
 	pinctrl-2 = <&pinctrl_sdio_b_200mhz>;
 	disable-wp;
+	vqmmc-supply = <&reg_1p8v>;
 };
 
 &wdog3 {
-- 
2.47.3

