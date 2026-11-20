Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179381;
	b=AC8reVuiKQBRK1QFmxdRRySvH4XUOpqD+lgHl08ATG+qyjma4dUciVR1ArrebdUnpSfe
	 1J2kyH8hsoSOgmW1nbKPH51HDUFjjEsuG7LF+C3PEDbBuIz2d1OtAJ2gHIn+8ieC187Ue
	 ymz46McCO/XOTHyJRX0ea+5hNTc1nTGvVp1nJq/fcpibW/ugDVpKcZRgTBEcSdlopLdj/
	 HHdgSyxPLjHJzWrylg73n3YE59cG8XPx5afpFvurAsNcfQPp6CFtRQ3JxXa3yT/yu7RiK
	 AY7w62QnelgiO0ZhsdzWFo517sy01BLahsMXryk4uIPMtSMe3i5GOKt/+5h8SrJxPYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179381;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=DmIn60Bw6yfoa+kgHyaYUXoyqvtZFdxTT5HNPi8NO+U=;
	b=MnpXz7KQugJ2y+KpkETOU8F1aPrE3lASsESlfxtCxkcjjri4DZvSc5lMeAzFGmw/rcUO
	 SpI+x3Ki9Zk7iq2h7YGA+8YdUhGlG/SW8iVAh8KT8zGH7grxavZGSVBKcABZo/jGIgYNZ
	 AEDtSDk91uBlqdC/6pF+YFCVxYp7/XlBjl/ak8GLy64V9+kckpFA0+o8FlKkZ08MH/HYE
	 0dTjB7MHPi5udvbzAveYppg2GrNkcvybuPhctV+mvLAG1CpeS9ABU+SZJttpQ2QL7W++5
	 QWjH4B0UyCWNsBRWMcL6KvUU8w1fc8B/vhNwRkns93t+9tKnRc5c4vwpJt3BWsZk7EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nnx0aNUo;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0306606A326;
	Fri, 20 Nov 2026 12:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0306606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nnx0aNUo
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 77B794E4168A;
	Fri, 20 Nov 2026 12:56:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40073601B9;
	Fri, 20 Nov 2026 12:56:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DABB711BC0089;
	Fri, 20 Nov 2026 13:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DmIn60Bw6yfoa+kgHyaYUXoyqvtZFdxTT5HNPi8NO+U=;
	b=nnx0aNUoBzznBrc1wZZc8tT8dsAsn3b4mMknXkFVIZ/kaboJDGfvD/cevEPPDr45zyo/+a
	Jo8pcxMnpGtugalkiaBUNilnKH36mSHFyUFY0imI4vDDPPWt3C+6wbEvB18HekBkzUMIv9
	ogtJLpBd0q0q3qKsSWNCe+gkmIdNLxbfPwVo5G6twsp83D+5cYZp2QLjvx8aD6cXN2LQNb
	nFKPwV5s/UO8jTBQwQT/mJIPkdLKavN53N69KhG5PxccSSi9LAU244+rVGHW3InPcHz7EX
	20yDqeFD0vfG+kUPc5HkaT2/KhHIsmcKP1q6XFvHriGB3RF6ye5D9U7VQWfj7g==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 20 Nov 2026 13:55:49 +0100
Subject: [PATCH 1/4] arm64: dts: ti: k3-j7200: Fix QSGMII overlay by adding
 SERDES PHY
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
Message-Id: <20261120-phy-cadence-torrent-ng-v1-1-da2db7125cd7@bootlin.com>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>, 
 Abhash Kumar Jha <a-kumar2@ti.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

From: Chintan Vankar <c-vankar@ti.com>

For CPSW5G QSGMII ports, CPSW assumes SERDES to be configured. Since it
may not be always true, add SERDES phys to guarantee it.

Fixes: 496cdc82e05f ("arm64: dts: ti: k3-j7200: Add overlay to enable CPSW5G ports in QSGMII mode")
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso b/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
index 6432ca08ee8e..4824d53c95bb 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j7200-evm-quad-port-eth-exp.dtso
@@ -32,7 +32,8 @@ &cpsw0_port1 {
 	phy-handle = <&cpsw5g_phy0>;
 	phy-mode = "qsgmii";
 	mac-address = [00 00 00 00 00 00];
-	phys = <&cpsw0_phy_gmii_sel 1>;
+	phys = <&cpsw0_phy_gmii_sel 1>, <&serdes0_qsgmii_link>;
+	phy-names = "mac", "serdes";
 };
 
 &cpsw0_port2 {

-- 
2.56.1

