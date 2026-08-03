Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D4400965
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756087; cv=none; b=K0pZ4VE3eLmaY5Mqh9PBPh/WjTHMk/0vyBvkjqU7Ux5s8UuZhwIkWiUH1B3F+wMWsbcqLCRY3GY6/Rk7MxUPQkb+YGftaUO2xqmnLXdECMAB9qhCSkuJ1YSnBCNuyzyaR04kVywhCEdUbLBkOXdvzrakIL7Bl9gcZlfkwvAIqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756087; c=relaxed/simple;
	bh=b/8+8Brx9IhRa7AiwFOwyoRcde8N1Kp/KHSVRoPhoNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J4+kDzhmeIKNHPu9SIcYyceoOzJLa9O8xGYQZPEpoQkUGvHwC9P4HCmoxsZJXg0gMRj8TG74m3KA+s/isrWURc5DlSMWdXNfD7AwBdLfPEd2EhxL20V6lcPRJ1N9QFUDmhNL2qCrXCatRtI4+z0+TD+kl5lMiPsqTLYla5j0tOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFPo7Rx1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFPo7Rx1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1629966f8f.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756084; x=1786360884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
        b=BFPo7Rx14+jTips/6JsE7N03uSRzlboNiMeZ3BlprduMzJ9zuV2HQGsKmOSoceNeXi
         TXJ/WuJSCtwjC7kSkKNboPWWDTcD7vbLiKTBxDFAZtoSkiTFbGDwI4eCZUPriDUZ1HBb
         f3fn86St4rEZ4QcbhzG/WW7cgyFZQ8dwSLPEwIvTCeuWKtB+F/hnF33dk9/403huvo9v
         oBBZW5RBSLMO0HOV3NTFhhXJyOt1RfC1xjrTyGPgnMFrL7uOKE0ELUlr/FqIllXoNPIa
         hrjPYQGjya/nJcjRIiWpzxokz7qqvL2Oq7LozO730Q2/HUSuUl9I5UVkmUhxhWNMAGsj
         coTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756084; x=1786360884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
        b=UG+UHL8B5Z0/N/uyFA229Vm9pzG5Oor2gNdTrylUp231CkJCigZTNvkCL+7S0xn0Du
         WLsmCFEILlYkBuNdaQ4v/GT6I5MR+pPCg62EogYkqkD2pnCmYuCOAPmurweZrJFUZB6X
         LLt5P+MpetvY4rHfbHm3ZhzkT1iQnWXXT2Kx9lVLDpZYAG/HZ8PBujFGndlmfYDHg1NO
         lB0I5NYh/Cr/64yEl339ciqPjX+QJCQE91gIlMHlqHoE8Tfwmc57Sl/bQbSPTF7LDAdi
         D8U3KYdpRA6DtlLK05u4GECZNk+/yzuBJGEIP34uUwNw6++f6qb6H0tP4DEbpDkaL8zL
         VPoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbOVl0dwMeHxY/DC8wiTJYZl6iyeOzBuvPv5oxgod+HB1HKgl1KgbfpoICOi7wkmcON0yYE7+fCYDO@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMsEdoXAifETyaPNBm7s0vP3NgOlDLgmPByKB0UbTLWRVqwz4
	sLRoz2rryx44MljvgayzZjd+/JAOjLr9BVu9uKbra+ZW9svvPIhuB2v8
X-Gm-Gg: AR+sD13Lq2oKJAARDJjvwIi5r9y+LrE6beyRoQZxVb4UsgHsQ//mz0ZU5p/DEnrgzmJ
	E2LVcTJCWDb/q1OvHNMkCac78s4jBhfYDdnY1k8cW7tJ5YE5cC925RuyofNZuyNHd8bEEkF9Ara
	7J3BCu/7bRZ+Tz9qoDtNkCcn9NPu7rceSp72g6yqMBdEk3zfeh8iEil2vz2Uu7AHlwrHr2RAIIz
	BIU5sNRCzpbCMFj4BV1R3EESAmMI+w7w/1fPSIoYKGA/iUfzdBSSxydSyAeiSf7SnojPA5i2xBG
	EqUuMYBTHLAJUIxcqxanDoY3P6aMHDqgPHNIsCW3DgvcZU7vQ2hdP/xohHfDhaKlH4OE3iM8zzx
	Ot7RxR2j3KqHg++9kdgFlLUqs+cK2NUwEF8ma3BNVVgUISgsaataD9A/vc1BveERQTfSpx36Z0Y
	0T72PzSbEpVZVQRoZQkaSiNmWfCdW2D50KtDQukOUYqkESM6NF56Arur5owcmkZ+IgWgY5Rs3J3
	bqo7Xzu1Fw=
X-Received: by 2002:a05:6000:615:b0:47f:81af:1a3b with SMTP id ffacd0b85a97d-47fd72c4be9mr24887791f8f.22.1785756084073;
        Mon, 03 Aug 2026 04:21:24 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:23 -0700 (PDT)
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
Subject: [PATCH v9 2/5] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Mon,  3 Aug 2026 14:19:03 +0300
Message-Id: <20260803111906.1931384-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803111906.1931384-1-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
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
