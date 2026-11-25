Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634857;
	b=pgjjWvDat1WeAzAXFLJ1M+X0Z0s35yZ/PxFpXwVaOOp7qPoBxSx+SIcnJ4xyrVhFNCPn
	 /VTORZy3ZoVDDjz2nqpk/3foTFwzz9HfbhD2XH2bgtH5xIoysmp64z3AMUtlegsJiNGdx
	 btWiLFprnh3PlCmedOx77dhTJnPykI+svgf0XbTPsx6Vm3777TZhDUuP9Hrz3kOz+1ozv
	 YJCdrMoemLJrfEdTDa6ckbPsTDyiHmiUe1MHT02bmD/yM4yP4dogdDji7GbSoxjsv3EFF
	 hzyxS+RS4mZkrwINKxalekYbXJS7LtVMl52JAFepgEwPfBp5cGotOpyydVoFjPDWXWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634857;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=HiAqoHTw+xeyQ1aiCiY4b0GejUS7nIHHYhkjM7Z86CHlPsUqpGL/8Udhq5rcx1n+evQS
	 iP+fUPAjYShhBazLb/N1g2nmv//VsvzwBNn4PCY5mFD4a+/EMHhC4KLcye350ipEwoASa
	 sJuym9pudfdQy74nDKsWceqk7+AAbWLm0iB6aRQPXXztF0eYGyfTgfvueoDEeM+KQf/G0
	 M4w2qjvHLCiHEwoTEHxOVcJLusjCs1s5NBgGaU5LNgJw3T6fUL0R25CCvCT9KS9Ho6ltP
	 M/zs5A6/4lcoR8sjIbNS5aTVSFy5jrLCVW99Dbh1/zwcJxwvivjI/VyJy9Xc4B9SwcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yw66vSci;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9614C606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9614C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yw66vSci
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31F15C69149;
	Wed, 25 Nov 2026 19:27:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36F9060480;
	Wed, 25 Nov 2026 19:27:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E09FE11E6B117;
	Wed, 25 Nov 2026 20:27:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795634854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7f2hzo/dOBTufspJmPFdaPlSMDROy4acygZbmp25eMQ=;
	b=Yw66vSciQEvlmy3bewq7xbC0cS+Ly+zFl02IZfFNGSuubV19hQzmDgW+bCFm2qz2ArPiit
	H5RG/aDhCn+kVHLBUtBvWEAgfoWEOPoVKIln2ZJSPgMro5Fd0TtP437tUmMKHRWqy0HHQ/
	3GOhVT3Ap3IZ6PHGSGumrUoSVgHJyIuOGSxkh6bwmrw/oXXqW3cbd+CDDsuru3h0nfvrIC
	JzPqI8wjFEyrkEOOLXUgoegNhwtfztzoxlSN76yiYLvrQ8i4SNsfqVamNz5Ee6DLrf26yx
	NpGBo+z08eA0kUHBlL6+dqj6P1FwK43UAIfOnYcP1fEcAs5PwYrO8f8gs8UdtQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 25 Nov 2026 20:27:12 +0100
Subject: [PATCH v5 5/5] MAINTAINERS: add EyeQ5 MSI controller entry
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
Message-Id: <20261125-eyeq5_msi-v5-5-72346cd10736@bootlin.com>
References: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
In-Reply-To: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
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
index 93abbb315065d..ca3a32790261d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18769,12 +18769,14 @@ M:	Gregory CLEMENT <gregory.clement@bootlin.com>
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

