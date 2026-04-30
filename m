Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBCE402B8F
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553635; cv=none; b=p62IbnZJWWb08pwL8UJyPDiNsJnIMgHAK7dio6wOBPKr207E6lNtPafz7rGt9bZZJDFX+DlECSdmFhk9m4ZvwXsPbP7SNpyqaccoslMxkAqT60Rk8j+rT77Dgll3+luII3mNGgqgbtXjjO6hERdSipri9CyXyRUBxrBoK4uqIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553635; c=relaxed/simple;
	bh=YQIfS26jvrHPJO+3OEX8X39JX9m56jb+tChw9+nyM+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gf4IhKqo5dHKKMvNrLLZIZfIk/Oe2mP8smQPgX1e3c9M57HMPYYCMqOoA3CqrSR6lJrVajsCe6ez/73dEHyiM0i1djB6neRWcWSFF3NjIfH3J5ZBY6fTZNFljWq0B7oAYTjoJErAn1SKDrw+5fK7r/+kH1Sbmu+cmpIVEbPOF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiJproqB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiJproqB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so5090885e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553630; x=1778158430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4PmWsl+VpxDeREtZmv2hm9P+Gs6imFjooqUiVKxd/I=;
        b=PiJproqB4YSo1d/Hdq3rTIw8WOTQSAJ6981sa4GigbJAvjI4AOEy7Dmxsxr49V5zE6
         j7lw7/4jfr6ygIB5he1nXb87JnD3io0pCiKU17yptyfv727ZR6GgZcNtuhdqz7aqLwAS
         WgoVOs+EVJZVesziLOqsyS/dV4YUmNfn/SYWaxwYOeg6OuSDUlITYiKRR0O0+7yMirI1
         wcLao5uyA7lRsJceJuZ5md2PG1swD4Cg7s0avBQTeGOt1kvKGxsWuNOsMkdx6DX6/kZd
         hxO4El2igIuSyBRW9+nQU51oOKZRByOH52SZpdAsZ4kIH3/XPQAVFCyYenbJLxMG7UGZ
         BISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553630; x=1778158430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x4PmWsl+VpxDeREtZmv2hm9P+Gs6imFjooqUiVKxd/I=;
        b=joMhEovT/Kzl5sEnW63b+Q1v5KHBJIBlXiKpE8uvzrcubgGXqs6WB3QV4h/cXwyDZf
         96/6y/aHVmdv7IuAesXFHz1+PHg02HYfTBl8TUXWxIZ23rmPTaLTv2B/AwYLoKZNYE9Q
         p242pzILgqsglicG+qOx7lox9wO4+e3mVm+rwnEM6PE7IjKKn07CFb8lOYsH+57g/5HH
         Osd1ZX/MRna5cU8SQSs6zcFWu+e/ElKRagQrxUMIyOBchHDo4EJUcUtXRItk/eozu6VI
         +4RBUjQQFn1ZpguEP3tn1NgYjC89slyHYu7uXe24W9lfmKXBDVYNk6ScubUyWGwTLYsp
         iCgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IwY1CqO8bfxkf96rUgRYU3dO849WpO0zjNTr1nJG78E/lazNlD4naMW9ee2gBHtaXfD1mghzD4N8I@vger.kernel.org
X-Gm-Message-State: AOJu0YzX00GsC9cwtQU8D8wv7I+/x20Jp+aHSGbYlukAa5UZXZWWAgOE
	QlV3lXSef5LRkd2cf88OCHkrW/nYiHJ31El1g4DizPgfCiKHAs9J6ftY
X-Gm-Gg: AeBDieukMSZtpS88cfX5iTGA9cNe3l/O1wmC06U1JpyJ8NQ0DQJpB2xQZsM7qWy+rvO
	FhV3nNaOm7F+6NuGFYfb0ge+bcpp30/Gvwx1G8fYoGgzxd9W0zXV6uwKRjFDmzKQtfLYMysIIXh
	u3Tl5E6Qh4wa/LZZNDXYlbOlJ8ldP2XC6x5O5PYUSCXscsnbn7sP5JFcvj1hHnj0Rw4tFLelUOy
	lflRyh7jdy3efUYRMOMwGCI9YTWNOB+8rFYqwuFOHNdKrvU9+qtO0mAnvkVgQm1/ybFX+0Wbnim
	FNa+SuhXEq5+ux05narFzGB09O4PYQrLQ1mBd4CGq2f0zM5urRy4M5lFSUvoaJR2Vjsj6ksipCa
	s7gFJNYyvdXga490mP5TB4Ezoe2StH3UTFh+m3nG0NwFe9i79A6/Vwo2exMJqYLpkodgmo6OqKc
	tiWuF4V1g/ExfyVfKgizpfUSLpmUpw+JOvn6rqvCM=
X-Received: by 2002:a05:600c:c049:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48a844683edmr34819515e9.15.1777553629708;
        Thu, 30 Apr 2026 05:53:49 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:48 -0700 (PDT)
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
Subject: [PATCH v3 2/6] arm64: dts: renesas: r9a08g046: Add ICU node
Date: Thu, 30 Apr 2026 13:53:06 +0100
Message-ID: <20260430125342.439755-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add interrupt control node to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index e52498b3a745..232a0e299df7 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -210,6 +210,96 @@ pinctrl: pinctrl@11030000 {
 			/* placeholder */
 		};
 
+		icu: interrupt-controller@11050000 {
+			compatible = "renesas,r9a08g046-irqc";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0 0x11050000 0 0x10000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "nmi",
+					  "irq0", "irq1", "irq2", "irq3",
+					  "irq4", "irq5", "irq6", "irq7",
+					  "irq8", "irq9", "irq10", "irq11",
+					  "irq12", "irq13", "irq14", "irq15",
+					  "tint0", "tint1", "tint2", "tint3",
+					  "tint4", "tint5", "tint6", "tint7",
+					  "tint8", "tint9", "tint10", "tint11",
+					  "tint12", "tint13", "tint14", "tint15",
+					  "tint16", "tint17", "tint18", "tint19",
+					  "tint20", "tint21", "tint22", "tint23",
+					  "tint24", "tint25", "tint26", "tint27",
+					  "tint28", "tint29", "tint30", "tint31",
+					  "bus-err", "ec7tie1-0", "ec7tie2-0", "ec7tiovf-0",
+					  "ovfunf0", "ovfunf1", "ovfunf2", "ovfunf3",
+					  "ovfunf4", "ovfunf5", "ovfunf6", "ovfunf7";
+			clocks = <&cpg CPG_MOD R9A08G046_IA55_CLK>,
+				 <&cpg CPG_MOD R9A08G046_IA55_PCLK>;
+			clock-names = "clk", "pclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_IA55_RESETN>;
+		};
+
 		sdhi1: mmc@11c10000 {
 			reg = <0x0 0x11c10000 0 0x10000>;
 			/* placeholder */
-- 
2.43.0

