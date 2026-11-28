Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850659;
	b=p6l+vthOx3ZjLHM8zu1CPmYPoaFgLkaqApOmPBrpKlcG5pbAjoMFM88poCVmuQmftlJ5
	 yIDfKR9MxkTnvXkCH/ILLAZs1+X7ZdwuFkrrQrVsTRQeliUa47v37u792OkhMR09kC/wV
	 25NKZ9h1qzIr/3+ervoZg53kZijQQlTBu8aBTevs2GjcOCVVDXEFpK89m66k+HAz6gVoL
	 okwLxFwf0WMLgpwlPNDq/Rg1o/XCZ98aZHRDFfK0VbmisCfqAqZ8XzZLenKPiVJiKn2Mm
	 WwubpgJtarEEl5rJuF2W+TGEPgezsG2/Xr20au2lJ02nYdHcIRuZ6Gyg2RFoPUY9PgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850659;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=zLTWZrd18DJhGTlm69yEnTbXZkELX/N8G/HpYWhaGRc=;
	b=Y4jEwIMACs1jeHRKHeAmEDUbIOPEgmOy48dZ0tuXrNP65p7OpTx723DoOhDtZnFpASuc
	 PDZBmrBhAmalY2e3ZYMN+DPkgzUpPHzzn0u36gtX2K5WC0h0GY5kcBmnx7nlPHUIxG2pQ
	 mfaGdknybkXFR6j401M8M51ZFQON6R3f1TA6GPCIPr1lHNlUFAOoFGaty4fCY17AMvPCL
	 xu0c8m0C13V6LcKCg/bXle8NFTwgPrdRKc71zIwfS32FVsO+eaF6Wa+DlFyJZT4+aZxC8
	 L6AKlNThvRnFNiQ+yhYAq4XRALpH2ttGxcxLPpMTCTieD/8U+itZhGe8UpGaA2uz07g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=um8MT+Uc;
	arc=none smtp.remote-ip=91.218.175.159
Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA392606A323
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA392606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=um8MT+Uc
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iSzPfXWqmMeqX2+D3Yjz/92IHrz+RDwSdQT4DO8MXEY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850656; v=1; x=1796455456;
 b=um8MT+Uc0rqTnNJthh03I8rupr7isiBkBMmgyGcm9VIzGZjhpkcyFT7NqcM2d2zFqsoV/1LN
 RulY3MvJ+0suRRRggtMb5bTCCwiTsUSrQBZFkpuhHyF9YCkeV6qFtoGDFYbYfs7tLeqqcaE25td
 Y7fWSU9tJQLMRpIR9TXnd8nU=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ecb3752467dbd51b;
	Sat, 28 Nov 2026 07:24:16 +0000
X-Mizu-Trace-ID: ecb3752467dbd51b
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:47 +0800
Subject: [PATCH 2/9] arm64: dts: imx8mp-skov: Correct PMIC interrupt type
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-pca945-int-v1-2-f3fe2beb2b51@nxp.com>
References: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
In-Reply-To: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Maud Spierings <maudspierings@gocontroll.com>, Joy Zou <joy.zou@nxp.com>, 
 Joseph Guo <qijian.guo@nxp.com>, Francesco Valla <francesco@valla.it>, 
 Steven Yang <steven.yang@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
 Fabian Pflug <f.pflug@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

The IRQ_B pin of the PCA9450 PMIC is an active-low open-drain output.
It is pulled low when an unmasked interrupt status bit changes and is
released high only after the processor reads the INT1 register, so the
interrupt must be described as level-low instead of edge-triggered.

This matches the IRQF_TRIGGER_LOW flag requested by the pca9450 driver
since commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type").

Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 27ecdc06e679..bae304a712b1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -253,7 +253,7 @@ pmic@25 {
 		reg = <0x25>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
-		interrupts-extended = <&gpio1 3 IRQ_TYPE_EDGE_RISING>;
+		interrupts-extended = <&gpio1 3 IRQ_TYPE_LEVEL_LOW>;
 		inl1-supply = <&reg_5v_p>;
 		inb13-supply = <&reg_5v_p>;
 		inb26-supply = <&reg_5v_p>;

-- 
2.56.0

