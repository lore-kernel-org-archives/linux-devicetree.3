Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9CB421F06
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964540; cv=none; b=kQ0OyBlGfg5/8YQUYLv3Bg5Eb0rdueEg8d6krrX/a9/lrl6Q4ZFrc+ie82MexLL0monLsuee2YKxIkhK+4j0JLmJxMgD64B6HQKqdvSEPM/EcVTffDfvb9U3ytehcOMgS6HU0sY2xsfTQW/Hv/z5jo6ETIqVZis3C8hVBj1sCfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964540; c=relaxed/simple;
	bh=yiZOkNnsfOxULr80dVoBjXh2GPcUsaBp57/+YELSAzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F65ePxofn0f0+2/7BLUsFqALAE4/NyGMIVSFps0y4DWEmQJyESlxTshvHtjiUs1xBay8FLCa3716bPKWNHUCBS2up/4aIxyxee8DbqiN5mKCC2e2gr1Srzaf0Lw1kW3H2mnW9FtZCQ4XzsTuh9Vx6G9nk71HKx+KIBqOQt+wEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBssQFpU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBssQFpU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso35001325e9.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964536; x=1778569336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCW3P85cvh30kejpe8kPs02BqysaCcYo27CePRnAR2w=;
        b=JBssQFpUjOMRrXeXziGnXONNrnEXD1/N2c70Q7pWpYBcWfAmkFsQ7LAAzwhDTVuA+k
         JgYpevQrILlCqRMY7Gs4gNO0DnuPhXJEf3FnDp0H+I+u/jgaoVfNYcE29J1lq067nVE1
         CO9+3H9lurBCW8y0beX6xZP/pUSOibUor35+JY2CAZGOHxpnRYnGmm8t4vgSVJj8dCy2
         M8KSlcddQ/wo2S2ll5Dl33sc1ot4c0Jv0HnlUvNr0+vHbqonNmpsWYo0dYrPSCF5lL0Z
         OKHhyL56AwCPariTa3v3iEGbQ2brGv1DAclT3iKsr4de54SjiySnFonoCZCyww05NP/h
         /KeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964536; x=1778569336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCW3P85cvh30kejpe8kPs02BqysaCcYo27CePRnAR2w=;
        b=DHudQzSluSwemJnNg5Cl+ISjruqxkdl7LqhgKtrv3pO2eLgNDiBcekJN4u74srfiyu
         LSJtsz3Sh9bOipSpYVrnK9Uqe+Yo/ItaJ974iUvOh5KlEwbpUPJvB2/OLDJ7JV2ZGENV
         1g5aORhhn65/h9tI4c3ni3UlP3VyyJexqwFKU17MiIBqCYYnkbrqCuR+uRgNSBtuIjQy
         uQczKoNahTZbbiPst4fk1YZ9D407uEk8fCU3/Cjm71s3ZJ1ucqJZD6T4TH/GovG8sIKk
         nDn13tLmTylLo6cTyjBSA30nIz2mN+xtZOH4+fIxJZus0Eqozvn0kISGU6HcwwO+BIVQ
         3AHA==
X-Forwarded-Encrypted: i=1; AFNElJ8h5Q3ml2YYSDZRTpITQD8In+YQQkxiW6ckeZgsqU9hDIyHiOfTkfrG/7MDPUGt6us36op58MQsz999@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4k7w5bO0k7nXaoR4smw6Ph/x5QOLHIPjmk6V6p4XczOH12oIs
	X5ljKjy4OJs+3aViYH8rQibBa/yuV5j8FRBzmLRQSwsCqN8ner/uBCz6
X-Gm-Gg: AeBDietWPZZcEIgzypA6uC8vbJMCPEkqb/WeEkzgR/ggQAn+u4dncHcwrA8i2KEXSAW
	Kl6BX4+beRGj81pulcs+eLwY92GyWisijhArGUJ7oNZujUsUwb6rLj4vjf8IN/zMy38C6LPGwav
	11YIhoDHFDvn9AAL9CaQRHAAmvRMtnygMhZZ0IHsEbu/5LwSew0KnkoTNAffK3uV77yZXuLKsA+
	j8SDDoFMOlf27OofuJK/gmt7QPwx5sr6oi9Ik8VjXXmYiofKx5PbAkrvRiZunfrGkUhe8SiOdQX
	zSaToL7MivQm2j7DPktikvXbeEhIDJN828q7LpdfINrXxdVSdQ6a3iNbUN/6lkvBHoohB75e+ll
	5ly7ydLaok2t39+nrBlchoHWmC7nffkn9WWUGE5UN05VImXmSAgTWf8OFahIl9rTSsQCrEgtjQz
	G9S+EHdxQlPICr0xGLQQmBkA7yB9Bt75rIkQPdw3XZfALQGTtoybxKgnA9zkM=
X-Received: by 2002:a05:600c:a46:b0:48d:112c:f582 with SMTP id 5b1f17b1804b1-48d112cf94emr88852435e9.11.1777964531080;
        Tue, 05 May 2026 00:02:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
Date: Tue,  5 May 2026 08:01:54 +0100
Message-ID: <20260505070206.7932-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add scif{1..5} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 0cedf5a38291..f0dbd700b538 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -166,6 +166,96 @@ scif0: serial@100ac000 {
 			status = "disabled";
 		};
 
+		scif1: serial@100ac400 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x100ac400 0 0x400>;
+			interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF1_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF1_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif2: serial@1004c000 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c000 0 0x400>;
+			interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF2_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF2_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif3: serial@1004c400 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c400 0 0x400>;
+			interrupts = <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF3_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF3_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif4: serial@1004c800 {
+			compatible = "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
+			reg = <0 0x1004c800 0 0x400>;
+			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF4_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF4_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif5: serial@1004e000 {
+			compatible = "renesas,scif-r9a08g045", "renesas,scif-r9a07g044";
+			reg = <0 0x1004e000 0 0x400>;
+			interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A08G046_SCIF5_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_SCIF5_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@100ae000 {
 			reg = <0 0x100ae000 0 0x400>;
 			#address-cells = <1>;
-- 
2.43.0

