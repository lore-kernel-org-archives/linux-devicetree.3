Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610451;
	b=5WcZMZpKb4ETBvE+1qo4o6RmLLgjVYdq2gISMI5AHZTzGL1f/OTL77HqoNtvny9EwF0k
	 yHImw9c72cANy5yqMCicdbfhX9FkepUQ28Nsw3rjI8CxxfrrdwWO7Xt+wGJWCMMBAAyrj
	 bNy9O3dnLeAR2IIzPXIoOfZuAI9aSD3xsY1VQToQDThP1b/kajzuAKg2LoIEAvbLFxwYu
	 REtcYZ/2eHeB1bjPzFzUOIiOni0K56vgpRbFClP1i0luuyJ4TTO/jUNasmU5LbPT0pfRh
	 cAJUptIiRQbKwlJRBT09OPCsu+7mtcuU8zZnl4o6LITqKLoUGKQgv1Yaep2CozNoOCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=;
	b=uOh+geKUEsZ8DwsOB9Tx9vkvGi7k0tCuD1VFgLdttkUAPhYHiV7T/VIyyehLBLgtrvYr
	 n3X1DcSxqD+o9f5UTF3ypRElXFJlOxhCy7fcpfD+JZcq1cnDg826ciPUjVUp+CuGw6xuV
	 PEKW2zqyK5i2HkPi/rCOfvXO7eZQJjBDOMmWub82tf7KMclr4nrtCsS780lrz/jpMbEmu
	 DDYhUeex/EiSXprK2bmh7I/hf2YipHDWq88cIH0ouIG35fxyeOvINX468kg1pY8Tkbahu
	 4IDcbytOZnpkjy3wVxCSYKWuZicBlPX1fi7UWnjkuERFtVyNW9ruVRm73tdTVH8bY3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uoc2XBtq;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4F606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C4F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uoc2XBtq
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso26615935e9.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610449; x=1794215249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=;
        b=uoc2XBtqKfZ+hMXPe3UCuX0BRP+sFw959+aYH2jbGIYYhxkcYv2h/KoNuiy/0Tiw9i
         tYyvMOrbBaRT9m/PqT/9zJrFNkpZfJvH8OZoj281PsijCoJgjAU+qRMWVZEhtK7uZNct
         7xnFztglEUxPcbMnrUH0BQhj50VggeSQQv3rgs9lRYS+Gp5cIbhu1kBEaoajF2Agvh4v
         YhvBnU8e+enhVLMGtBuZ56vzWL0dSWgY7Fi+sojZpMK+Upw4xJRdpAfXbBpV+O1JqJDw
         4XyYsG+kWXFpqoUDRIZTp5mnP1uOSILbyq+6ChKbB3V+ybgYs+NjNISPY8bv2gIe2Dik
         74iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610449; x=1794215249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQeMR6moZU6rMmQ102B8sJtQ895cbKKrODc45qACMhE=;
        b=EmzzfeUbwfFLQMMvR34TQe5qJkNsWu6B8qsFidY/VdEkImLPvMh1xvHLrO631sipeu
         3Ca7WzbVUeP9jQpz32US0y/pmKKuMGJusToYjf+521fwLP2LoVth8yCo9efksU4o5yn+
         G4BAp2i5kVsnWawICIJ9HMPtlDPfI8YHzfuSbBj5enJQySBtbxUKq326l/KAZ2OMuPQ7
         qNIsDe7kf+iEsv5x7czq1lAZmA/nVCF+G86pHn+oJe3+zOxF84l3Q4jy8/bWT/+5q6qC
         00yGAF25aNqx2KuFRzP2xNZYQFj/UW5Fcm70bVqAKN33aj3HL5ZUCU1K0N0u8jIUby3l
         izog==
X-Forwarded-Encrypted: i=1; AKwUvBzZ54upolHcSA2K/aHTOcg1/cNQfrkrzuggNWhYl3xRGasLop8jYf7Yfw2o+/pGTDB5wpa6ju+GvySs@vger.kernel.org
X-Gm-Message-State: AFq9FYKLahR5Og1vtfrpyjSAJoHL7pf3UcJn7K09CLC1UyHoyQiixd73
	pjiaCvlMKg0QKnZF7Wquvv34g6Bxgqm3qcetiDJgE6g5KcDLcLurIZUx
X-Gm-Gg: AYBFou0Lteryp+D1ABcRmwNWnpIWLdeYYfn/xWJdalW4lferTsbhtyWGmQkGH2FQg6h
	EbSzN1417LgITU2v9hYHZsDV4VFyeD+Fgzwu8EhTw038EYGhhDRaauBMB5KLhXfVtIPPb3zo1vn
	bKY7iuYzdfr/Vy0KiQtm+oGXWd1BHrSu5AkNhataNHNm3auUdgh+lpZRyhRKjiKSx4ZBKWzEY0+
	/WxUN5c4wCXNeuTu1qaaxRooquz/id2PahZK52CxvDGFlZ7AaKkAmT7j2cZJx0Rx0GkRMiHC4pn
	+tWiVvf8D7Dif1x5gF36uvs6CL80ZUaRMu4KCfEsTsXXjWE1ZqNPuDLU88sfx8pQbpJBn9nIT9s
	tXKfgfBeyT805QzGyCnQEubhPeM7qQdlZZjQR3yHetWsLLINN79itLGFUezU+jYZ7NGAlgqTsaM
	cHhYYRwftATVbnJnH9UWx5AUn3uJ6KaQYsDu71XmhHCOY0tJbQzhIpjDCUMPMRc4/c7HRrfOQzn
	HoBgaf0eYTZuB9on2hxpzdNlwtCKXb0Kaxb9SZSuN3S0m177ki7BxyiNjFPaIy1yIklOOMSRehf
	15/bJ0lDsJ7WRsISGF5pTvLfiKlO0D0bxrGvMUR8uFyCPRcQPZHO3MpyMrTpsriavuyNe73nZVo
	lCXMNzXWrxMdfS8dacPxepyOzNuCYMOWKr7wv9ou4T/9S4ZjaTsHmmJNEecU+bjCmU4zcdXxQR4
	lzuPavw7fsTZrD
X-Received: by 2002:a05:600c:540f:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ac17d1a1f1mr235827335e9.20.1793610448975;
        Mon, 02 Nov 2026 01:07:28 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:28 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 6/9] ARM: dts: bcm2711: Add 40-bit DMA controller
Date: Mon,  2 Nov 2026 09:06:56 +0000
Message-ID: <20261102090713.896324-7-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
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

Describe the four DMA4 channels (11-14) of BCM2711. They sit
on the SCB so they can reach all of memory.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb393967..9d70bea17b11c 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -602,6 +602,22 @@ genet_mdio: mdio@e14 {
 			};
 		};
 
+		dma40: dma-controller@7e007b00 {
+			compatible = "brcm,bcm2711-dma";
+			reg = <0x0 0x7e007b00 0x400>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, /* dma4 11 */
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>, /* dma4 12 */
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, /* dma4 13 */
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>; /* dma4 14 */
+			interrupt-names = "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14";
+			#dma-cells = <1>;
+			brcm,dma-channel-mask = <0x7800>;
+			status = "disabled";
+		};
+
 		xhci: usb@7e9c0000 {
 			compatible = "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";
 			reg = <0x0 0x7e9c0000 0x100000>;
-- 
2.56.0

