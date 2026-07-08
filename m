Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F67C44CF44
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515246; cv=none; b=WWoY7YIrB5a9MHQG3sK0ci+xqHJUtplOgVA2COEqBebC9LMuEYjuzNXRmCzSGjU+Fyl/Sr5x/eUxBNRK4ojQMEX8qx0SaU/HKFs69f0g7m2EhR1t4QVT/q9sZ/xEYIdhsCgbdx07gsR4a5mgtrtcHpxU3wZyEMouzKOf3WVQREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515246; c=relaxed/simple;
	bh=HvLyqg7Qua0ORp5smhaP7m8U3nYEDlbPGJuq6Ek8GB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y5fxU3K5pH2rt06CU5htWep8v9slO3btzMcLp7cTWG4slYDZy4KH9gakHbsESIBc2wRtmGQyQvGMSuJ2DLftKiq6DBf2lyH/rMiOwYoy5G8t48Ne+xc2F8pfSGpsXpYt5tz4OnlN0UvF0ymOht8xvvn6Jj2SVFtXyg1nt2j0Aa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxvXU7ts; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxvXU7ts"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ba701891so4547495e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515243; x=1784120043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Zs1qpHbMmmZvUssGtVaPy9WYFM8EnjkoIegyOM2GpY=;
        b=OxvXU7ts1ZPbUxMjqrMVhsgOqovUz8cNTeEJHgVZXNXoMoGVFkYVJ761dkZSkv0KhM
         P0qqtM6T/Qkka1PnbHudoApPczJU0xESZhBq2XeUumAYRYjO/Fw5EzIsGct8owI279BN
         IbufqM4aMEsJpJYFGaT6hW8+glfly3Yy5MLQ5GaVkS4NxhdNHcimI6WaFO+bv9sqAznn
         6VqXgYyMshJ258kcUzMZJdt6stL0u3AoiwRSQ+9k7oOKCrZNikr4pjr0nDel6wonAUjn
         9No8sMSgY1kMq06l5dWTYurTa6v70ib//RAd7LEHBBzAPrTTTLEoK64BYpyLgtx9Wh6p
         +6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515243; x=1784120043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Zs1qpHbMmmZvUssGtVaPy9WYFM8EnjkoIegyOM2GpY=;
        b=DGFQeftlcbSKe/BW9jojxhYxJeZTV25tZ7tZpSDLukkHUA2cs70nznznL9EHj4czp5
         hGfsVt+VbFhdL4aiE3kFcY3mJL8HJRnt4w6v8csfj64y2/9/0/8IL2+oixch93PQaT6O
         mfjyrGPYUpu4gbwmtOME4qGMN1JFOQcmwtvai5Ev+nnL7osUcs5PDfKFkA5uqhzfn4BR
         7ol7Fs3BrPiWsaqw3BnNO3LCuD7mrgqg1mW2UsAQ4nB3a2D8hiapm3T0GqLmXOlNSw1F
         JH+LgI7p34wiaszrs37QshZqF2hMWHk4/sQiQ9CwxbfZMMHLX0UUVwOUHz/+LxnHoM3k
         00tA==
X-Forwarded-Encrypted: i=1; AHgh+RqaDX7mUhbFjdGdrMq+JDsBdNnUZe7j6fADJ6OMZg6Sbeph8HjA/Oq+8ZLZ3WXr77ZA9YCzj+TeNZxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYrAMe2gcW/0fBHUrWgfts+2p9wJGtsF3rdDWoa8sMReBl3kH
	+vgYBnindYUr1KY3Z680tIkw3xnqDsWwfWdOynVapk7L+ak3kOtu3h2S
X-Gm-Gg: AfdE7cnvIveFiyuANljpKYSzOZTe+yjwzSooxLgfxZ/GTxexl+GB6LxZaMilKfHn9Zt
	PbrYdWyZZ1U7IKNLOeqztE9d45NVVOBjWHGcsQMhaUw9ubJjG7udbbX1RIpGPtzks6UwcjYZrKi
	vanM8ZkxtLwikKi9UaosnvSUAj85xza/vga9hNXqVRtB0yEJVd7uceyaENKG6Z2ENyizmNrGThB
	nv9fY7geUjjZD/7ML5fpEzHc1FUvXDsqUpih2Azy9+LWmGgrUwGt3YMB7HYIbTDqaBUyJmO78DZ
	dutmgUQFcEhKcD0Y/EJs04gkdxdViQvycfVKHp2/4XoeD5BcE+wBOjS0aCmfeg/+vOCCjlufnbn
	HPBORMhCgOJYSlBfQQMx894Z1iMPtX7ZZHGjgM8RiKCyBq1d+jlWCS9QmkVQcycZ6ZgYI6DF6zU
	w3T/0YGMf7gBZ9P+/WwPu8rJQ=
X-Received: by 2002:a05:600d:6444:10b0:492:490b:a604 with SMTP id 5b1f17b1804b1-493e68dbeadmr19525425e9.37.1783515242624;
        Wed, 08 Jul 2026 05:54:02 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm143824625e9.5.2026.07.08.05.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:54:02 -0700 (PDT)
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
Subject: [PATCH v7 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed,  8 Jul 2026 15:53:50 +0300
Message-Id: <20260708125352.1915040-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708125352.1915040-1-tmaimon77@gmail.com>
References: <20260708125352.1915040-1-tmaimon77@gmail.com>
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
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 9e4fa2669..0e5feabf2 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -59,15 +59,6 @@ apb {
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
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
@@ -138,6 +129,13 @@ serial6: serial@6000 {
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
@@ -161,6 +159,15 @@ watchdog2: watchdog@a01c {
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

