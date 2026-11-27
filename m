Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781956;
	b=A0aIPFHbFFGyrSLudV5J3Dex/NSrYqgUDiHvsZ2N1HxNyIarIBGyiGHSNwdY7JGVJ9QW
	 WnwcDVOVqXjfJISSxWr9mlZMVTn8ztH66n5fqwPhx5E15CAwoUN0rK0yz41AjUoy8m3mo
	 eBCjKyr+KHjREZRoTyzikb8/bIv3yt9GF+x1rd79JDRWrT5Klct9Q0s2JcBmZT96MLuiM
	 5YHTa0bgBTaPPL71XzjKR1w2d15DKHdMTixKF4VZi80lUXCKGl9R5BXYhMHUUY76ibPaa
	 NFCHJ1lWc/KKAvVcERT+cY2GYzGU52G0PjVvs71b7f6wGguAmNw1CZUgFBqYCfhD/6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
	b=UzRZWs7m6Oi2nugy+QqMbwoCIGTonOQL+lrSO1dB290Ye7VBQYPc547NXNx7GHyj02Ju
	 K6ft7fJd0J6Bd2pAbPVwUxwYD87qMA5vD6/XaDFilU82o4EWeWObL3blHB7bajyJqNd/A
	 GFQWgC3idp2aCo+5aLMnsxHmxX6G70J0H2ZddObAp65Hl+CVP7c/vqNPsDZfGIittlWKM
	 JeP33Px+UfajXkrVYprLlf2VlQd8AnMl88W6Nu95kSXw/Mk5tMxltDdleBnU50dE7VnMX
	 5TZXMFzdkzB7aZ8LPt3MsBjFCw/o2TUslBtBgQPES8J5mLKohaXBYQjeiAWbtMr2Zmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K5XMeS2F;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8EE606B81B
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8EE606B81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K5XMeS2F
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso78787265e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781954; x=1796386754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
        b=K5XMeS2FYjKidBWHlWThP2dCMDaWsyj1ULF+T3aAs2fLzGynYIIzaauoGFpCQfy1BU
         k0CqWpzUbXuKSBSbYnnjtGzxIHrEZHgKLo/3bghWoarl3Jg7RijxcloYVaO78CAFGpd4
         Wlo3wI3v00lCeh821rs9CrBkQD9i+Y1iXTj+CRW17XnTPcE+OUnc/NeBoPmPqVezf27q
         bQoT7ZezQB9IAyNH8WE3FAnALIaTBLchV9svJKlpaM5kE32jf3/hmeSHtRCXBHS6mrFR
         dPiFAz+ON2XxwkKAZDrHwb7cgOeKPunXpDyN4IeMFHejmO5SPeFUSudjRz6tNiruX+yt
         wXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781954; x=1796386754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2wzmkkVZfBCgK0gyDtXImqh4zosYpUCndScJCPC2/A=;
        b=oK8Vj8l6xuHx0I/a+AUKu9RktsuKRd5jZ8jcv1y0VWfl7GUgByQ5pln6P/Bt5O3oaL
         2smLE0K5j+F03SPZJIITgUfz1ei5oyfrEL7j7CQB3xjCT/nl3koWCSq60HdsJzrtn1Hx
         Tpx4xk4EdAM6wC+b3K2QO73HJUsqF4g4FKcxUUoembJg5JezKR2iGtuJlGAi5q2GPAMm
         BI6eqtyVyF3f0nBoZdXhZY65jqVUvCndfbt0/XDh3wY0excfFarNWldDOrmiaa9P5gYg
         3pwPlSXDWdTlXFPeMkSVvIforhniunnBfax/0U94xHvQcIuWkP71/8SkwGhE7svm60lM
         Y/oA==
X-Forwarded-Encrypted: i=1; AL+hErHEc0pNcHmFqN/nNmXtL+IvIF+oE7AjRLQdpXPaDv4zG/Gl4kjkFEkqzhfUobNfF041iSEfoWIq5QZL@vger.kernel.org
X-Gm-Message-State: APuU4Z/kk7WZkciyyIe9vC6gi35XRzO8R9uHjTuG/hxMS5FKOejwtyQX
	3A64noPoVj2J/uV7oj+mctt19uvjxXxVA5Xt78cIOVMMGYy/6L7tL/Oic7XEC1ng0QA=
X-Gm-Gg: AZFdTZd581CKwVEnrbjWWE64USPJHsHWJ7Glu9gFXCJc1vnL53ZuV/IVeRpzuFtWBWB
	JdAaDSIrex038qudPfeR7WIg9TTVlc27ymuCeH10mBki91SykqfvEONAFh/PB7axJQaxHePKjNW
	jk/S8wKYhMwPDPFNth+2Kas3/GrH0c9WYw1Mf3MAztmrZKwZOU9jEjXJY2GkkWz171fmLCGHa8X
	wkTRgR0wj0kRUlLjbPU4B5b8Olke/efZH1KwkmgZGBmtT8XayOUR9L07VQrQwnNlSLFOeJccspJ
	1FatN9ZOPxBizBVfDTx0CgrMUq0Zx5MM8f0ZQD+la1BdM8oxYVA9mC0X+k9fwEkl+QpUTBGEJTe
	aDqB0/76sfmUOa5jv1RVODINsgEffOBbLNOWBRsKvlmzS+UQLBLCYwlj+RlHo03MAtvDXsFQVy6
	wa+1xdL/Qmtp/5xDusLFvcdwkarUX0SjYFbBo7Vy8EZRv8oR9nSfc3jJ64YRLrbPvLBVUNf5O5b
	idzjP6fKxFz3ZBCvq2mytidEM/rx2bgjXFUoe2d91/+3q3MuJGzyVMZEfipT03QKnNpQrVXjWDO
	l9L68KmGuZV68ytFSh6XDnkY6kfH
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr459954025e9.4.1795781954018;
        Fri, 27 Nov 2026 04:19:14 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm746847685e9.12.2026.11.27.04.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:13 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 23/28] ARM: dts: bcm2711: Add the 40-bit DMA controller
Date: Fri, 27 Nov 2026 13:22:13 +0100
Message-ID: <20261127122236.4976-24-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

BCM2711 has 4 DMA channels with a 40-bit address range, allowing them
to access the whole memory of a Pi 4. Add a node describing them.

The 40-bit channels see the RAM at its CPU physical address and the
peripherals at 0x4_7c000000. Describe this through the dma-ranges of a
dedicated bus, rather than adding them to the scb bus, as the latter
would change the DMA configuration of the PCIe and Ethernet controllers
too. The RAM window skips the peripheral window of the CPU address map,
so that the peripheral FIFOs are not translated 1:1.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..390b8853696f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -432,6 +432,38 @@ emmc2: mmc@7e340000 {
 		};
 	};
 
+	/*
+	 * The 40-bit DMA channels see the RAM at its CPU physical address,
+	 * and the peripherals in the upper part of their address space. Give
+	 * them their own bus, so as to not affect the other devices.
+	 */
+	dma40-bus@fe007b00 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x0 0x7e007b00  0x0 0xfe007b00  0x0 0x00000400>;
+		dma-ranges = <0x0 0x00000000  0x0 0x00000000  0x0 0xfc000000>,
+			     <0x1 0x00000000  0x1 0x00000000  0x3 0x00000000>,
+			     <0x4 0x7c000000  0x0 0xfc000000  0x0 0x03800000>;
+
+		dma40: dma-controller@7e007b00 {
+			compatible = "brcm,bcm2711-dma";
+			reg = <0x0 0x7e007b00  0x0 0x400>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 11 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 12 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, /* dma4 13 */
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>; /* dma4 14 */
+			interrupt-names = "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x7000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.51.0

