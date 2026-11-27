Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795804;
	b=tmtOKhO+e2g0+UXZvdXCOaUoES8hBBv/s6HkVLWZTu5CV18sIou31V7mjLDrTkiNp92e
	 OaMthUeUPcyuyJHPW55bxG9j7iXqJOlRnfJ/KuJcFZJwGk0X1aKCtcBxLIMOrQfz1ZF8V
	 Hi0Zf06QKcnW6EfMmiA7LYQ9uHDVpSzWCjzExCIvVxrj62lfZOGAGv94B9keTf0gbNCAh
	 bLmbc3M+NSOCZWm+rUwcucvWCSZAdK3WAW7fjkqvrCwyPLZF78RNP6iZXvWvCDmfkJilQ
	 bnbukxQvJl/PzwShHSPywxHR/Uuob2V1pQ4Z0AcrrfrF6MLQstw1zMPA2VqRdmJ688w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795804;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+z9lIGbJ9Utj5Ssuh2Y5ZEM1xMNrAcgaOBqBSUpINvA=;
	b=ocwJo9Mnz/NrmLuZHSTdWHaflU75fZa9GA+sj3j4Fhk1+4NYoy9XBDzcAVx1POoKiYGJ
	 SRSe9X0vaE8pH28dSM+UeB0ruma3ClVfFkkBX2/ADwDmBQGuXSQb7LEZKQOMjmKIsMDjy
	 0fIflyIiHAS6RB8UcXY4mg4X3R/g2nxa2t+amsa0jJX47E0tm3YnUExEhPy0BOlxiECIf
	 NYIay0Aq57IB85We435/tPI6GEVVeO6gfb06SkkhKPpVbvHq4dmKgvM+2mT7t6JGKwq28
	 8iyXsvkEcPQbcE3GyEpzr2DHe+3wUF3dLJKbIahB6EO1AJ/fhU+/HrEh6eSbn1vl6Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eS85E9vu;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDC8606A339
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EDC8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eS85E9vu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EE8BAC2AC4E;
	Fri, 27 Nov 2026 16:10:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15F176049C;
	Fri, 27 Nov 2026 16:10:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E95D102F011A;
	Fri, 27 Nov 2026 17:09:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+z9lIGbJ9Utj5Ssuh2Y5ZEM1xMNrAcgaOBqBSUpINvA=;
	b=eS85E9vu+I5zwPfhcHF41aE6cpYrkmk0lBkdFH105TOcwP5jGxgCLnO60hAx5UF3swOK9t
	6KTpJKDdNme/TmPQQnHcV0Oybwu89MFxAOrr2h3BqMnrj0yOg0OwYC8ylU0dTeJhX75Rs6
	7QwO4bmeTSENiBqEIEWBnzLgwmMkxAmTrlAwInkbX8nKR/PcB33GRou4G0lWRMaftLKexY
	Y0692EQig2Kr+81TQ80bYkF+nDmErTQ0fIOcKIE7CGx+1lNzNRLSR/8WWf5DUl55IxRznY
	pjI/6oH5VqjjA21E6DtMN2n238jScemNQdu94vrdlVqqMpUIXk5KGRYN5A0IuA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 27 Nov 2026 17:09:49 +0100
Subject: [PATCH 1/4] MIPS: mobileye: dts: eyeq6h: clean up to follow
 dt-check-style
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
Message-Id: <20261127-b4-eyeq6h-i2c-v1-1-d3232984fe83@bootlin.com>
References: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
In-Reply-To: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Clean up the EyeQ6H device trees so they follow the rules encoded in
scripts/dtc/dt-check-style:

 - order the root child nodes and the soc properties as expected,
 - add the blank lines required before child nodes,
 - wrap the uart0 clocks line to 80 columns.

Also move interrupt-parent to the soc bus so its children inherit it,
instead of repeating it in every controller node.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts |  2 +-
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi     | 39 ++++++++++++++++-------------
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
index 59a3e95050eb9..c0e1de2bb5a0e 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
@@ -8,8 +8,8 @@
 #include "eyeq6h.dtsi"
 
 / {
-	compatible = "mobileye,eyeq6h-epm6", "mobileye,eyeq6h";
 	model = "Mobile EyeQ6H MP6 Evaluation board";
+	compatible = "mobileye,eyeq6h-epm6", "mobileye,eyeq6h";
 
 	chosen {
 		stdout-path = "serial0:921600n8";
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 5ae939d25ea87..dd0f1c7483180 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -10,9 +10,25 @@
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	xtal: clock-30000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <30000000>;
+	};
+
+	coherency-manager {
+		compatible = "mobileye,eyeq6-cm";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+
 		cpu@0 {
 			device_type = "cpu";
 			compatible = "img,i6500";
@@ -21,10 +37,6 @@ cpu@0 {
 		};
 	};
 
-	aliases {
-		serial0 = &uart0;
-	};
-
 	cpu_intc: interrupt-controller {
 		compatible = "mti,cpu-interrupt-controller";
 		interrupt-controller;
@@ -32,21 +44,13 @@ cpu_intc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
-	coherency-manager {
-		compatible = "mobileye,eyeq6-cm";
-	};
-
-	xtal: clock-30000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <30000000>;
-	};
-
 	soc: soc {
 		compatible = "simple-bus";
+		ranges;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
+		interrupt-parent = <&gic>;
 
 		olb_acc: system-controller@d2003000 {
 			compatible = "mobileye,eyeq6h-acc-olb", "syscon";
@@ -69,9 +73,9 @@ uart0: serial@d3331000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0 0xd3331000 0x0 0x1000>;
 			reg-io-width = <4>;
-			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 43 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&olb_west EQ6HC_WEST_PER_UART>, <&olb_west EQ6HC_WEST_PER_OCC>;
+			clocks = <&olb_west EQ6HC_WEST_PER_UART>,
+				 <&olb_west EQ6HC_WEST_PER_OCC>;
 			clock-names = "uartclk", "apb_pclk";
 		};
 
@@ -112,7 +116,6 @@ olb_east: system-controller@d3358000 {
 		emmc: mmc@d8010000 {
 			compatible = "mobileye,eyeq-sd4hc", "cdns,sd4hc";
 			reg = <0 0xd8010000 0x0 0x1000>;
-			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 91 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&olb_south EQ6HC_SOUTH_DIV_EMMC>;
 			bus-width = <8>;

-- 
2.53.0

