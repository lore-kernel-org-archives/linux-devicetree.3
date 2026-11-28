Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850680;
	b=fxpGat6y+Zy7sc+Q+AnFhjWDpaNNrmevVRu8akNAZ/eMv1TITuP2Wy+s5N2HNnEw47kj
	 wHSwscGxuxDtU06frhlJQ2Qe4iCTH2tzvU7ZH8cL0dobEhAeWze1gI59ubg/81NnfVt4R
	 eMjmJaD3kov44036pLLaOEtMK9X91Jm9cPis9HFCPNkPB19JOP7P4YEJ+TetoIOQXUP4F
	 jxnHYj70wOA/jjoa1ZW4qS7riNkZe6FPAguanOxUL5dNfR7mfjxpi8iVa2lXwXMW5SFwC
	 qtfu5jJkLiFfFd+0+E4qZT/AL7j0rJMB51CCaWzU2twGx2jrqRl+I96XFy0zjCbiJ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850680;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=3SUtTLC1soRDDz6/4e6GIxm8BK2GH1tVXHrXabtckwc=;
	b=F3ZuVl4yRSnyoPXYciUhYSPYbnPUKHjfgeQXynNtb5BTs7MCzYjdOLYXNE9S/FVorkdx
	 Uz8ftIVCbTv24AHz/ZkNNcKbhOmH0kdVDLHbknoyuzt0iLBF4worPUINFgcowFZy7ecAI
	 nW/715g7DKv5WCI5RPz7xs5M9wHZfaTopPOvOSV+H+t0G4+8TqLsUk+R8z5ai51fckyoa
	 YpoWNCMMz/YMrpBm0wKw2rdHR4eb4PaL6Z/BFaxNGJalMb1KJUs2u64ChC9iJyiRnalMW
	 QnLXoy+ZoTNhVFXXKj9QWZl9nQYWB21GsnPfOxEEvM05k4B3tm8h7gEDM4KpRaiaiKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d2xfElwZ;
	arc=none smtp.remote-ip=91.218.175.167
Received: from mta0.migadu.com (out-167.mta0.migadu.com [91.218.175.167])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB23606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB23606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d2xfElwZ
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SlIIfsBH0x58YJWWrwjSs5tfIKEhQVlucr/vM3GSWRM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850677; v=1; x=1796455477;
 b=d2xfElwZJWVmqQyyP7hhtFaObYD65sI6e8eJUsTlM1DJothuqtkPLM9GU4MkpHwNKHMhRO9x
 YYXFCv/qc0udm8wUlzYvmk0aEofHRX5bZ9JRddoDIQpeNlpOu5uuNgWv3qRlnKuKCM1ybPxC8T/
 /tCpo57LULQBjm7BqtED8Vdo=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e999d6798d851358;
	Sat, 28 Nov 2026 07:24:37 +0000
X-Mizu-Trace-ID: e999d6798d851358
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:49 +0800
Subject: [PATCH 4/9] arm64: dts: imx91-11x11-evk: Correct PMIC interrupt
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
Message-Id: <20261128-pca945-int-v1-4-f3fe2beb2b51@nxp.com>
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

Fixes: 6772c4cffd87 ("arm64: dts: freescale: add i.MX91 11x11 EVK basic support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index d473c0890048..b178e3d4c3fc 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -337,7 +337,7 @@ m2-pcm-level-shifter-hog {
 	pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&pcal6524>;
 
 		regulators {

-- 
2.56.0

