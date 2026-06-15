Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6AC3F99F2
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533563; cv=none; b=jIgF1wGPGeJAtdVj+UxBxpoMhSDtXl2wJQASlctgeALCqa7kvcHwfthZKH8ds5YJ7ilCgKhMpKloR6sbADbhFgQbHrnrNHA6lKkH4buDuW4SQfv3bhfKhYYnpbzJtm0AocIkETtOAH9z0y0Cz9kYCAIeVrDEkzqN0rfLrEU2i/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533563; c=relaxed/simple;
	bh=4L59kWPU2GTK4BDITFqFCB5wF5Pp+LPTRabGv6hHYj8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BWDNVmGND99710xY8RYDjJ53LhNExXEskI6rRJyZN9xwLwFqBu6BH4JJj7vcMgOJN+jNGEPD0kMLvARDrb57Xg7ahzmI9NXDACoIDpgsOfWUYJfNnzARrzm3MLZBZuZllKO3XnzypDCwDAaVyKXkE3VbGai28IarfeAlGzb4iVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4gDX2l6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4gDX2l6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b3e03939so25488525e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533559; x=1782138359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
        b=H4gDX2l6p/lFT6LpKnP0Clzf+8hB4ctVwT/fCqRbWflhx6gy8ATFHgNtKm6CbibVAG
         PJDJNIbCeeVb3zmML5UQKSfyNGkexsbVtcPeb8/PE2KPI8bwT6QiftDn8QZZjQ7usKdr
         pV8huzsUECFyz24gvVLIuclvxJiZlXQvdz1AmZsPwrJUWzB5FD9cPg+TTxdAOVnlka0x
         RcH0WE10Zpia9BO//192QBpCQvYo8VfT45iEZuNIGHx25eUAm3GXNhbB7jaMsbZ3lVY7
         drQ//LE/PwFCfcZX3Y4IczbqdsYBmWBLZAKQJSEe3sCopDWTyu9U+fNd1oRNsmgNAtZ/
         VKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533559; x=1782138359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
        b=oBjFvi2nJQg40/Ob9zuJVrUMVogGmkX19HBLAQi3V6Pr83YeIUfrzZcGQUucQ9oSWt
         0HTkIc/AFbSPrYafThjrUq7fAvMkz9ibh+yDheyAgQBWcRGRuPp+IAKfclHHcgyTUqhF
         KWxoDkXueXomjWpTWh1sGSuVwCtHi9e91AMMRGAw7Gv4tG21OQsH50wL7X8urP0PolzG
         t4j6cuiR1+Dl4rbeJHBlfD6ep6gcqfnm4OMTrYx5R9ee51dSY7CHT+MH5gghp3xUOY6n
         nmoCdW8yDKDFAG1sWJYNCG9/US20fWYyZ1tA1VXDgU1kbZ4mOEqmLCSr1D/sRILNX048
         Fm3w==
X-Forwarded-Encrypted: i=1; AFNElJ9uNwj5b7SrqQDVF1GRrYg+pzAj3TPY6UGQDuSZCfPPmEQXxp2wXXNhMaoaAP924sijA/4ROlDy13PF@vger.kernel.org
X-Gm-Message-State: AOJu0YzcXytZSU2Kv3tPRzSxY8oom/AfK3sGAEvtQJgJPKcTe4dDja4a
	4LRyyLJXrORAdrGfj+KFvl3mKRLb8emnGweN1ev80Htpx/1GJWfpgdym
X-Gm-Gg: Acq92OHg6w815H3Lf+Ys7vF1cvljT9MrP650jSIjFF+jCPxbwMCp2k9lHs0sxxkstV4
	mk2xlmmM84EhpcyGYJUJOAzVQyuPqJ2vdr/MFmP+yWaOAPHk+B0Jl3QZhDE40FfNq3kZ2A3ORgb
	Eu6puTN0DfvaIfa0vFaar3ad+BOa4Xq7YCSHJQ0DaHP6q4eKFXC7xRi+nR/KEQzmM7zLG/DD9jL
	PM0djGljSzxOjTNxKKFvj2fPe7m9HbyJYbpqP2fB6VJo8wTzOAOPJB9hy2xHFy+0HZTDKyuODN0
	AE1NUW5o1l5tSncHFEK5NUgwAc2wqyNw52lltWIWlvSwwZN/qnXnk95+mduuWc2kBJjlDe7wBbp
	96+Z1TPooJ9sd6MQstbRl2w2EBClmya4QgOVi7TufpceFNRhPjh3fm22b8odZuActTjKQPALY1X
	gu3VWBACOC7ZAZlKghLljglRBbwUVL1ckgrQ==
X-Received: by 2002:a05:600c:3542:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490ec480e65mr161474915e9.4.1781533558821;
        Mon, 15 Jun 2026 07:25:58 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm273333205e9.2.2026.06.15.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:25:58 -0700 (PDT)
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
Subject: [PATCH v5 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Mon, 15 Jun 2026 17:25:46 +0300
Message-Id: <20260615142548.1373799-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615142548.1373799-1-tmaimon77@gmail.com>
References: <20260615142548.1373799-1-tmaimon77@gmail.com>
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
index 9e4fa2669f4d..0e5feabf2d71 100644
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

