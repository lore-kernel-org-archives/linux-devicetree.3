Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805791;
	b=Q9EzGoommwha7kF6OahnYLAzkmtl2sJ4Z6vgOeRRNkqiSmMMPI94rkF+155kXre1BxS1
	 6NZMuJCp1iwDHHOq9FuZr4x4rCv5qzigGOsYS2E7d1XVwTEI0w5fKX9C8wJ3JW5I7qWKE
	 WgZ/SJRlsyrV68rjNuHs+Td/FBkMoiV4EcAnXF6JmHczF2b2ZVGBZK8qkUdJk8TNMrUDo
	 DRrcfII7yHeo4tkAnmWCipR6bT2AHL6Z1MgSGBaafXj6sVf7cjFR6WDGTSHxNAeBcs439
	 wO2Bl0E54OJi0a0Q97Dse6K0yM30kkFxisRJLdaCKy8PWrpssbNIUZuhc6oclVcI+HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805791;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=/C2hcYZOYvJEefWID095f9m7L8eAhaaSvDOhtc1OYaM=;
	b=wmwlCWTlN95Uo/9i7rZTxxf+2QnU5n/a1UueQz9RN+bwXPItt7n9Keo5IDcCh6BJpAzx
	 AiA8Z6vQb+TMdbE5i1GBUGGrlbd9hCNC2E88uFQUeznIZRY6JnNMZPd7ZRogLzxNhOcQL
	 V8L9Iay0KfRKzj/6f9k8CaTPt3GE4Yw1ZicPqIvfzji9Tpkc1FuMie8zO9ajtpArM2U5W
	 GngDPugMJpOd1rt/Ds0F1w0kRsaaOS+KDcxLwlbnmFX/LrJQ0RKApPoKngaD6xFMxYJUC
	 OYKnmOIMaO5owEsq4k0iqlQF53cLLp4AryIva9ypMf81c7VcdZQEMsSpxS0Uo0mM8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SxT4X7NL;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F37606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F37606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SxT4X7NL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D2F7C8F46B;
	Wed,  4 Nov 2026 15:24:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50E5760770;
	Wed,  4 Nov 2026 15:23:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CFE7103291D1;
	Wed,  4 Nov 2026 16:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805788; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/C2hcYZOYvJEefWID095f9m7L8eAhaaSvDOhtc1OYaM=;
	b=SxT4X7NLHKvj7CHPFTAlZII+WFJ3xmJWpcW3TxQICl2ID4y9/N7gCTHyc+jkTGXMA4X9V0
	KvSdd+fN4/pfAFW6QYqEfWTE0PUrr9vjeFVDmr7PibtiD3ulZyo/AD0mSZWUtDoZ03Lx8o
	gpO0ddPp4EPk9jPUr6cnzJxjAbnsur2+5dYfrvlzrBfy8RizxdOmZETd9S+RSD68o7WBb7
	jnB7D+DHkWFio75tfVb6hTyuqhH8mNWTYSuPenH7krpiHumHBt6C60e0M/QUxPwW1Y9cAH
	zLtnfXWrwN8sWAg9vkAnQB9sQijLj8Y9oy/TJeC7TcFxMmYXOUBJuOuM0mbtvA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Wed, 04 Nov 2026 16:23:01 +0100
Subject: [PATCH] ARM: dts: ti: var-som-om44: add local-mac-address property
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
Message-Id: <20261104-omap4-dtsi-v1-1-8d987f953fe7@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3fzcxAIT3ZSS4kxdQ7MUE8NkE0vDZAtDJaCGgqLUtMwKsGHRsbW
 1ANko3QNcAAAA
X-Change-ID: 20261102-omap4-dtsi-16d41c491c81
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Richard <thomas.richard@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Commit d8f1b27c9f12 ("ARM: dts: ti: var-som-om44: Add USB Ethernet
controller node") added the Ethernet node to allow the bootloader to
patch the device-tree to set the MAC address.

U-Boot has an already-existing helper that does that but it needs the
local-mac-address property to be already in the device-tree and an
'ethernet' alias for the Ethernet node.

Add the alias and the local-mac-address property to allow the use of
this already existing helper in U-Boot.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
On U-Boot side, the support for this has entered the main branch with
commit f5df14cb949 ("omap4-var-som: forward MAC address to Linux")
---
 arch/arm/boot/dts/ti/omap/omap4-var-som-om44.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-var-som-om44.dtsi b/arch/arm/boot/dts/ti/omap/omap4-var-som-om44.dtsi
index 9e04aa70f982..6c615dd71491 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-var-som-om44.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-var-som-om44.dtsi
@@ -10,6 +10,10 @@ / {
 	model = "Variscite VAR-SOM-OM44";
 	compatible = "variscite,var-som-om44", "ti,omap4460", "ti,omap4";
 
+	aliases {
+		ethernet = &ethernet;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>; /* 1 GB */
@@ -334,6 +338,8 @@ usbhub: hub@1 {
 		ethernet: ethernet@3 {
 			compatible = "usb424,7500";
 			reg = <3>;
+
+			local-mac-address = [00 00 00 00 00 00];
 		};
 	};
 };

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-omap4-dtsi-16d41c491c81

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>

