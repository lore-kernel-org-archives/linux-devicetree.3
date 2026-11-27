Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761864;
	b=eQTj6ML1OCyfie1nIVRRquHhyc5Ae8rnbvmN5tYdZQFSzhgoTtp3GrJN4X5cwqdpf/yo
	 AYXqqLKjVK7DSugEggwsj9GAH/LyxVdSmP74sv0Fk8yRVamfsACryD1KUoBrHBD1+txZS
	 SZ4MCy95b4NrApW9OnterNQjVX4cCkT4aa9qvziTZ3eKOCPJkiHZZ9Ph5mjvs8LgxVGNL
	 XJDlsKQ8r70g0xjTedhawj43agbLg91LPE96hB3qMbnca9sTALQRRqQVJl5t8S5MmWsDj
	 lSYLLqAn5vgzGoJCTUIjcfQQP+h5eevdh4dJzKeLfAKpvMZsf+8/0KvK/vmLMtHbkUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761864;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JbOTfb87rjaSkCEYx9PwUoo4G9JfsbJsW+QEZtvbUOI=;
	b=YqbmWVWGnewLHgbXp6TysjN1RoQ4GlUaVlimfVZXuosYGSfk6BWK+cbE6E7YsyPMDXzz
	 buL2r8mxWAMCMietZ78g5kkIu85O6ZAd/6WYP4PAPWl08nc0Xx6OLwA+R/qThwfKLtUAt
	 1MZ4GscOLsDxaaeIEP4i1YT5LXdd5L2yi4abbYXx7q+8I4N2jpJ8zKasNuqcc0LrmwKAm
	 Yl4y+aOrS7r65voD5CDy/fdpgoVQlkhUVTQ2yz9DnzcRbipePxqOWS/nsvQr9GLFiXZ5Q
	 gbP9vP3PI7lQFLykED33sPIzwZu0ILf6kUW+gDtH1ZkblarpHLt9GHk63x2CWJbjfPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=bsOBY8gu;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D47606A31E;
	Fri, 27 Nov 2026 06:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=bsOBY8gu
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id AAB7A402B4;
	Fri, 27 Nov 2026 17:44:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795761855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbOTfb87rjaSkCEYx9PwUoo4G9JfsbJsW+QEZtvbUOI=;
	b=bsOBY8guAiWMupofge1nqfQpZ5UHlvIMK4ScAUxYtO/MYF/luOcqArHgxE6B3ylegbi2pT
	EyEiIPxrBxnEpzajIsXVS8tiRBV68wQ405gvF/uAsrrc/oJ/HCIVG6Nuhkv7PL1nq5zS37
	alhxz+jCAWcT1qIgWaAmauUpEe6R8GqhpIgL9e14DKNM5/S/FWsZmaKpGXk0HlGTAvGwju
	qG/H4wc/RfyF3Lg0oOhvPoqDE+hHk7eMZe/ZEC2rn5NwRcsyOnrjc38pfFLqMgQM44psw3
	pplBnFHVoArmWufLNHAJsLNKq8QleFcvwhM6ohNNqeQQZk3uakq+dxp6ZXRjBg==
X-GPT-Reason: legitimate; the email is a technical patch submission
	for a Linux kernel or firmware project, which perfectly aligns
	with the personal/professional context of the recipient alastair@d-silva.org;
	the From domain (d-silva.org) matches the sender's identity and
	the mailbox domain; there are no phishing indicators, urgency, or
	marketing content, and the subject line describes specific technical
	work (arm64: dts: allwinner).
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 1/2] arm64: dts: allwinner: sun60i-a733: Add SPI0 node
Date: Fri, 27 Nov 2026 17:44:07 +1100
Message-ID: <20261127064408.1344250-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127064408.1344250-1-alastair@d-silva.org>
References: <20261127064408.1344250-1-alastair@d-silva.org>
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

Add the SPI0 controller and PC pinmux nodes to sun60i-a733.dtsi.
Omit dmas and spi1..spi4 until the DMA controller is added and other
buses are tested.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index f4fff495e234..d64b98995173 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -164,6 +164,20 @@ mmc2_pins: mmc2-pins {
 				drive-strength = <30>;
 				bias-pull-up;
 			};
+
+			/omit-if-no-ref/
+			spi0_pc_pins: spi0-pc-pins {
+				pins = "PC2", "PC4", "PC12";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
+			/omit-if-no-ref/
+			spi0_cs0_pc_pin: spi0-cs0-pc-pin {
+				pins = "PC3";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
 		};
 
 		ccu: clock-controller@2002000 {
@@ -194,6 +208,19 @@ uart0: serial@2500000 {
 			status = "disabled";
 		};
 
+		spi0: spi@2540000 {
+			compatible = "allwinner,sun60i-a733-spi",
+				     "allwinner,sun55i-a523-spi";
+			reg = <0x02540000 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
+			clock-names = "ahb", "mod";
+			resets = <&ccu RST_BUS_SPI0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@3400000 {
 			compatible = "arm,gic-v3";
 			reg = <0x03400000 0x10000>,
-- 
2.53.0

