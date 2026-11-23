Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445646;
	b=dDPtOmsp480Saxc2HwBCDvN91aakJsj4Qa9YusWwtjDRk/05N4OJOmvMGquXJbOb0yUS
	 /+BWwqqZ0YRJ0T/9URXPBIvJb4dLxSAIws1dsskNDYvV+GRLpNsCnsCRaCvvwq9rjqzyy
	 ao3bvaqMd1LCpLPSUfJbWKkA1nkuLHdc/Vas6rzhpVm/Uv0txm/054V6J1T2fIRB3/n/n
	 9yVbqpk9thsNbpLaREGJuzhb5HmiqxgymmTCqDfaE78ul+32Dt39KaKturyOUUOvsZTRA
	 CbZ7riQCViWLwwK1m+T9HjrsnoPAhvSu68e/4Q8juIYb43RFHuhUIjP5+Oe6QxM8d0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
	b=NjkOjHXPRnl8qF7w42XySPE/xSgu8PI+xAUYmoklNFGOqi7BIpjwylVf8qWOt7F43o5t
	 Q0KiT9xChoj2O6a6Lx8ksSO/+liBf4Q+Pdu7YlkofsZyirvtTKuAe4Xbvq3aUdOKMjHvH
	 yGQdDWwdycgfo5+ky0PFbJ/xXYT7pDr9TG1QumtkYRjH2HSIVWbTRz11LRNoUHd8jEj0q
	 ZnNnkCPTeBF6XcR6QeiShD0R+kBfRn333jQySfqrcpS+4lp8AyemOx7xFeW6GRHzAXnrp
	 +gZoybOqTHWSYp7hgAP7gj4Z/4gY/MFQwC0bnFwjroUFo2jXXj+CMVF2iuXz3vE40Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="IRC/4nqI";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB841606B080
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB841606B080
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IRC/4nqI
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so42643365e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445644; x=1796050444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
        b=IRC/4nqIN/TukIVJjlr+quumteedHeJUY624RxL8kTaq93bj/VPPgv6w4dJGH0g9Dx
         EkJeP0YBVbnQwK4lwqwcqmCsFgwDhuc0qy4w3hG+8cmJeJoR38vN8VQF6OhNc04cAjcn
         NkSAX+yhzAh6YYQYvnrS58Wcdk0l1AXYshXjrpvj5siDdDfZqNDKYGThka4tTbYTocVh
         nsqCntJnmfJ/qDhbXMDXshZk1CshSH3yJT31rgjgFF8iCaknQ1KkpyFy1dKYUXI1X697
         Uama9nukcemmJlB1QZffQ/szG20xkvRilbDSRpfNivGJQZOh0PBanvLc3Ym4SqyhYvas
         Z1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445644; x=1796050444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sknB6aQ4PlQDo8HZucV1PufjxI6KnBGvn1RhZrHtfHM=;
        b=fJtoyMexmoocnniUDsCtCcBxTc03hVpn9r+hnW9n5Bx8YXrWGrfhYc6icWayHpZeuz
         fC23JaFsjWg0ypP+3n2Ak9K3Vb0cQeXT3WCQOhhJ/qz20iXK95ZN6v/uI4QysJkID5Ha
         0qH4I2XRVOKxdVhM3gOHr/QpUOLS7fGSNLe6CzR60pIRU4AtDxED1zSDKZLFwj6JKlF1
         p9QBWnV70D317Aqh8fHQBF3U2GHvuV8n79DyjMk4VEMNtKNFZl2ByogNT6fQCiPlNng3
         wOP1E70oye5HRfgb8JsDJsx/+gB3ubjxx+Im/Hi3lU+RsI70z9dB4W2XQETjpVaEwp5p
         obFg==
X-Forwarded-Encrypted: i=1; AL+hErFAPpeFGZxG/DOXqDcLfAJ38+Pt0X8ZXx29PJ3CXDJ1VK35+EeklrN88DXHWnlt6QfO4oKA+ML3EJBv@vger.kernel.org
X-Gm-Message-State: APuU4Z8bBvMf3gDaVB1Baz8OllJV3GVN/dQ4+peEvlRrvvOfPtn2jPf8
	RXu0S6QczIunYw9x63RnM/nLjPrnwZ7vd4627aT+q5jtyg8eryv5VPnKrBYagN/nYhM=
X-Gm-Gg: AZFdTZcT9b28ipCxPQIw7+qIYNe1m/fGSnPi1jhtjJDW7m0HTDVmdow026xMKusVrFc
	C82LlKJQZM6po+RW15Y9Er8jhyPg3zyx4rDJ6K7/T9NifDDFGT0bfsD4mw+d/5B8ECac53RG2Eg
	A2PW2nt3Uq4QspJRE8IDg9LdidD5RsPMatGnb51vUEMm5oCaj5IetUDMa6L8+n11/J2JOcp6cWH
	f+7BVrIE2W09FeBGTelNfiHLjzMwPTjJ5ITHvh100YriQs0HC4H04lHBRfSWybXDLewj956qYM2
	cfwftP/dDkpzQjS+hBC6y1/z8phQKTzIyfjzZSfr+VHGbsBW4jf7C1ctqEcYqPd4ANLUjuqHNQ0
	KJxSUoxlkmH8lKRDEJsZDczM5y6fDLIpWg3XrpVe7rmJXI7iKzaH+3GWJ0ayA8D9oC5JiUJ9yq9
	tXWPOkZ5pijZUcHt+D18NoEzNXuTGjMtk18v2v44BWyOygtiOJhYnNIdmNUVdmL2ZxAg7J0+NiH
	vH6ND2IqpB/TwX7a+YWXl82Z8jTX3itmiMcCBfoXVmjm084AlX4PiyODKl54f2jwfUYeH/pVpik
	hjODbOzEi4P1qoT67y9TmqfOekI=
X-Received: by 2002:a05:600c:46d3:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb88812c9dmr247790145e9.25.1795445644387;
        Mon, 23 Nov 2026 06:54:04 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663264955e9.4.2026.11.23.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:04 -0800 (PST)
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
Subject: [PATCH v3 23/28] ARM: dts: bcm2711: Add the 40-bit DMA controller
Date: Mon, 23 Nov 2026 15:57:01 +0100
Message-ID: <20261123145728.29082-24-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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
index f475422796d8..d152edc069bc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -436,6 +436,38 @@ emmc2: mmc@7e340000 {
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

