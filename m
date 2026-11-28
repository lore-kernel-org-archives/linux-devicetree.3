Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850649;
	b=cIWAzk7XfKTKr1pnTgk7eUp07l/r3caVcnzPOQ87X4wljWwbT4Xtn1nMNVRMhV6LD8FY
	 97h8LegpGm24q7c2rYuKPsCMnnRhKBKdzUogl37ThXQErkgeEoFWL5VL8D9U7SJcKeL6r
	 MNUWTAwrUkbucgEcu4jaPaKKE/C6yaAMP8mM7XFrWNYJ+AiuXgErSGaPLx3aqU8VHh7E9
	 mJhZIuSEUtptGpDPv8iwl1vZaFUtV6x7KZDyV+uCDq9YKByELLqusi3xaMfpRCzcN5i1W
	 A9XMN/xSqtLHHEfW3/+/Ohn+Xydaruya7lZfrVObg83PGliywW2DsRKGamKRiSgBwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850649;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=3dD30kkDq+twXvmPdRGbIYvvHT+vV41N3PnWvxsqQh0=;
	b=0JFZlaYVNlMgg94/u0Sd7aDy4ef8JNsGkyy2pntcnTIt8+cfOULtaoHX2ommdjP/bvDp
	 AFDuN15N4ZcsWOhl/Bw9t5+ilwhvqoyoajiC3ax5WWa6APIzSxiaUpeJU3NpBOSRsPfz2
	 bikFUXRAHVxtaqVP2tzpd677tOUbhqFTmz0G77q/ROfrW1fBoYcUYerawW5hJssjw9kCn
	 36G9+XAl8pVX5vBs6tXkqz8lmVcVW/jySqpV7A/r2eUd2xA1tkURb3nvwgZ4mVGF2Pett
	 QRU5GoqQnTIys/HM5NPFbrkXklKWSsOH55aQhE1yFfxJB+vsGFwJYiCxwduFmGi2a3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EPQlQYgD;
	arc=none smtp.remote-ip=91.218.175.154
Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B6C606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B6C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EPQlQYgD
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eaVBVC8MLtVKTzsFu2ZH4BwVLKqluakkDvqjSBNObiQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850646; v=1; x=1796455446;
 b=EPQlQYgD6Hyo/p6oalXsixk3UyKEk0x7ISyTQtVfL0+3PgHg2wKOqcV9PKQ8SDWKcnWoZ136
 spO9Gt6gsl5IEnhrU8NKWbiDdYsU67bCsMKPUmp2mNvSY9zNwc7umlo1Ki4KFsZlmQRpQKuXMhn
 AHhioTFO7jVv6fvXfvCj9uWA=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 02089df3548f31c9;
	Sat, 28 Nov 2026 07:24:06 +0000
X-Mizu-Trace-ID: 02089df3548f31c9
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:46 +0800
Subject: [PATCH 1/9] arm64: dts: imx8mp-debix-model-a: Correct PMIC
 interrupt type
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
Message-Id: <20261128-pca945-int-v1-1-f3fe2beb2b51@nxp.com>
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

Fixes: c86d350aae68 ("arm64: dts: Add device tree for the Debix Model A Board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 201cf7f5eb0e..e756994f0b68 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -140,7 +140,7 @@ pmic@25 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {

-- 
2.56.0

