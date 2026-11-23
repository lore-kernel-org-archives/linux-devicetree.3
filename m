Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433145;
	b=kPYwFQqqA9q5iXC2YSKpKl5SLZFR9W/+GN/4qflPE4LCn+9MX9L3QUED2MTn+DPHqdc1
	 gc3xeu2mOh5aIerymdx4JMB6gGUyL9Rv4vbhxgZeI+uMGGwSL0UmOkNU0+TXx5gHs/PUi
	 1HmZOLIuYUvGU+37PgkqT7angjLPxHhdV8SAPKBKb1C+kt3QXBA3eId/bOiVuEzCor/Ol
	 tHOhe8p5XssPAbfqrypkfWVfAZWuPPG6jlbSZ0BN7vcFUh+ryG7gVfVdbxbh9F0JhGSE4
	 QF1Dvk9b8sYmksqDlFCXlxIEuAb2bqGT9ImruEzYWUoJn8rw76ybz6Au+pwGehcIIjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=;
	b=iGcGAYo8EdS399/hI+Ccg7nyx9WarVvBVKWHNxcY+37ujWNPtw6e/UuCjpB9j7siLLpp
	 Qz82eLeOPdIMGlyp/QLoEC3IIf41TJ4GdWAt0rF3qrVXKVOmUCOtXWxK3Mz09FUd4tMm/
	 k+cN23pizNxkhn/k3BVy0QZkyeizSUGoyRXsfIIlUZjj2YglYGTRTlp7ZmpqRGjyXfFjP
	 E30u1iZsynOdsrr1m76Qk2HjsfmXZp3Gsgm/n5K/o0Tii9duLYW29Yrg227pENu42QV1u
	 QwsD1x6qyXFqrXWl/Wuufp3dTUfezQ0sYtaY+bed/jV1vKVgvsTg42wOYrXQ2XpnKaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yc6dCfrT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50712606A327;
	Mon, 23 Nov 2026 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50712606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yc6dCfrT
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6A7802007BB;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=;
	b=Yc6dCfrTK0bDAynaw5DasLaCruMwWMep52YvHXOSb8rdSd9Y7Dy6oRB2fXJ8tFBOwuK5QY
	BeSOdGX+3EhA93poLKMDrlJI2u6Ly5GJP5QdNTSZ+BQBYpnz4sICMNBAKKDbdsNRTvWv8s
	gcL4R+9qDN2PUz7SMq05Sd5OVmSHSQD8pUwOl9TAQx4nOHyTnRnCc60dnxIpJWfuR1unC9
	c4YzIURMPo74ZbCr8YYk3vDwUXeV0ywotZrsm9c8yi6866Z7NU0WDjMoFxN50GyGfZ3p3/
	1gQrtQY+wJ3oUNGEnW2CqC1g0bl3YhmGSiKH7eGz+P5guBV2kgqTKSj6LLoQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=;
	b=Pz8TWViJ2WDmuPCAiX+m81fDtwn68LxbtUgNs8D8qYGvalF5l/0oRlOgTKU8gcYZFb/GLx
	9Qs8gWtgYHTngjpc7kgNxleznliCyiOCHDs2G6BY4K9sP/+8YjixxIHZdvScmGnuNJYWGZ
	+eIiwFfJ4wkQNUSxG6xErFPjlQa0kI2AGnmf6RGgs5ydTh/3OouqiLkl/NmzdLMC/w7GCB
	p4nDcQCt6epZh7zVHra/5kDc+fbczORVYVyI5EviNDTzCLwZecLu/uWNyrAxm1wg5v1X9O
	G3dcz9xxZGDUZVRn0eFnnYFR8CP+Azp/eWGKvWjak4lLw2oniS08OPGVFcyvoQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=Vk1oo19Qs4zaSzjxCWqLcACwN2olbfH4WCnYxbW/qvDKIXZWjDVGLq9uCLGMB0OpSj+BSW
	cjUaYhgNQU46WSrB4VQ+aAm0XQUKeUOYWwXu7giSQFpejeygNNgiLQfMQY+Zfyu7EButPO
	Fr3WLMjFXohBb6QiSRpidibMqu5b4yshqkDbNeqGJ7V7xvpxHE7iy+4Eqgh4KSaSYvJdcj
	e1iKL+Dv2NmEvxyUN/XdYW0KNW/g+Q0IT62DGBHpyxhiT/aZvoWg+XCg3mAwCNSXkvY7+0
	U5Jzsz19zfrSgpC2PUlVgqCueU3x9VRg/eWa1xm1oKMhkE3yD1dM2ZTMYV5FGw==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB3-0016XI-2h;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:15 +0100
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Enable I2C level shifter
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
Message-Id: <20261123-imx93-frdm-fixes-v2-1-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15.2

Without the PMIC's I2C level translator enabled, probing the GPIO
expander fails with input/output error:

       pca953x 0-0020: failed writing register: -5
       pca953x 0-0020: probe with driver pca953x failed with error -5

So enable it.

The GPIO expander is connected to the level shifted I2C output of the PMIC.

Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 33ed26aafde88..b3dfe516b1d55 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -216,6 +216,7 @@ pmic@25 {
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		nxp,i2c-lt-enable;
 
 		regulators {
 

-- 
2.56.0

