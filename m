Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA11A6803
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060032; cv=none; b=d4bePYUwqBLU+EVCwjQ5NSCP0aU0ad9JHIXvS6MvbmeaCIN/0ICK/GmjXOBkc2JthKSGBQIlUfWsZ/gc8I7ReHVu5KSfKEWl29WR+a6QujxoI4+7t1rMD5CkyVuR3lMOI8gqivABULSIKlJ/kfiWCOkM5oAPXRKdyup5Vyj2css=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060032; c=relaxed/simple;
	bh=o0g2OO7BdU6XXFLH/VSlItvSINdOQnE0hrKtP5cscCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMaq54ANYYlMkFmEFBS3ZAuiQoOPF1oRhPd0HzRkMXdzzF61kneI7PqRk2QHss37eEHBJTq+D+ADgVPQzM7GttbcQ9wCVLvG3KEJevq5PPy03gF80AT+qxTAf8JV15Peg83K+IJ9fNEtGIlHl68JCsdVpXtvq4rH49ccOVZHaho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4cfX6+4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4cfX6+4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4905e190c71so66139205e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780060028; x=1780664828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QfE5wzsm49PMrPR2kj5UhJL4gTXkDTQA7/9UJ5qTIU=;
        b=W4cfX6+46VbnlwNRDzYZrc7z9eF/bdiXMdmXXetTiAp3/Yz/sGR19UuR/r8kqbl2b3
         bg+Yreo1yajxmuCPsxYPoRdpjeV7cETBHVLaS4zblt4YCq5IK/nkt3+MRdvR7uattXB8
         5PP/OR3CUl7u8zTzKZLStu2SsmC9SUdVQTvfVkJktHUgwttihcIlZ5u1mWv2G6O+yTIi
         LveWfZOGwhy67MBHCxVJISE2qsFI48TIGgJQIZ7qUhNymSvARfzXFPx/My7fYiZrC+Uv
         2jshRzyTVGACOgEs8zSa16VsksXMbRu6NIRokuZCtZme2sK8gaW0Yl0SmBly4JOUGubU
         jcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060028; x=1780664828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QfE5wzsm49PMrPR2kj5UhJL4gTXkDTQA7/9UJ5qTIU=;
        b=mxTrUQwPWJ3l4RvWBdtxeWf6zDpZHp2N41ItaD18DZZyZ1+EKwgSBMQTfKank/tyg/
         wEdePcw3CRnkyVKvGHEo9YrWXzdCfiQQMqihlfKXgsZ3ZUEj5yZ5tXiSu5Ec1FtaaTut
         FIQiuWRxjl/mrSyYkreP1V0ylKu9Nm4cu6npxfAJm+iYDWYeHIYFAO70DlvKKhVuOmqe
         TMPu3odrL4Vl925Xn2tKeAH8qXJ1cEGdP4v06jQNzeOlzig8LBt6Sp5mRNCoR78+qOlE
         0yASReUkZYVwIraZHpMlmh42gHdkXVirYcLhjjHvIVXVX4qQzYAsDgO0e93vmr3izUnQ
         NE0Q==
X-Forwarded-Encrypted: i=1; AFNElJ828TnkjPGCXI3LGqms/Qd5+JLjnZpxXfKfvTrxnNzhJhB00UR1D2ee4fNz9lnk5XcDmx1U1gRbvUJD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4WiOvXoray+v/VsQ2n2Kkz1ezgWqYIWcAYuGg+7G1xsOCBEPh
	rtxo4WKPnYgEajv2XsT6KNuMmT/fpHVU9u5IHGCzD01vxxZSULjyxAwT
X-Gm-Gg: Acq92OE3FFlvbGMQ7IeHiLPi7crnpPKW/jth4mHCKfWj8ZENLPSmJqM0eqFG9YmRZoj
	iDuwVFhvqcms1FpS4DyyddEnAdDi82ggYirUTd3+SGzFWXLznmVGZbVHzVJ6hCyhejmI+QwpRDx
	jUSClITOH+QCGyJrJcHDGDSkRbkc4S4qVvcvtYQeQ5DMdk6k84qC9PozLZKbtWlFWkS87Ij+zg3
	UNJFgvo4WpmezUQPPtN7+rhvinJ51B9aPGGh3z5nhNlK7d1bUss/APpzzMvh8zzOqZz6wg86bdY
	QqKMHN2IO0H3NqFUIfopInxSoywGcaPWJTQjTeRZE3vJ6EoBPdDmEBEYXXrMfss1WFedzhu7/p1
	zBHOOBFXkv/cubP+tx/LbGI9uXddMjRGient1zX49zcB24a8UUrfIGsjGwrHN9VS3sp3pxNnVJj
	9+i/a95Br9ar1cvQu1naN6jUcoDzDdgrNBH05cQPsU1WaeuWdlp+HTCMpUNSrBXhsv4utRVA==
X-Received: by 2002:a05:600c:58c8:b0:48f:da34:ec4e with SMTP id 5b1f17b1804b1-4909c0af24cmr30005935e9.19.1780060027738;
        Fri, 29 May 2026 06:07:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:df4f:8f31:69aa:c094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909dff2a80sm45247225e9.3.2026.05.29.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:07:07 -0700 (PDT)
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
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
Date: Fri, 29 May 2026 14:07:00 +0100
Message-ID: <20260529130704.327505-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529130704.327505-1-biju.das.jz@bp.renesas.com>
References: <20260529130704.327505-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three RSPI channels on the RZ/G3L
(R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated reg size from 0x400->0x1000.
 * Dropped num-cs as the hardware has 4 CS lines and the driver is
   hard-coded to 4.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 03bdee870528..f948ae32f6f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -442,6 +442,75 @@ rsci3: serial@100f3000 {
 			status = "disabled";
 		};
 
+		rspi0: spi@100b0000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100b0000 0 0x1000>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 444 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI0_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI0_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI0_PRESETN>,
+				 <&cpg R9A08G046_RSPI0_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26f2>, <&dmac 0x26f1>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi1: spi@100e9000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100e9000 0 0x1000>;
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI1_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI1_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI1_PRESETN>,
+				 <&cpg R9A08G046_RSPI1_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26f6>, <&dmac 0x26f5>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi2: spi@100ea000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100ea000 0 0x1000>;
+			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 453 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 454 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI2_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI2_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI2_PRESETN>,
+				 <&cpg R9A08G046_RSPI2_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26fa>, <&dmac 0x26f9>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		canfd: can@100c0000 {
 			reg = <0 0x100c0000 0 0x20000>;
 			/* placeholder */
-- 
2.43.0

