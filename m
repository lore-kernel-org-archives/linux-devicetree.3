Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850668;
	b=R7dosipFukDbMD11IRH2d0+yR6LefBJCLuX9kFupSlIMyVabvGFz7r2fMfmlPKhm2ZaB
	 kjSFnA8nRAZOaomA49U8e854zQztjavPs3L5/KRoG/WKeKajVdFjnNkv7OWCipdmZzdHg
	 qVURbXSSLwOt3x3VjVjBfw20gUqIIh0tKDR5lm4YHHgCWvZgpiY4CNmYJMDtnvedELoBt
	 ybbBT7s76JK5AU6lYUuIXboqxPsy6DSVToLojCCrm7AU38BV/slF08Nq7c4VnAmM4m92W
	 NtrQF5YY+Nq1JHAXlwwRpqLtE/ShTQB02gpXbhnpFJLNlMk1e24zEqpa4sPMKz/QDuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850668;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=aUaqP2SF55Si+vFkyZYV4iUXDbIn8uDcMBRei5iJXLE=;
	b=oWlb+4aybh25GoAmwhpP9UvDHk7TFE4MlUvl6iqFOiQUvruHDMN8u8tYON75LqFIiClP
	 /yZ5BQ6OTIObYCA+ammgb0tvrqWD1ztsdCUrFpjpiGO+gloTYDx9lXtGYoLbBz5HE+y6V
	 JCz9f3oGIBDEnBA4em7ZasJGxgty01uAkI14WYRX9wvuGQ2WWPOfA4OhzoUp77aXZwzHS
	 c+znYucapLydD8g0ayDyyA8a/2SYrlk0nQpZC+zSuoyPuLsfDzedQ18Li39FKq6AmtYFa
	 uk1ILJ2Z6v9t4IphDE1ZLit+ZTSvXMPblr04iUINSv+cMze5Q8eNgcgG9uTTMKZlcfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qHrzGy1X;
	arc=none smtp.remote-ip=91.218.175.163
Received: from mta0.migadu.com (out-163.mta0.migadu.com [91.218.175.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A341606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A341606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qHrzGy1X
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rVKYX39Z6yW1r3iIoDnclL3hTIIXUWWEoMd8DX4hGhQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850665; v=1; x=1796455465;
 b=qHrzGy1XzB+T/YRLF6pEZXonBxu9j+A56huAWqtWf3ejXp0Px+l4QVyr9LHQdQV5Gs4cACDp
 v7EAWGdd75XEpQaiVlR8P/8H495GJeDURfaYngRio2TFcIcpXwfT+nfeEJuyOE+lt+LPumCBw5t
 4CplT59BLoala/eloX1pXBuM=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e39fe85fcfd2c4c8;
	Sat, 28 Nov 2026 07:24:25 +0000
X-Mizu-Trace-ID: e39fe85fcfd2c4c8
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:48 +0800
Subject: [PATCH 3/9] arm64: dts: imx8mp-tx8p-ml81: Correct PMIC interrupt
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
Message-Id: <20261128-pca945-int-v1-3-f3fe2beb2b51@nxp.com>
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

Fixes: bac63d7c5f46 ("arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
index bf49ae942d41..4f5cc73a833b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
@@ -268,7 +268,7 @@ pmic@25 {
 		compatible = "nxp,pca9450c";
 		reg = <0x25>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pinctrl_pmic>;
 		pinctrl-names = "default";
 

-- 
2.56.0

