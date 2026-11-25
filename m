Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634855;
	b=ezsX9vrwXzqvDc7c0ln59pKJGxD9RZgFN0jwR2r9vBxiO8kgEdvrkKKsErI1ja8082AL
	 6RVf8n3sRbAtj5F1wDrsi5NW8CEcw5XCtaRaRoW4DtRyglKi0SpDWib+w5A55bYNJ0U+E
	 NpQ/9wsKcDsqxIe70gMeCIwX6HWLqCahJ7Bw/MT2jfEizrUhRDhOhJeO2lffKfaNqeCwI
	 auVJfdh2pjOh9fhU2XBNgT4drBNpJAQURIx3z3tmJgdycf0emA8w8DwEfbUXA6oO1XnzU
	 Ea3uUmTRUJfggbsfE/3xX4BCUoWO9z3rvaOsifyISEe3yK5kdi20irHuX3uw18/xhBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634855;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ETlxSp0T1c8AX/VhONDrS4J1SKrQaJ/+qnMHUEdlhTc=;
	b=bp6xfinYIFilkYnQ34Ou4lInk7hGoAMzlNODVISrSspI6L8u0Dw0cceMUDYYjt0WOU8I
	 SKtazi7PqiSGr3Teva5YXvGDKUVbzmxxCefT4YK3wvkBbT23uSsjB6U7Q/KDWngu32RQW
	 qR75LzIfZuOexipoac5M4I5qEsSM1NYslH0gfiQ8XZ0enN8K09DiiRQfO2qyqXNL8P+Ih
	 Cee2jg0fsE7SgPE1UQOU69VD2t0eKWm/0Mp/67d3lqSUsAfX4gOWLcvf5ZUPS/oS4g2rS
	 KxArCdnFeRUsaMX78DnnrQ8JS3bmuOyFDSUYj6P5DmgihL0k48H1Q68aBgv2LxgMJow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Mmct8/f+";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17A606A33A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F17A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Mmct8/f+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B9BA1A17F8;
	Wed, 25 Nov 2026 19:27:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3029660480;
	Wed, 25 Nov 2026 19:27:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F41311E6B113;
	Wed, 25 Nov 2026 20:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795634852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ETlxSp0T1c8AX/VhONDrS4J1SKrQaJ/+qnMHUEdlhTc=;
	b=Mmct8/f+9FoD1C6xXGo7HKlo2qp8KSAEtl6i+4OIjlLkC3stpwVsqw5NFFWRYLr2lObjfW
	DMRNYqZnEbLeCUSHC4sDpfw1dBaRjVbR9zTV3Ctojh+fnkTc1ZNVfBa2OlrnNy7OJtSLGk
	eT7rp8sSVZToPuaLQsJqW9VCj0H77G5WKX75VEHTT/TpVcYvydPJaYu4cPjFkiUDmw5l9i
	QjAfFH0HyRpI02WqP+qUWQbP7Pd7eWpQ0bBf1cNLhHeAJwM3KMjWYkWEo0LcPlAhCuJiB+
	unJxmlry07t+bGncXhgnEZ5eaTvCMPa4BVHxT02nPBbSH77nxpaaRGwRDCUYtQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 25 Nov 2026 20:27:11 +0100
Subject: [PATCH v5 4/5] MIPS: dts: eyeq5: add MSI controllers
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
Message-Id: <20261125-eyeq5_msi-v5-4-72346cd10736@bootlin.com>
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

Add the two EyeQ5 MSI controllers. They use reserved-memory regions as
their doorbell windows.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index cec5ad8752285..ab63a90ed3e92 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -309,6 +309,28 @@ gpio1: gpio@1500000 {
 			resets = <&olb 0 26>;
 		};
 
+		msi0: msi-controller@5840000 {
+			compatible = "mobileye,eyeq5-msi";
+			reg = <0x0 0x05840000 0x0 0x10>,
+			      <0x0 0x05840040 0x0 0x20>;
+			interrupt-parent = <&gic>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts = <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&pci0_msi_reserved>;
+		};
+
+		msi1: msi-controller@5840010 {
+			compatible = "mobileye,eyeq5-msi";
+			reg = <0x0 0x05840010 0x0 0x10>,
+			      <0x0 0x05840060 0x0 0x20>;
+			interrupt-parent = <&gic>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts = <GIC_SHARED 48 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&pci1_msi_reserved>;
+		};
+
 		iocu-bus {
 			compatible = "simple-bus";
 			#address-cells = <2>;

-- 
2.53.0

