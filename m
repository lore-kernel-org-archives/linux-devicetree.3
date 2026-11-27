Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781964;
	b=YY+mQ3Ig17haGyF5fFZUipT5fE6kG/uMm2THDJeMK81ZleKZJ1XlRU3mxJ1/PVSSjNSW
	 ft+ARflWzoOZij1mYRwiT+Vex3QsXAuspvkcHFD1g8j6kuthNboZQlulmg4vTHZ7Uo5q6
	 SiQO+QEBf3P1oAOTVai+7F0QI7+7i46hi+WT/EF+UpHlWjXga+tiumzVAJdcmg+FCGXsT
	 I9zQB2llvUqQVs4lA0WK85yrQR7BWxZ/6ie2AMN8Pwv3OWSAVztdSiqpdBXC5vcrhW2h+
	 6kQtDogHMlJn/Tp3rDTAfFVFrxe+proOIvV+zd8tHuAcoiEXCW2dgruXZdJfUbHQiAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
	b=sV/VN+QZNHAsnmxdLvnQjfbij/LdzY66SWMOC78wnFATTyfU6MWNcnhxTNra8IeuQYGp
	 0i+C+k1Ad6WtaMA+c5wUjrikRhv0aH8mvUY2GDZBQ1OARmxpl4+613cY10Nj83tWl+uY+
	 4NI2mrBIgPMxT0mMHK2T4lC52ORI12exAOzMJeIBMoFVqpvYJx/M+h263V3yaDjVvkcLh
	 BJHKTxFv63JCuKg9ZaCgm7NXDOEkNV7JFSNPvbyQ/GOA8OZCxuYkO21oC8VLFJj7ozmIy
	 Om/BNgfd8XvDkQtXmBt0a4f7k9F7rasuRU4hWo66WrasiAv0P2e4lAAd78E6gNkdk2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RWsFwaDj;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C39606C6D6
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C39606C6D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RWsFwaDj
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49465892f7bso5886107f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781963; x=1796386763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
        b=RWsFwaDj06AcQkXnUrqX7SDxFULhdAZXBD9zPLiKNyDdmryVwjctfsZP3uWZxFP724
         LLBOw5EONTIxs+Gob63p3AElMXNVIT/hL8T9vgTn6A7NV8/j7bQk67aEGPUt+cWT0MSD
         ve3lQZE7IKp/LNkjT+1w9ndILaGzmOwrpdYz0h85UAXF8eNnGFQgAOCpxNTF603Myr6z
         n5V5QH623ZKLo/NeoFZQof7vWqZV+XhX3mzdwllT+gCk/s0cGvQlT0nF15dAR0wFiG7V
         Bit3Pvegw8CYFTw1yhrcpb8cXZnV3686s0teEUYE2g97T5sNt9X3bog5TTxNVJCBd0ki
         cv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781963; x=1796386763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+IW/uZ0j05LJqVLsSY6Erg+izYe5hqVn60TIR3SgAB8=;
        b=eAhfjzyTPj0XhUr9M/l97idRhO7VP5kJPr6wPrCP1spF+y6VhkAlo06TkfEMXWp2BO
         TKlNZy2S6Ox+Er2F0Hc4jiANCVyOB5XPj4WC2T9ZfaBThatIM6BIHi9+9yFdO6jJWpn0
         oj3l2uAC9Cp/xAtNisPfaZ/ivicMVRd9TimUIXZjZTlElNY+eu1y99PL+/17zSEEYlT0
         u9Hut0ifsl41syLkW24K5NGpUpw0IXzZGYMmRji0fUQ6c9DFBGyWTB0SYer9rYBQ/QqX
         TsIRKu5jNGPkQV/yJeh5uGwJo10cEgwCfLeMOjG8bSGwrU+N/5PLqXd9KN7OzCDf5Pzo
         GaWg==
X-Forwarded-Encrypted: i=1; AL+hErGn6ibqHed39j0NiTtItpxd23WREsgzDvtB3Ayw9AQNCmXSvlGsN0E4VpCgq93YJjEJygcsvkJIfads@vger.kernel.org
X-Gm-Message-State: APuU4Z/X3LyNSXFa/sId2KLnT1Gj4YjS2eHiF7IW3pBma4vaABQGjPgX
	guFNfq5feXTJqMmPz6UCnIup/AzmIUa4Kzh2gAgi0UFCKQgrBqhJRD+0MfofeodjFqM=
X-Gm-Gg: AZFdTZcRflV2sC8bavZRTVZSKW/SBKzV76/Vwc1mEvsQ5La8GAoMYSH7BIbeW7HFUxE
	cxOw5fDfRpNHvevD58wkW6GND8pZBtn4x90iP2sxPnD3YK1bq3OPKh7+PnqOiB/UGHE34bMTydk
	/lP1KBMoh/JxSzTvj0JyP5rP6QBvhQELalqMYHA9JfENY+sVeZhuyXbL4TRRmGV7CpvOArOqFpj
	QNSXiIhKt2p7GuBN2cZyacKrvskz7gN6OVamxteEiAxdfIiF+mO5YogsNGp8olrXJzKMAlIcQQU
	4SffetdhUBbtUTrWHU4bkFt6wmVTdZJekO3yL/UOQs3WKb+6+rQfsA19GUg27xqhLQTL0sSbAds
	SfXPlZkzDoLP4LXYNsPinLLBXrMPSWtbozDd5BmmLVHwfIe2jH0eFtUlmLtwDdz+D8wO5nwZaW5
	wK9uWQ6NiXaB7xIEzfVuuyKzoXmfy5kIqiTHj8QWWPjxMUgfTUMtOZdqvbuhZdWQEexW6fKcYn7
	YHwn46F9n74KWh9jbsZwSnIkFu5EuMknhQ1djxa+/TStQewNLj2xKbCajE50KvModluxr6eoVOL
	CmbWqP/84ZPigrlGxbvooX6Vw9yy
X-Received: by 2002:a05:6000:290b:b0:4b7:8363:682 with SMTP id ffacd0b85a97d-4b7836306d3mr23949156f8f.16.1795781962728;
        Fri, 27 Nov 2026 04:19:22 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm48478454f8f.31.2026.11.27.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:22 -0800 (PST)
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
Subject: [PATCH v4 28/28] arm64: dts: broadcom: bcm2712: Enable HDMI audio
Date: Fri, 27 Nov 2026 13:22:18 +0100
Message-ID: <20261127122236.4976-29-andrea.porta@suse.com>
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

The HDMI controllers of BCM2712 feed their MAI FIFO through the 40-bit
DMA channels. Describe them, so that vc4 registers the HDMI audio
devices.

The DREQ lines of the HDMI audio changed between the C1 and D0 steppings
(10/17 and 12/13 respectively), while the flags request multi-beat
bursts, wide source reads and the AXI priorities used by the downstream
Raspberry Pi device trees, where these values come from.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi         | 11 +++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc..80073bec01b2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -8,6 +8,21 @@ / {
 	model = "Raspberry Pi 5 d0 Stepping";
 };
 
+/* The HDMI audio DREQs changed on D0 */
+&hdmi0 {
+	dmas = <&dma40 (12 | BCM2835_DMA_FLAG_BURST |
+			BCM2835_DMA_FLAG_WIDE_SOURCE |
+			BCM2835_DMA_FLAG_PRIORITY(10) |
+			BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 (13 | BCM2835_DMA_FLAG_BURST |
+			BCM2835_DMA_FLAG_WIDE_SOURCE |
+			BCM2835_DMA_FLAG_PRIORITY(10) |
+			BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 7ba0fc540257..bedbd7a359f6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/bcm2835-pm.h>
 
@@ -483,6 +484,11 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			dmas = <&dma40 (10 | BCM2835_DMA_FLAG_BURST |
+					BCM2835_DMA_FLAG_WIDE_SOURCE |
+					BCM2835_DMA_FLAG_PRIORITY(10) |
+					BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
@@ -513,6 +519,11 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			dmas = <&dma40 (17 | BCM2835_DMA_FLAG_BURST |
+					BCM2835_DMA_FLAG_WIDE_SOURCE |
+					BCM2835_DMA_FLAG_PRIORITY(10) |
+					BCM2835_DMA_FLAG_PANIC_PRIORITY(15))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
-- 
2.51.0

