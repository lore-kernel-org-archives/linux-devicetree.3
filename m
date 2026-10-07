Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE95540F72C
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358023; cv=none; b=qyryVxUtLmvNM5SS6lzgDTudBt9oVgvSyuK+fSINyz11N/eeCnm3FRu/edeH4LzZ2SnM2kLNe0P1jBXqb3LzFInclOXMn15/eozsg+MjYuBx7+MqTloRWivhTuBMgsJGi99VawZn4CA7tLvldzV23op9UdYRqbACPE7nfRNGgdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358023; c=relaxed/simple;
	bh=gHXc5vVBhh0VMQqWepgZ4VCObxga9kkWUFdI6aOi2Zk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OBuQ2fTkbMXF3wZwZYGk4nA6VlLar1DfaHwPP9SGPw4NH4r5xXXHsuw0DTOvBWEjIMvdPTZ5mF1Yw6Bpmsk6JDkRG0iHPcu4OARjsLx/gR+SRGIAzhdOUY0Kqv10ZQbCAcIIG/vKC6+kxHCL6+B+GUSl8cVdz0zsakD+ErcM+YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ/Ia49b; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ/Ia49b"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a17f65ab8bso2622245e9.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 00:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358018; x=1791962818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uizv41/IVC5pvt4ZD4nGKyhTPzmnLZ/+xC43YC2+lGc=;
        b=kZ/Ia49bwufnpr8/+2WZMmO8eFr70cLpXL40NabSTyPd6BQnsY5ei8APS9bETtMN3p
         owV7ZQYDcUmIll4IfbfZ3v7nE2+qWDkLqAxtniPt4eU5r0zVrwLgfS6RruPwOt6Ejq0C
         grS5E5JSRMpd45GbJCc0I+4641bVVxs756LgjeADL+U9U1V6FpxxHkjsVV9TLXT7Czm1
         rSCQk1x5y6n5ZDedybL4RqF3VQhrCEvgnKHfn0UJYpPJXiUqNm4tpOezLehGABQob5r5
         jWENxhGzb3/W0kdeT/XuD/ptzbElVknQMffedinFKDbCbf/vkzwmZ5LNHHqHeQTadcLV
         nWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358018; x=1791962818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uizv41/IVC5pvt4ZD4nGKyhTPzmnLZ/+xC43YC2+lGc=;
        b=HPIdxABPX1xw3M1fN2iFqrE/udf8tmxY3X8ODwLs3ZT1dBd0vPkwhNcsuXV57knsaa
         oWlJPAXUEUgMVlo7KPuRj/CrDSbFJxghGzrd/+ZW93nabiLef4YgvIWUZFBBDJ+SUR0f
         j7ojwNOihk6yXxYR3bjOWl1yiEPxHnAUggHwtlnpggpWoKdqRuN33KOdInGqJZJWJP5H
         eaiMCc5Rwj4OWqhYa/9gckq0wsAuoXHzvCRyRtGPNBmgV06ePTcZPdiJKPeXe9jalyyX
         n5MYKCH6X4nvTQTVl3pE2o/CIygskR+GDAujNfTEW4RHe5zagzeFcQfb2a+2iMv/DVKU
         2SAw==
X-Forwarded-Encrypted: i=1; AKwUvBwQbpxM//wEp8YkXw1bMyvilSn7S512SbIgiMvbOhgaMdUgoMMGbx2vZbMqYOtphileSkvxr4V6tS88@vger.kernel.org
X-Gm-Message-State: AFuF++ldClOKxCxJPKPvXC0lyQedIK2U8jrUDYQ5A+MSllgyNoAQCzEL
	0jCuG9++bMnay2P0raGanJolkYVkEPsWUSTmvE6ZS/dt5302cGTe6mk/
X-Gm-Gg: AYBFou0eskJkjL7/6ewPkvwZ/GRDkg88JzJbZOQykPLmr6GDBEQhHSqdWjSTSKc0lBZ
	x6c7exFTRoJdrVPf18r9BMrUxHarBe1AmiD39tW3vpdwGsVrTalppAVSDNKJQdwKaV+Jies4qXN
	XFw0JawJ1cH6CgMr4BFFzaxWUodPqLkXpEDnNlCIGPwivcZD54wV1se5dZzMqcVgwP5novZmdqV
	RGWEy7xBBA+regO9i0kbqUNZgG+5mgytpG/F1Jg9kTROgh+be84EQmYBShKpbTYenaA3Oq/MqMP
	d8aZh2Luxu2WMbscc7vvE/lvYR+wFKGJFVRE5b39kp9/69+qVBwumcY9aouCbm2sFeZS2JvrGgi
	zwkdUIq0mMO9lpPwlnZdAF02QXilyInryH1stwN7goxQo97ACVKoEvAf7GsbvtdKEjSfsm35GIN
	Q9lBumeo841eBkKMKWlrw52EGLIO6LqQYAa3N5f26YDQL0XCXLsnHsxQs0+WbtwJ5El7Ea3Jgfm
	Tgk6nUm
X-Received: by 2002:a05:600c:674a:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a1800cd6c5mr17268485e9.1.1791358017994;
        Wed, 07 Oct 2026 00:26:57 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:57 -0700 (PDT)
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
Subject: [PATCH RESEND v10 3/6] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed,  7 Oct 2026 10:26:42 +0300
Message-Id: <20261007072645.1618147-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
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
index a92fbd3..542f27e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -58,22 +58,6 @@
 			interrupt-parent = <&gic>;
 			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
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
@@ -137,6 +121,13 @@
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
@@ -161,6 +152,15 @@
 				clocks = <&refclk>;
 			};
 
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 		};
 
 		apb@fff00000 {
-- 
2.34.1

