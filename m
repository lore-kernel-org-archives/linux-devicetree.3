Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5D33F59A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586344; cv=none; b=halCLZqTNPEingKhjQqXJhjIx0JoMQwwuWhISyTPvn6M9/zBVo9tKsyDZMmADMwtlBEJBmyUYlouJFUJ2mQz9zzed/3EEWgtTrUaowXgqj8CpK4ip9ezt6ES1Fn6040reeMuPxsE0JI9cfkLkNy+lQkqdlUh4oQODGOI9eNoZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586344; c=relaxed/simple;
	bh=CRpSLWc+6zDoJo5DNd7dh84E5+rddROJ9ABvBxZmhN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llfVWuZQtKm8MH7PY0dWqHnHWzed9c5jYxuhSsSWX9b3XhCs4MEjvDX5ZLiiT7M6pQVjoLtZtvW0ByrdXCJuV8pTWej07rbyBzhIZo5pCTKD7/mgFnMZ0C8DE+l6XRxPVOZs7UzagaSsx6t/Hqmd16X7FUGr+Qy8X3wC71yoA14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFcG6c2R; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFcG6c2R"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso8297895e9.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780586341; x=1781191141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/LibZY7W+c/BPC7aBAGNpRUQAiRLmLNuIcbki5KxVc=;
        b=iFcG6c2RhliYcUmpFoVEkXBokbIxDorzW1n18WxHW+w0h+YyGbc5jcRn+OvDEAjdt2
         0Dm/yqNEaEh0gads/x5OpbeI2sqZfCqPhNbtGzocPWqvMo0vzO5eRLvNs83eW031OpTM
         ZTdXb8NhgS63rlKOVBZzuLRT7ikzoThWXfmBRzdwHlcP6alegCJo5GqSNvnhX1fYvu2l
         SkqO4f9oOSck8KjLDmdCjiKtsvezKngG0/xNaWBQMdXABgoHi3zxYiOO4VjiCEwdqRe5
         fdEMpCVI5EXJVNv1EA6BISw1nooHrANdjgXxsSOeZIjGkGMJhRqm3u67ZFpJ0QKjP5Cb
         c4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586341; x=1781191141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/LibZY7W+c/BPC7aBAGNpRUQAiRLmLNuIcbki5KxVc=;
        b=s5pu8wnQXZ1puo/hwNtSNHv1ESd6iTIWj0DEEMqro4fpCsBVqsA/y0QWMLJXHxPaoX
         eRkcKLT2lJvSL7840nayf89JvlyFj8eWGFAHuDtu9dI+q8aPhjmuUrox/ns0Qmous6O8
         QhXhFvcLHXqSBb8VpPQqN3fgKAH9K2eM3X3/WOA15CCpGgvNKs60yUaGIHaJlxbAtS89
         pjUAQVQo1tXgfBlS5EXZEW6fnbanJYMujuxEJDkpvR5mhT7IGoil6sKqP68Np09YPwN5
         AMH1QFcNlFTs3DQ8EIQ42siGJq5yznMKPtzavJOhWrKVhD6MO341VgkZB6fnabkS81ps
         bBeA==
X-Forwarded-Encrypted: i=1; AFNElJ8OrdIBN7+olFN1I4YTds6V53JNZAWxeFk39RZeTWFRL4PZHpkbUZ+dEXCkGGOpy/oL6PnpjOOVhjkn@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNM2CuCaba3OaeYWHITm7RH116ICVwtAImGaiksLrSvCr4WbT
	VxQ6rFEtQbbdSmGgEoUKJlRxvnz8J40ud6JhidFkG2FnEzBETM/Gwrvn
X-Gm-Gg: Acq92OHZ9yJZmVQkmny1CE7tA+ULH+Ix32dk7B+icE8hrcTVNdx7znurfqvFrie3ABg
	hOLeym8tOCFXNjuHxdk8UTZVfGfNlhZFc5ueaJ08mKNmpG4BaNbqntlY8joC8GPU77+o+ickKEy
	TPLyNBa7Y/ceq8YSGrFfNfaCl5Ej7cWGzh+1n75eHkipFz3fz77E4D6KI9wgMK4qDZbu6Yb+Hug
	onTSQKk2grfHJPryHe5+/oXDxD35i+xdbQ0euCmcMgdi0TffyP284it927HCnBeda0iJgYyYfqO
	7jTza9MLMZ1MiqqSfMGLvFas5IF6ZZ271/qcMn+diU+2oSqfH6vmcYaHgOmd4pV8MnsuVEszSEL
	15ZERrMuQZ6egSZIZ8iH6vOcny+C9oE3a8KLFFYQ8W5zYnDJdEbrChFVrKHPOTu53HbgGZMqh9R
	v0HsLWKgXc3jO9lxlsdi3SWxzKeVBNoFTqLuhO4qlt2WdB+fktx8uhF0MoCAM=
X-Received: by 2002:a05:600c:a09:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-490b5fe66ebmr139763285e9.22.1780586340547;
        Thu, 04 Jun 2026 08:19:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm82776805e9.1.2026.06.04.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:19:00 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
Date: Thu,  4 Jun 2026 16:18:50 +0100
Message-ID: <20260604151855.307772-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the Mali-G31 GPU node to the SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/all/20260603065731.93243-16-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index ce42c945fdf4..0c1cb22aada0 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -64,6 +64,110 @@ opp-1200000000 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-533330000 {
+			opp-hz = /bits/ 64 <533330000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-266667000 {
+			opp-hz = /bits/ 64 <266667000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-133333000 {
+			opp-hz = /bits/ 64 <133333000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-125000000 {
+			opp-hz = /bits/ 64 <125000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-66667000 {
+			opp-hz = /bits/ 64 <66667000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-62500000 {
+			opp-hz = /bits/ 64 <62500000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-18750000 {
+			opp-hz = /bits/ 64 <18750000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-16667000 {
+			opp-hz = /bits/ 64 <16667000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-15625000 {
+			opp-hz = /bits/ 64 <15625000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-12500000 {
+			opp-hz = /bits/ 64 <12500000>;
+			opp-microvolt = <1000000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -592,6 +696,28 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		gpu: gpu@108b0000 {
+			compatible = "renesas,r9a08g046-mali",
+				     "arm,mali-bifrost";
+			reg = <0x0 0x108b0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			clocks = <&cpg CPG_MOD R9A08G046_GE3D_CLK>,
+				 <&cpg CPG_MOD R9A08G046_GE3D_AXI_CLK>,
+				 <&cpg CPG_MOD R9A08G046_GE3D_ACE_CLK>;
+			clock-names = "gpu", "bus", "bus_ace";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_GE3D_RESETN>,
+				 <&cpg R9A08G046_GE3D_AXI_RESETN>,
+				 <&cpg R9A08G046_GE3D_ACE_RESETN>;
+			reset-names = "rst", "axi_rst", "ace_rst";
+			operating-points-v2 = <&gpu_opp_table>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g046-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.43.0

