Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850738;
	b=FmVgBXmMPfTxbDjFpyGRBMBh5Bs200lVScfmlnCP0GTF8j++bXUughMBAbG48JMuNAlC
	 mgi/qegqB9kgjTZbGGY/gIy/YW23eh0SVoE7ji/Cc/5fq6tZd9/p7WDgoPj2N6n7/hqYm
	 Y/4tQFXzawE1t/qhr5ob1WMEfoXX7Bn8SurBafNGutSILm25c8ejgKgSNY4wOx0EJJmt2
	 tKQRFSUXZWLAX+Ynz1nHS90JBIYYZauvUDula26WWxlZh1Am1xZhxuWyYcwOTSdHrycSQ
	 mtNL7lcWDrxhNJmKi8Hrv2/Fj/cXp0wwTsD16plFEWCzqfhK3B8sBHVooq7Lq6rvtEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850738;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=thuMnY1Y7FgenakyzsB3yPXKssmGikdQB8INeJ6GvlM=;
	b=ez6AOqGBJbD4tyaJDmqQ/pVgAbm3j/Lobx9TB7f7tx9rCdtoCcWnA122VnbInh/ZeAT7
	 m6R0fmE3HVeAAVOYhdr35q8kgoe926bVCaJJZVD/uWu8BjjZoGl0xUrne8RIOXEhCuxDX
	 iDGGA8nEBpolm9BafL2vnBWbW3VpXhkr9SuRgQk1+sQnyM9Zis0LEhVlubte1FL86Gdt2
	 E4drWs3lf4jIQe2w8PxaC4EwIcpyXhPQiQNHUEdqTrdqxDrv003CtP7eKO3ETsn2zc8c3
	 ZlKIapU+REKXJ9/o4nzGZ3lOR0ucNPmalY1M4UWoIcH0XgsOpT8BXCBISQpH/z23LxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f0HEQfO6;
	arc=none smtp.remote-ip=91.218.175.189
Received: from mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF14606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF14606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f0HEQfO6
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=51hwY1o14oX+MOnxNp+vuJaEJYw2uZkkz/JZQfKTnow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850735; v=1; x=1796455535;
 b=f0HEQfO63KuCgtglHZNC1PaHYXwpbnIZHgBD92UBSsaXdGxKorh/eZeq0H8iMKghZsIYG/8M
 QS16gx+vogft0T4vQlxqPmx54v3q/x/JuErvxWP9MWDv+ZWsSwTpmH/1L2zXDVPBkRCEi8o0BYi
 xPtiGqkl4UDYTxlVtuEyQzpw=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86307319ec90920a;
	Sat, 28 Nov 2026 07:25:33 +0000
X-Mizu-Trace-ID: 86307319ec90920a
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:54 +0800
Subject: [PATCH 9/9] arm64: dts: imx93-14x14-evk: Correct PMIC interrupt
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
Message-Id: <20261128-pca945-int-v1-9-f3fe2beb2b51@nxp.com>
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

The IRQ_B pin of the PCA9452 PMIC is an active-low open-drain output.
It is pulled low when an unmasked interrupt status bit changes and is
released high only after the processor reads the INT1 register, so the
interrupt must be described as level-low instead of edge-triggered.

This matches the IRQF_TRIGGER_LOW flag requested by the pca9450 driver
since commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type").

Fixes: 3fea8d144923 ("arm64: dts: imx93: add pca9452 support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index 1081881028b2..71f04b40e4da 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -341,7 +341,7 @@ pmic@25 {
 		compatible = "nxp,pca9452";
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {

-- 
2.56.0

