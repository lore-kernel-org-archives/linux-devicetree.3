Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05A47CC69
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529989; cv=none; b=pH1GgjkduDBZ2poAwRX874EZ7vaV7xzcBILw3bC+ea1dijIcTyFTlKlwBMhOLIqxTLffcHDxTavGJqM95y+ZPX6B+UPZnMQuGBbdGCr920CPfeqR7J1QPX2obQSkF/05B4afHziA4eQFMroE/CJXGbbQW6ZGyPBpJ4kkIO4ZeXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529989; c=relaxed/simple;
	bh=b/8+8Brx9IhRa7AiwFOwyoRcde8N1Kp/KHSVRoPhoNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NO/j9kx50mV1KyJCswyhD4PsBwTG/ZlkOAWoEN2vdTwAKmDJKJzK6Bo6qwy5liMOW9P8Q45HoFc6r0De5MV0S/gqGj9YOwT4Noo381wOwmSw/yWBrmOHg/frQ07/Mq5pHoA50ypF6Ra2O2/+4/Bw1CnNBo3GV+3KPNjga6SObPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZrUJi8j; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZrUJi8j"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c83474ddso8340295e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529984; x=1784134784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
        b=OZrUJi8jDBur1wJuJ0Wv94jkDjiSsJyaU2k7F/Fk+l9pVJcStS9ynTY6mxViFGCnm3
         gl2f3JFQviPQ/nzpRzbs+hvKrVabeaiNfcOzqSsSqhYguzWnnDjkDp29dowa/4UuCxg7
         DwuP8wFoxYofcCrPFFmE+sEcNS1SDl3QksLJMpFuwzu2Gse2JjnTCvfEtwQjUVzY37wK
         DKscp7+yhPK0Khz3JM3eJ2it/cNkqxCbzENMhe7QRgfYGSIegX1kR1ZAqK23PZ0HhiQ+
         DSzTOqDqDuhRlq+ZCiHV3Uy7B53/n3DIInTiI8jTI3Zhazsb/TcneTZMxPc5PPuU/HZk
         h2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529984; x=1784134784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
        b=eVGVJbx2DPZrQC1byxcq8nLuDepdbxiJGs2U6D3+qWOiuNxCwnn8u9kXF/XbFqGLZR
         jYDWqmO6Avq38MsEFraiSDwqaqLAO7H6f9VRvlu468gcRrP0wVWqJUFMgRansgpua6an
         uhsNIdJt/cmUo8LyTwPBbAA8swfjMXHUm7FetAmXh/IecYIOuhnZj8V8w+bwTvZAu8/v
         9pxg+qI8IDBkyox6HKVZ86fJXaza2b41Bk0EWlqzPnzLZ32q05A5Gvpweq7PK5vk2eRO
         EfFGwwjkcoKUfV5SvbMjAeW8pWAUiY11qLoY2nHAR0qwirkxYCnNsxq6tdGm0Pc3kIWm
         i2bw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz+UYtVT1cMXeiI+Skj+by6C3+eEn3LJVWfmVFSz/4XPyNyWIKoSI5xSYSBS76ttU5wsSM+7ZCM7EN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1efD7w83nJsIKSsTDhp7BN/5N886xLsAcerVMyGGZs/T5YW45
	Bi8H371NMx9jceH325IVuBwUDAAQDkGpEM5WsO2aI4MT519NWeVGdZq0
X-Gm-Gg: AfdE7cnvUGXB2tfTLr9aZsReXLJeXBLroZrP3cn2pxOHyGNL7M4Qub1fPe7rOWI9XaV
	G8+ZCZxAQ1qqj/J8t7YWNY8MfIGbC2H4e4OWCc4qnTAoV5jkdold4y73bZ/knbfYz3gL6pQRbsj
	mku2g1+jVmCb6L80iYdtud5DjysW8djAr8x3LTGdot6UNpW8NtGab39A/3UAYuWcGfY2/nyHoZG
	yXXlbc5rwUXWGVSIftNStE4ZPHuGQ5FAl0lsa4wmokRFbEHX5+LH0nSWk5AFwBr11r/busmVJoJ
	w6DnvVZ+RbD/4XLVDLEKcG7tC8GS1cWofcIMUYSYmM1n8skXy3AoJWbS3gaNzddqaJyCP90qM2v
	9LJvwWaYOEcqr71B/dchtq/LjLHGX2lFgIbh9k0vTanCD4+UqxqIb6YCBGAhT3Caos1g2CR9RnU
	cirG/jcrnFO2MNJwkkxDBzE6o=
X-Received: by 2002:a05:600c:3491:b0:493:c59c:94f1 with SMTP id 5b1f17b1804b1-493e7e82e10mr28566825e9.2.1783529983903;
        Wed, 08 Jul 2026 09:59:43 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm141201035e9.9.2026.07.08.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:59:43 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v8 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed,  8 Jul 2026 19:59:27 +0300
Message-Id: <20260708165929.2233934-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708165929.2233934-1-tmaimon77@gmail.com>
References: <20260708165929.2233934-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 9e4fa2669..545034ac1 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -59,22 +59,6 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
-			timer0: timer@8000 {
-				compatible = "nuvoton,npcm845-timer";
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x8000 0x1C>;
-				clocks = <&refclk>;
-			};
-
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
@@ -138,6 +122,13 @@ serial6: serial@6000 {
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -161,6 +152,15 @@ watchdog2: watchdog@a01c {
 				status = "disabled";
 				clocks = <&refclk>;
 			};
+
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.34.1

