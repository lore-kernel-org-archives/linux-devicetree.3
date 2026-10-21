Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595050;
	b=ifIudhtTcwKsO4tmaBJ6g7Ug15BU2ySv0+S0br27mFDdtz9SCpH+dZsppDUBQ3wI/nmG
	 YKBYOuwCdKbmoem+uGiGdLKb/SBxXzFdJzgU28mwsinVIBT/PD5k6ZY5/ls+i5icir1Xo
	 1m+VfPoBvRTL/I2DhwH5pBZ03m+cQUPwB2z9IoMNCkHyNbbcRYHakbX5mkwFhj2UscZk/
	 WKGdgNhL4E7zB65pNle4zCtq40SqY7XpYxto2Qm4cdX68VYtNcRZ1k0J1+s1s5F/eN04B
	 t0FUnDloZO8ldTFe+tN8ir4DHS/Tpj9zkwwGTh5O/VL1KHt41C4KG/hJKenmmnR2m+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
	b=2XQTYrxllnlnLSR2jsF8mEAN29EptYzqFrDFNIXOEuWaI+d7fGR7S4G6W4aB6yh0LW7Q
	 lkyXT/rP6OgBemBkqACWSQG8crUsOMUUou7cxkKiz7vmDe8fBT0aDABcnTLQ6Zkcn1hJ5
	 E6Cbt7QDSXS1otEj6TI1y4VCGZAKryfyFMcZiffSxR2n/DzV0b9Wf2l9oc9+yqbU0bMt5
	 Y0LCd+MD4c6JfKxiClda2DUpwTuhql26TSAxY0JL3nPK7UD+2ZSgZHP2FOAxiUkZd+BK9
	 Ol4Wz+WhrAdgL+wrqQL+t/5Wnh5XcByXNB+dFV9qt31J8JGWydTvuG6nx4Ky74FXSbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F8w9YBSo;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7C606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A7C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F8w9YBSo
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso8556505e9.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792595048; x=1793199848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
        b=F8w9YBSoMr7xqb+0QTAUTxj1/zVqAtwOSTI7cUFFeN06YT5II/1YzDd5R7VyY/g+i+
         sgTn4YjJNqtZLOOHojP0KPh9pCx5kA//mtURao8XOyuW6eOw5GLMCQRYKJvrP8qum0EE
         bRaketirz5DmmqCFEcWyu05o7wlCqxsSSfYdd/nafRjaSi4yyXCtqmsu9mWWJFttpHMf
         H9X7JiPmlj4Z5GZZPtVcU45W211G2kIq6a0+jSbUFvsDBu19KOmHAVjOBLtzyEB9FM0S
         1mTssagfIrLn7EOMK0CPtUbpWMGGmkcuTN6vvdyF/qT4Q23ZOgk03fxS350V/sZz5IUi
         vcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595048; x=1793199848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2whTFX5ouPL2hUuwdfjxOIwfbFlRbLM+ZVtzNCmR9k=;
        b=yba1q06kra9K2Mb52cU8qSCOEoKvBAcA1ESEi8Au9ZfwVP/yKyu6mib5LaKEzJN1Vp
         tQ0B4/SGX5P3LqlGK8L42wMTnP2sjVDUZAZlQiXZVJLrWPDB2/oW5mJY26bQx/TtGYdP
         ashHGZkvEzQ8hrna1eao/vYICMVfN9H2ZKAz7bYxLh4CPB3l38GIfKUbEX5o3ZweAe+I
         JKzEcElNaWlMPKCP+mbI/q0S4PhLgFsNIz8nLQ7K8Ga2A3/sXY0fgn4GDScvihbc9W7U
         t0hMA+sX5bpT9FesX3kAN7BtrN9F5/uJP2VTQxHPljHh9g28Yez4LZimx3GibrDZQaUk
         CeIg==
X-Forwarded-Encrypted: i=1; AKwUvByb32LS/Qxfa9Tkwcbl0c8Cku+1iOyvdN6UclUiv6BEtB/I7EvtaVQFygz/X0VpwIUHHPrjBZQM+/B+@vger.kernel.org
X-Gm-Message-State: AFq9FYIyufC/TBSVhjHf2hOGwyhSdoS/ebE/iimVHYs5TXvoRYZmqRnR
	GMkRH33DVxlHm1BTq27j3FEk+kVNDyD0gRRRzGe3u2xyHk/FZvti4teS
X-Gm-Gg: AYBFou2/4HNdkcQbo/il4CI+sQvWbkXiTpvRaCgvwLs/3vVSCrJH/CmFnQ3dY+kYMyj
	U0xlPRbs0sa1XL7EJWxCY2Ggw3JYJIX7YY30R7Sq3n5TD6N37gJrjp9plLnn3SVm2qsOOsbXRyE
	RD9DGv80UUfxfMbzn50JHLU1Z60M3VVDaI1t5l6EF+Fq27LvVzRI/ZUOqzqSBx10Z2fuJBCgZRH
	PhyCFG1OZBwq/uYsGDbR7nT8iTq9qGpq8A75ZcA/WOC5zatHtCrZnsw8axaSQQnv3ICVraEPi2F
	pZvPJkqQ7dPcW9advtYHPtpWLtGciL9IO8MWpnC4erXRXIkPFSYl3U4zPwRgHA8Wl/AfBBe1R7h
	c4Ko4OxmwU+SB/tNh1NWx6hUHYMYBXqcxz9O5n1Ae5/40ZG3wH0ChVS+JKsnIgP3dbb/KYxf7qJ
	eGEHD4wSZe6HbhMbk9fuP7MrKEqC/luxFT8ou8u4j+y/2WeOILeTqMODg8UeGwKLbUADBi3oBGL
	hDrKphwVOu7SY+NKMAGBBxQQs11ZC2s3K2GRyaBocBD0S74VM0h+lUNj+4i71aftN+k2LJzcmKo
	JNQGJFWT+IJcLkqADgNZL/YaD/bnOR5nXCopeTTizaTjznIjqliqWnJopw==
X-Received: by 2002:a05:600c:4713:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1fd8a675emr51336125e9.1.1792595047719;
        Wed, 21 Oct 2026 08:04:07 -0700 (PDT)
Received: from FLK-B04Q314.fortive.net (217.97.98.50.ipv4.supernova.orange.pl. [217.97.98.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm179698705e9.4.2026.10.21.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:04:07 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kaszubski <sympthicode@gmail.com>
Subject: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed, 21 Oct 2026 17:03:31 +0200
Message-ID: <20261021150403.71569-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
v2:
 - sort TPM6 node by unit address

 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..6240750b84dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
 		reg = <0x40800000 0x800000>;
 		ranges;
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
-- 
2.43.0

