Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203592;
	b=phC7XQZQdq5gd1Et872SJ14WZK7SQlAVesc92QS4aVRgJIKSYzTD4VHBJelmmr5qIzWO
	 fWAqDVYM++RDZDRBF3iLgwL1YOTqALP4/lncWV+KEqsvMZewKSPzuFo++Zd7JeYUnb3hy
	 GDHyBGkPJrm22nrRCUaBUCvusRZojJQmSKN5honwbej+fYECaAOffwLaHRN0LiJPXE6nJ
	 J2roeEO6EBzNaK5nmv0/NLWHRm1oiEykmj9jI4R0K5vT948qktVgNUssvBl3dVNagUR3y
	 sk/uGc9A18T5VeHsSCLkdNyZhQWgFKQDi7vSgpzUmev/CGGDuQ0Ku9uuTpSVHQYYTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wXXJVVE7DxQ4okK75gXR5XkOT+hE06hRlYWzlQtBB0Y=;
	b=bdg/MWCNFAkbJOnILlbRcczkKupn7ka0aNUxdp2nMqj7NWna0dibMNxQkeh4ZJG6kov6
	 s0dxKCiDllEV5jLnEAgMTRs/3f/gNXOcGgfmrxaAdbeal9lNiS6MMG8PFXvSCqeApQ2as
	 zpxklwmXWmQma+5LEkPxvafgPQKEAuaWQDDGnwZ2lR2djidUvWcxbiIv9atwnRisxA2jw
	 US6srD4vYuZvU3LkSSFZ12ShQOLAR4F2peANycDZYoEbS81Y1dKmOYykR02SEnC0wMysc
	 dftCqhQ8TQ528rx6huGrVMN8Xbr1jTUw6WoUhWDmc13ii+VjGzTNX/g+2s7+5dEDbAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=insoPdhe;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6960A2634
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC6960A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=insoPdhe
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9260975e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203591; x=1793808391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXXJVVE7DxQ4okK75gXR5XkOT+hE06hRlYWzlQtBB0Y=;
        b=insoPdheYxSCdxOOzoRrXooV9JVAQIrxsYoaKktBhFGBZZhUcFjMs2zGg7r8kSUkqw
         nvWfLaxqJGEE77cFjMgaB7LvPJ4StFC387ts4bvKVDtSnwV/kfQmF1Wz3CNeR4Ak7vuT
         iTerwB1bgnBQHKO7zgQr8FjTYDofeIXnK15mFLwMsOXrJMOoC1RkkGxpwM6hzjNmYigP
         TIRJRdCEJtckFEL9rdiiknclkqrdFFp4B1ly0aNBrpU/gDFl7x+YdZb5aqHovqWLF//L
         sfS6dFMfnQoOJf7R6ctw67bEb4r5irupWHH34y6NdhqhO2s+5evV0pwQDgFaj9OomRT5
         5GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203591; x=1793808391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXXJVVE7DxQ4okK75gXR5XkOT+hE06hRlYWzlQtBB0Y=;
        b=AC+9NTrjC/z5lPkn1jFsKR+IDS+PI/8iqqCwBEYVCpldrKUoC9ZwxgGkZUwvvqr/O/
         +6tlfMoIjC9rHiVsjRBqPoZVskgifnJXf1rR++QjE0AqU+L3ZVpOYsBeEvymtZHr5rhF
         kmXRYlNfpGsCwhqtScjOW0tERkw1rke7p4kjckQsDV0dRpLGdqIhzcnyvXEPxpnJbICk
         wTq4LX6cYXv+bBPQLSPSFcVxkDxs/ti11ifymJw47meYf08fAkvf6jxMieV9/PPWRND4
         ThUl+JN8I8yRuVIg455Sa1VuDabNurDvkx1VYxwW7P6jLP7os0cIedd+4d9gClCt9pn8
         Mfmw==
X-Forwarded-Encrypted: i=1; AKwUvBwUAnyqL3zIEpoWOR9VPU2HHIf+DjDqxjayd4MPVH93JFqwsPSKjFoPIWB12fqg0CZNbuzGjyHEBWnc@vger.kernel.org
X-Gm-Message-State: AFq9FYIeemg3p+TxiFObDGjdpaIRljoKpY4hzswuF7QDH0BZPDaSSXOf
	DvlK6U/4DyeAGmNfjGbgMk4JLHzJfbpevQ/cRKs6pD/n7851l7My8TMFbn2MbFcNM1N+jkDw6rt
	y94tGxJtxIg==
X-Gm-Gg: AYBFou0oditGU/Z+yFgGPocdzXZLg9GfAeCXFtVlV68Q7ERw9jfFiAxMCzcPXtJJg7j
	3nnTY/k4ZaQJ8qXR0lTTuvtEeRIeMCASf9AKwEx/Am3T1Blf+85ZyZIZc8hQJVONjPPStJjbcrD
	xTh3XFW9pEcjDhSDHZ3Gh7N2dktK30SkdHIkRMbQ0EeUJsiUZ691S3YK4IARMB9nWlI8yuwmvy6
	AV++YHfM63vpGFmviVuFKHV+s1YnBvfeRTnROMZtufnv9IvoprkVmaJ81uY2AjuRz6vlNibuqe7
	AgXi0LX6T9MRuQ0K7/s1VtNy2ZFOfdTC+Cjzptdo26QOGbnhnjMi6CGCRRw3sjw77C1J2ZSn1mF
	aZVvfWFKjaslZaGAfmwFcCjbq4AymPVN67j2ONig6yKddrDlwMh+DUGvv3AA+2kvijLdiB6LAeO
	OXHKUw8UjeZ/VDwloJ+NYuyDnHB5iHfi2Mei+lOBuHmJPDN2AVTe06zccHCbERHz43UXnDLMVeW
	czQmf5TIJlZNAl3kqc2CJKfxRpXkydiUEYXqRGqwp5MUohJOifFkJb+7bSLvRC3xqXdCLD0hMh2
	PiNOOrfkhrlf6jMyZ6vczFAaGIRw9t7dI2POrjmCA57p7khcqV+xWXB83hUnWfx1NCRVEcojkmg
	YeV0B+s6rDaoKmbsPuEQ4/YMwGA==
X-Received: by 2002:a05:600c:1f87:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4a966a563ebmr60980175e9.16.1793203590626;
        Wed, 28 Oct 2026 09:06:30 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:30 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:07 +0100
Subject: [PATCH v2 6/9] ARM: dts: omap: dm816x: Update USB node
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-6-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2910;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=slycG2bg5gDe3DFzSfzkYLyssn6vrxkDhJMrxvxkKfw=;
 b=CAn3Pa2ZHnYtIwdjo6NSmPuazofF42Njlg4liHLqzDNdRICH3wGD2TnpAM+QNrywnOh9XkpyP
 YVhwhSGAVfEDcW7aKsQtTiqLmkDtN1AhmfNWnU1CKy0guzhJ8JEi11x
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

USB node was not working correctly with DMA enabled as the supporting
code had been updated without updating this SoC's device tree. Bring the
device tree more up to date so that it works with DMA enabled.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 45 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index e3d49651b44e..b839ee29e9eb 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -574,19 +574,28 @@ uart3: serial@48024000 {
 		};
 
 		/* NOTE: USB needs a transceiver driver for phys to work */
-		usb: usb_otg_hs@47401000 {
-			compatible = "ti,am33xx-usb";
-			reg = <0x47401000 0x400000>;
-			ranges;
+		usb: target-module@47400000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "usb_otg_hs";
+			reg = <0x47400000 0x4>,
+			      <0x47400010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_SMART>;
+			ti,sysc-delay-us = <2>;
+			clocks = <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ti,hwmods = "usb_otg_hs";
+			ranges = <0x0 0x47400000 0x8000>;
 
-			usb0: usb@47401000 {
+			usb0: usb@1000 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401400 0x400
-				       0x47401000 0x200>;
-				reg-names = "mc", "control";
+				reg = <0x1000 0x200>,
+				      <0x1400 0x400>;
+				reg-names = "control", "mc";
 				interrupts = <18>;
 				interrupt-names = "mc";
 				dr_mode = "host";
@@ -622,11 +631,11 @@ &cppi41dma 11 1 &cppi41dma 12 1
 					"tx14", "tx15";
 			};
 
-			usb1: usb@47401800 {
+			usb1: usb@1800 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401c00 0x400
-				       0x47401800 0x200>;
-				reg-names = "mc", "control";
+				reg = <0x1800 0x200>,
+				      <0x1c00 0x400>;
+				reg-names = "control", "mc";
 				interrupts = <19>;
 				interrupt-names = "mc";
 				dr_mode = "host";
@@ -662,12 +671,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
+			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg = <0x47400000 0x1000>,
-				      <0x47402000 0x1000>,
-				      <0x47403000 0x1000>,
-				      <0x47404000 0x4000>;
+				reg =  <0x0000 0x1000>,
+				       <0x2000 0x1000>,
+				       <0x3000 0x1000>,
+				       <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";

-- 
2.56.0

