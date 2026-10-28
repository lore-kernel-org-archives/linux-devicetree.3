Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203160;
	b=G51DLL2puGlz4rpBWP5eTVkVC8V63wDdLbBVWib340X6KiTKQMG9H6XCjwVtfCdfmjUh
	 j+JLDUPx6HmKQ8fLgh6pNhetCpB+vzcUfvsQ+O5lV1+iE+3M7/adTGjO4K9vRRPh3sFwy
	 iZLu2Ssm7z1xQhK+7Xu1rVD3KDQnkwnrImgRqIMUQgDWQ1VoRS51lGknQkK1n/u0HrIga
	 DBCGrQ4yBYoyoyxAbJGidjtA6mnAPTUJwYhOqnXE14iecUBBZVIACQSpWn0i9Pmy4JSaJ
	 c+KsYJ6JN7BO7bNFbqh+BjjpPWfJkVTlJ4pDK0CbE3nhMhFh5lSbkjs1OWZ9uNRjWXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203160;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=MhUn9SLMDvTSo1qywxdO5rcMk1YuaorqfFbsqqRGaZ8=;
	b=TRtfoDXWbDH8AgGZTZmsek1THg5GLgjx6a2bpOeiYCLudyrCTUbBNhaV3TUP1WgUwzK7
	 Amp8KGNDT19cbnhDIu4rmohm/DUZMoER+SXD1LFuxYHMyg0/J6TJw6lu5K/CX/xoHnsxy
	 ojazXCSIO7Ovpewrv4bN3dhvW9DGPlwFPhFHM/nuiRJ8EeIrZcZia1bdxdBPMXNtt9/Fy
	 GxYNmik636XvV4XLXfFTtoUuKUemRQjnfaPEC/GhSUBfo6HQFBXoaMO2is/UtDkqYjFwA
	 pabGB50frE9bHMKLHNCLogTuOw4AkhxI6eQIztxhS0dYxgxpcpMQ8iBcRU5rpGgjf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vJGBdXOm;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742660A2628
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6742660A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vJGBdXOm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 230CE1A137B;
	Wed, 28 Oct 2026 15:59:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB97160769;
	Wed, 28 Oct 2026 15:59:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3861E103290E9;
	Wed, 28 Oct 2026 16:59:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793203156; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MhUn9SLMDvTSo1qywxdO5rcMk1YuaorqfFbsqqRGaZ8=;
	b=vJGBdXOm37kBdRiyQE7zcYoo7+7rB6fwpHTiiYwL4zDSeVjIiM8Gvoij0Ekvr1ZT6fu7MX
	mLeu33Jv/ztW2xdwF3pTynPrgLA92NGRXeKnn1PvDz+KvugigZb8aURpSE9CW3G3U1sXfc
	oyuOsg1bYR2yrbDDJB0JcQlX/j1eYD56n92k9vVSAusgDmg+uokOF7hu6WC1eJ2DiASaq+
	30VLdFwaM8eMmzYk37P43LGz08P5k1+iRd1sNAysXFfHpAYypy5kLq+PVyU823DLQOmV++
	PdTYCqIaSmWiVvecjkM2IuX3aALZyonGBLXeDb83nLoHcV9AIrWyugiUlwxZVA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 28 Oct 2026 16:58:51 +0100
Subject: [PATCH 4/4] MAINTAINERS: add EyeQ5 MSI controller entry
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261028-eyeq5_msi-v1-4-c464752fb55f@bootlin.com>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
In-Reply-To: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the EyeQ5 MSI controller binding document and driver.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3d..737a9fe66a3de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18348,12 +18348,14 @@ M:	Gregory CLEMENT <gregory.clement@bootlin.com>
 M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
 F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq*_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq.c
+F:	drivers/irqchip/irq-eyeq5-msi.c
 F:	drivers/phy/phy-eyeq5-eth.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c

-- 
2.53.0

