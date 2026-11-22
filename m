Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367989;
	b=oljSF9Y5dsZLAFpyoboMrITQK5Aj4bzsuTQ+3V6uq6HCUnCK0bTlFA30INVFr5LYu4dj
	 5HFmPzmH2qcnijlQsM5sHpnGvq3J/4KWPbWQA1B1gn+qnVdFN8T0rSHZAoN0YY7GlONKq
	 ukGTkEgNgkousBLISQHIIJmvo5uFXY6yFaPLglSx5dFPFrarovnO7gA9wiE8r5MsfCMFp
	 19XeIPuXbBdQ+2mwa1qqRgWSSrRDiH7nH6yydWRRoFRdfN5JDnVW/at3L6mtzgJOtOXa7
	 w0zDgjSDIGtmKpmdq5kYsqA0JmJYvc79Hihkxxxn4YOEtDZfhQz9xo+3LTBz2qbI2Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367989;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=woGd+T14iFaDXtJWDc2tcaqs++Bm20facx5pAtjkDig=;
	b=fzhP2FMn3Xef9vGVgoIxvR+kkcVjtmSoKYpFOv0xeQ0UvkKLor7bACCM/+h5167j31gf
	 0oyHFZsdWbu+XXQROgGeoLso3urApvlh2Sy5gdZSBF5zWQpu5HV9N90n7PDh/y9o5GcCR
	 /i0kIBEzj8T4bBtR5IG468A4CQPqCex/iFWHEUXnhPmKkLZQW7EBVUdcza66xCerRV3oa
	 PD9vYqKu4+zsqN5ympuUKgyum2O+MnpTvi/kfx7rS0PZ3JP2NZj72SJG0BX8+7mrfQqEF
	 U7aIEMYK3e24OSUL1T/VXTSNfOXCxNK/DC/6sANXkVs1Q4f3z6N64nLkJI7E2krAscw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=dmS9OfdF;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB527606A330;
	Sun, 22 Nov 2026 17:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB527606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=dmS9OfdF
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4894E270BA;
	Sun, 22 Nov 2026 18:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795367979;
	bh=woGd+T14iFaDXtJWDc2tcaqs++Bm20facx5pAtjkDig=; h=From:To:Subject;
	b=dmS9OfdFg0a5UHzCXkfkYZwE2wiK9MjJeWob9RtMcaX/7D05PTUPCvL6AButrnBpy
	 50sgkGX8L9tDhZXv9FUDqn8NFtnk3zlQHnWkEV9P4nlhZ3Hfpobvr42tYX0ywYtVdw
	 ghtMmnh2whRRwn10/AwzeUEvAaluQK+CnR9xvzAgQdbVhBtD/DlzWnFTgE+Y2mCilD
	 QOKVLu2lem4/jXmp8v3JC3X1TMxZEtqPh8V5cPf0scWpIOKSKOLAOFoIQi9jB4X6hR
	 KrUswsSLmg0/GTdi24EY4aCoAupLpkyIAxsbeOu9pfoV9j4pHLWToT34blyD49/5WX
	 OD+UqVAxc3ESQ==
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
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B definition
Date: Sun, 22 Nov 2026 18:19:28 +0100
Message-ID: <20261122171931.295307-2-francesco@dolcini.it>
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

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi     | 1 +
 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
index f6fd64176893..d273f4bfb96b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-common.dtsi
@@ -517,6 +517,7 @@ &usdhc3 {
 	pinctrl-1 = <&pinctrl_sdio_b>;
 	pinctrl-2 = <&pinctrl_sdio_b>;
 	disable-wp;
+	vqmmc-supply = <&reg_1v8>;
 };
 
 &wdog3 {
diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 61a0f49f198b..41bc471329eb 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -316,5 +316,8 @@ &usdhc2 {
 
 /* OSM SDIO_B */
 &usdhc3 {
+	keep-power-in-suspend;
+	non-removable;
+
 	status = "okay";
 };
-- 
2.47.3

