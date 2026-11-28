Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850711;
	b=byhPCJPx6r3oo+wdri3e1JGLCKFVslRuz4A+FTLxg9LPubFf5oiI4sygeW1ffQkVm+0V
	 9g+vM7ELbS+tCVcNrySKvDV5tQMekSHOSSyvtCnpM6aHIZs4P8rYtJGUpwdkDkxGxRLTf
	 sYD8sg8mYl14fs9yeiY3PCOqWjL3NKkAcwmfy60aZvFD1nCDyMiPFuTKqeMIuuT2M2OZl
	 jmxo6YP1boasSlG1J6bOPwVpw8Ae8pWPwX4qM/o6edq9v7k2ixDA7tlXsryd5+NvXDDO5
	 DJy+nkj8dQX51OgqBifSDG2Vt/kKHaYykE+WEtZWZX2wxFUXufQG66NCXh99Fdn8Rsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850711;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=LsnlZ0iyv3XS+uA7w6ihOq25N3FOmWPOkw2a2GWEnbI=;
	b=zVCNaxJPSg3NncciqRUxUufc/MieKwMhUCXuU9SfXR0FEQCmwDF3BuwS/kIFZq03Df0a
	 B/w38iFwEVnPCVDsB4JcVpU4qtcU1TKjVpKZHcmg1FghuFU3uTWEm+Es801bIs3e/gT1N
	 7FYILkWL46gvZDbC0x1t+JvouSistM8R2KPq0ehaEOylNE2jYCMPqh/lnoHOVy29gnk5n
	 14HgErOd0HholZJpiuSkyn6y0qdFTjt6TbqkO2Y5YCE3eA8RSejw8huhtKgzLnCOc8Vnd
	 WzLwI3CxcE7FT+e7ZKgCLlOz/KdLwef+H9uBY87jW1jgM+fo1P1U2J7w0n0MnQI+x/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mbs3YO0k;
	arc=none smtp.remote-ip=91.218.175.178
Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F0606A324
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477F0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mbs3YO0k
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R57eshxEcjKbYip9m8NirRQlmxLbqbpe/5gJMQp17mY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850709; v=1; x=1796455509;
 b=mbs3YO0kpPdfSmd0Uuyw9azQfhr23YSW/zURBuxqszmUaS9knALZK4751m8uzamn17oIE3ot
 NcEEuJsM8m2WtMjt3JCoatuK18r2FKWosoZjY/wKhd6nz5ZmmpSpMqVxKjo5LQQIAi3CUgfwmnW
 DdBoSEiNNY4mSwdzrNDe6YX0=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 70c3678ce507cdd9;
	Sat, 28 Nov 2026 07:25:07 +0000
X-Mizu-Trace-ID: 70c3678ce507cdd9
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:52 +0800
Subject: [PATCH 7/9] arm64: dts: imx93-11x11-evk: Correct PMIC interrupt
 type
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
Message-Id: <20261128-pca945-int-v1-7-f3fe2beb2b51@nxp.com>
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

The IRQ_B pin of the PCA9451A PMIC is an active-low open-drain output.
It is pulled low when an unmasked interrupt status bit changes and is
released high only after the processor reads the INT1 register, so the
interrupt must be described as level-low instead of edge-triggered.

This matches the IRQF_TRIGGER_LOW flag requested by the pca9450 driver
since commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type").

Fixes: 54c7a04ea3af ("arm64: dts: imx93-11x11-evk: add pca9451a support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
index 164b5c17bfe1..33022298b9cc 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
@@ -287,7 +287,7 @@ pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {

-- 
2.56.0

