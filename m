Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781961;
	b=mqY/372/oONS2Nna3CAkig1MhAngjT+y51R2iBuZ+V834J28Z7T3HEKewiWzyLvfWeqs
	 LCK1Wno0BPyFa5Od5Hyu96SMmCGldPuYza6HHq/IJ0W7fjXorIZYiXN1Gwl+a9esQkW4m
	 WjL9Z30PbuhbXC4BGiusySNKBaOK0tv2/teRchvjuFgj6W3Bi0dCgv3wgAmdYnoKxUhcx
	 +j2HVpD2fmVSsdJJ1p0eFLE67c4gFVoGUrPXAKdau0eB19Dl1+YgCV3GskoECGiVdjyAY
	 YWa5+Umt1kmugaRD9TJjjpeFsRQ4hZmpKj31QuqF5Ns2O6TJd6dZZRzZ86KC7U2nQDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
	b=5CPOqxp6gd5oA51z14Ns7qJ7mboovkyOeIjXiKJA3zuCFsYdC00xGiglMzcYFXpWpNZ3
	 laPCLrc5UD9OvIT0gvrEG76Ywez4XEvCJmyIHl4wQmRwk+DG5VFO/GnBH2WPE1u3Iyftm
	 HaOJMNYWQj13WqUWFLS0rO6kpC71RU7HmgcOCniBIQYGQYRc7glP5lKxY4389Rmrirv4H
	 6SSIOibDB2DCFrQAI58vlSmFIBYyyA9GAl2akHA5flAdhXl5dWp7tiUPtLTs51qs/6p21
	 QeVXK0XF7bDvaMSEjxi5tiNWZcro0Va+r9xAbDLhr48sfDDQHAuSLet189QlcX+3QJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MQ9lQQJL;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05060A6F7D
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E05060A6F7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MQ9lQQJL
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5733558f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781960; x=1796386760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=MQ9lQQJL9N9Hsur/539YVDoKAS5MaLP2BhDa1btEqFLdswuokZguf2Bz9VTkPXSHi1
         Yc7NUOMB95y9l4QECTegd/FLy2HC2P+bwPexKDaZd16a68gaXsFzsSW3tH5gGS/zUxrE
         J5mUtzMA4hNEUDqXO3Kl1dMAOshGfzSyf5FjQoUbkk8wg7aKjit3tutPoNODFhP/LWcA
         YbEc9fqp5J4j+cQwI0Q93MM3jOVucW2MIC4jNI6Wvk0NLOnelPwuwClFLDk2/f8Tn61K
         alN6+Y5FxfAePD8RrOm/1fP79SCu8J7yw0pB91moaT7wNaWY7hC2hYK4Y2SP3SRrjYaW
         h08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781960; x=1796386760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvCuLCHfMisjweCDS5uzzO6qtUvgznQmoV5SoBwLBW8=;
        b=KCDpLsE1vq2kmOkMFsEBy8rsIAaqIoTDg5ecBsyUbfpd3uUGRrba+jr2aVMq4gihJ4
         DXDv/dDebOQZqLgGxjrQo1TDw3FbPbEIdTekgz1s0sFWhQZYKG+RBZGatbppmO9nA3+l
         n4+GLvymcU2aEaii+fXSJNW858ptJ+J/i8jwxF7qudXbvzMq/TdKMgT2faIhQpTsJeWa
         NkzgOQejXi+V1anrZb4+jIreFgYJngXzDQ7pETXKr0BlFGy1n0EzQtvPFveXMqa0x8ps
         SJWRmWH09S2ZgdXvdvWxc8hcris8XcPUMC6PasozA2oe9BenP0LdCP8t4soy3f4bsjRW
         SOJg==
X-Forwarded-Encrypted: i=1; AL+hErH1r+2sROkbl3UwaztZXQXxFBbbvtzWuPymoIws4mkPF/vVgyqsusQFlINhHMOH6SpNciWeHe1iGQeg@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0oGbDhmRVi6uN5NzINY6ekjot2XhDI+IjrL9NQdhIwyeg+hB
	QUeU0zs6tijOQ8jUjd1+MjTBu6BPj8J79fm60CB1fdQL2Y+hUeY+C8VUk+y2I6tOlV8=
X-Gm-Gg: AZFdTZeSh0qSY3h5KHzLJht8tECR2dAhtFUYYL/3+C9pexhKc47JB9piahWsOpvAZT6
	X+h5mbmbOfHP8nGmrp/abFzQ3H35MLoVhpz689KDc7nAHBJQ+82SaTaPIuTChi6obi72DTjDwQx
	mK0GicLbC5pfp7loWGKA1Xdgkjj09sU38rQGPpdV4q2+SqqeBvhnj9b69J/PGt9LUXAv/DLF38s
	byeOcd6G1b41gWzNUJiAOM9zcWlnQEDRFu6oVtgKVT0q27Ny2yKHdiX9SLvLyeAW7WVKutUArSe
	e+a0LJm0d+gsIlm3FP2765CCG3uj8cNSKPllY9HiB8Kc/wBUdzsvqK4aO9toKItjLu2Gz19vYj7
	T44EtSVgOkFwvDqSutN3bLbB8tSB4ti/ADorUW9FF3tXX3i5ZnozY6PSK83/Dc0fyWz28qO2fm2
	mSsIKNK8NL9X2l2ud8RejR6pbXlYYZsiD6t38Z15QL6uACHLSkAjXoGLanH5qMTVxyDb4lz8IwK
	ULeRkwJQJ1eY0clOWkGFzRynoASOxdJVr1LbLwZzeoWK6R5y91E9T2Sy1L4dBJnsRJazWQlYmME
	kWPbkV6lrbV8E7gyPtBcJ5sEplJXso5J7VkZobPTd9ea0ZADwQ==
X-Received: by 2002:a05:6000:2489:b0:48e:2108:4d28 with SMTP id ffacd0b85a97d-4abb1baaa3emr48985418f8f.13.1795781959788;
        Fri, 27 Nov 2026 04:19:19 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm47186924f8f.52.2026.11.27.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:19 -0800 (PST)
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
Subject: [PATCH v4 26/28] arm64: dts: broadcom: bcm2712: Add the 40-bit DMA controller
Date: Fri, 27 Nov 2026 13:22:16 +0100
Message-ID: <20261127122236.4976-27-andrea.porta@suse.com>
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

BCM2712 has six DMA channels (6 to 11) with a 40-bit address range. Add a
node describing them. The axi bus already describes a 1:1 translation for
both the RAM and the peripherals in its dma-ranges.

Channel 11 is used by the VPU firmware.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index edae2f3584a8..7ba0fc540257 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -676,6 +676,26 @@ iommuc: iommuc@1000005b00 {
 			reg = <0x10 0x5b00 0x0 0x80>;
 		};
 
+		dma40: dma-controller@1000010600 {
+			compatible = "brcm,bcm2712-dma";
+			reg = <0x10 0x00010600 0x00 0x600>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11";
+			#dma-cells = <1>;
+			/* The VPU firmware uses DMA channel 11 for VCHIQ */
+			dma-channel-mask = <0x07c0>;
+		};
+
 		mip0: msi-controller@1000130000 {
 			compatible = "brcm,bcm2712-mip";
 			reg = <0x10 0x00130000 0x00 0xc0>,
-- 
2.51.0

