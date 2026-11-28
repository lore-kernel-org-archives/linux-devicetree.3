Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850690;
	b=u8O3kwsif6hJ18/I7PDmoY+6du8Ec81r7ohcVHeUsIU0mbTyNE0FDZWEeff/waJ3ZF6m
	 QhvPieZo/hmciYs0GGrfzf4kSMMle6oRf2poeMvQoN3RrLVxmhZ8aZxSd7FFZ7jGTl+Bu
	 MUEjrTtxv12v3XBd3+22YUA9VX8AYVvfhE6xewC0EDyGbIyG8N1sPKEr4wVnEMQUluHSP
	 cv/RM6W3wrKlYT9gV2iAmVQeqyvNtiNOEu1M12OsMQaCt+ZJB3yXxkguQHebOBuic154E
	 sEG3zSJGfhUykyE42YVXL3rwbHXhYtwWXG2ciMUJaZf6XQvdDAN9UO3OozdtYCXfr2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850690;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=m9fa2exuhZJnSV10yjznSXcpf3pZyPVUg4CzTIKbXCA=;
	b=zN7hFcSIFo1UdhikhsBs4LYFhKRob1bECnCRXfhl7NnOsPgr8o18pFafyP/OnwRigl3S
	 122Y7NCjhW0MOGb08Kdq1b366Ib2efkR3Y/ot6XnOnokq2C3TcX2qdQxznYpvyDIB/Bdu
	 jY/U6ybZzGC8jpxcsTOwRcuNQneXfbtDzn1WDXv4lhPO5h2ZzzVqbecqxaSsgmA9WuDXl
	 8KNWugUAtTfPYBCNy/rWEKRIzKoDsTmr/I6rAB0iQDieHwRK8XMZ7xOzVlmekpQRyu4qd
	 hYHukN7tIJ9QDz+582nbXquX/UVT6cld3JKZBK05TxOpAGdxsXKZm2va3OY/viTCknQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HxixjfgN;
	arc=none smtp.remote-ip=95.215.58.41
Received: from mta1.migadu.com (out-41.mta1.migadu.com [95.215.58.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15CC606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HxixjfgN
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4izvpiXaUinTD/T9W7e+P6mbpAwZ12sSjFVOLJZRREI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850687; v=1; x=1796455487;
 b=HxixjfgNK1XmHLdBj8abDpY+pAUfqNRRd8gE6ldoJQpfaO3luL8z6nUwcCaqfF0pEA4L9fSM
 BfcxAMa8mDncuLSPYUd47o0Og/H26wTwDa5WYrKTtypVUPZGMq7MDA63i6FTa/KZkf/1iZUejbJ
 Lb+ZcBkwRu+9IwK4K9MFccr8=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0bb40b1e9401e879;
	Sat, 28 Nov 2026 07:24:47 +0000
X-Mizu-Trace-ID: 0bb40b1e9401e879
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:50 +0800
Subject: [PATCH 5/9] arm64: dts: imx91-11x11-frdm: Correct PMIC interrupt
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
Message-Id: <20261128-pca945-int-v1-5-f3fe2beb2b51@nxp.com>
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

Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
index 6144fa6f3706..a062cbf6824c 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
@@ -319,7 +319,7 @@ pcal6524: gpio@22 {
 	pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&pcal6524>;
 		bootph-pre-ram;
 		bootph-some-ram;

-- 
2.56.0

