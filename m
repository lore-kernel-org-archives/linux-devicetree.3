Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2490343635A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984637; cv=none; b=mYwUfTvtB/Sx2BXhSAmTAlDqCjro0JVokMdyjAObZ2s3yQima5MUPWB71DGU2YTqILZBLceXitDKATDZ3/zD+or8fmgixn+x1HVe/5jDyyQ7cVywUrptxtlCzraRZg5cX72f9a2Q4jZPMdnGituONK8YipgINX1R7veVB1v7jto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984637; c=relaxed/simple;
	bh=8tDAAWCyX8g8rEM+l88sXOrzNZ2pgZADOHDwS7WFU2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRZCmyCjCKvTPPaLIdNKclWiN3loSptLweS0q9KWfbuq7TxN0A8PYzC8PymPb7W/aXsNVgtsYTIhVLaODZoRIPdz7FjNJJmjuAF/hxrX8S1ptvzJXI5hL3gMZWYvQIbexznpnbBDhfSDv2KncQXiJyxwR5w+YvytQyfMMRQPLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruUALIk9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruUALIk9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-444826c16ffso5017652f8f.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984634; x=1778589434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oe5hiZ22zYH3VWvOeb03VwN3MDfhsjlKDVnCObh3ENE=;
        b=ruUALIk9CCJ3ZUdjFiW3ZQOmY1D/wOTGSs1pnz7czAtfI80CxQgYVw+hiPh5yLgc+C
         WQJSC6fPYK313r7RGMu0wbO3UUIR8FyTinLzOjwDqWx2BHU5QxjXHFhCj4c8EBbSN/NP
         asssGkM2n1aZP+pAkMEt6zCENtio7M8xUOt+qaaAGvveOJzU/VSvssYq0wnK4aCXqY8+
         EnTTSYcNDqiJLGfO/Rn+/mYod3dHYeoC9T+ZMYGqre11W7gkkcC4w6hCqO5HlxA9kJ8F
         2Gz1nIOu5EGQsnvX87DPVmqT8PPIM5yq9jWqGNr4aWPC69rw5ph4mvC+fhSLqX0C60r5
         UAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984634; x=1778589434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oe5hiZ22zYH3VWvOeb03VwN3MDfhsjlKDVnCObh3ENE=;
        b=GVcBCLUw4jn+7Q2GBckaedroE/nvSZNyzKOJL7+NPgN/OAiqo1C6ynR7CJHRbrGn+f
         viYFjwltWSLunsRYqgixRV9/UuFu3kke9nLn77l8sZmAMSpf+V08rqwvJ5wf5/pxXmcF
         nqfzLcBVHEIVRFQXmvXVku/n8fFGU8yuNDHpGG5fWqOT0v++ulH2Xwkdzp3nZ+Nn76+S
         B1tjZxBoLTFx27fmenrocti35KOZ8SF5EZ0TzlBxuzmZaY64K21wUePbrY9E3iqB7hCa
         2jaF9vBvjNTX2LVi6mIuNtSuZj/Kbzx34YzpY+poCNtTiOD/5YBdaTZQdVTsBl+f2Ctg
         PvIg==
X-Forwarded-Encrypted: i=1; AFNElJ9sXfRF/QLjmbMylhKx08sNMdM/H6JyNnXaM0vUF0LfszrVN1+b0PZ4IPus6n/9W0Nuv3Q/zoU75yTn@vger.kernel.org
X-Gm-Message-State: AOJu0YwIex8WOnYHNb+wOmxcoOIP4/OjESZ6NLKBgD3GUFaR4oVyHvfm
	oh2uE1UY1SJDhiZEQ/IuxupXX5m9KNwSkZo6iBTjiqI0Q/xzGEnKs+WK
X-Gm-Gg: AeBDiet8BczJZOQIYDadjYj/JNJVCQE7VyXDEukx6jguK6LQW+wPghl6xwwLkQeMTSt
	GaNKfrHwV0qSeEBKGaeHfXdxi7vf4KHMvWC4xFvrYRNM6dONWLwlYKYmBpkOM3eQNjzyHh8/jzl
	IQEQ4fSt8ej626vuqam0jXgyHN/vUfhRyfy95UJMvfUgNwjvvlFT2siJv3umTmmrZGEk7G3UsSe
	Zfsgi9JlbWsAVOfE2+pnbth+yp3Ix3gCv29OWUXOWyINomzRDfzLD/nmJZ9b79C6HrQm5ck35yX
	nAfAe4bN5o12hQ2c98Ku686/vCwvEQaxBbpACmnPUlHGLrJ6YgiDB8GmU0VsLK9dr9HQ2n7WARm
	MwoGX0lSG7FF/z0j/zVQMK5fo0M70wyEw7SWLIC+HF9gJDi/+V1GFo3Q5fqu7igtdORVh3b2juw
	rSUozqiLDsYECigjOqlsB9jFNRmKBSg/+CMuTPR/KiI1fSqwJkpMevS4YP22I=
X-Received: by 2002:a05:6000:240c:b0:43c:f1a5:56f6 with SMTP id ffacd0b85a97d-4500670b33cmr5481315f8f.43.1777984633403;
        Tue, 05 May 2026 05:37:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:13 -0700 (PDT)
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
Subject: [PATCH 2/5] arm64: dts: renesas: r9a08g046: Add SSI support
Date: Tue,  5 May 2026 13:37:00 +0100
Message-ID: <20260505123708.134069-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SSI{0,1,2,3} nodes to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index fa15e2ebc87c..03c0ac707d3a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -349,6 +349,82 @@ canfd: can@100c0000 {
 			/* placeholder */
 		};
 
+		ssi0: ssi@100e4000 {
+			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
+			reg = <0 0x100e4000 0 0x400>;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 307 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SSI0_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G046_SSI0_RST_M2_REG>;
+			dmas = <&dmac 0x2665>, <&dmac 0x2666>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi1: ssi@100e4400 {
+			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
+			reg = <0 0x100e4400 0 0x400>;
+			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G046_SSI1_PCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SSI1_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G046_SSI1_RST_M2_REG>;
+			dmas = <&dmac 0x2669>, <&dmac 0x266a>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi2: ssi@100e4800 {
+			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
+			reg = <0 0x100e4800 0 0x400>;
+			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 313 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G046_SSI2_PCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SSI2_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G046_SSI2_RST_M2_REG>;
+			dmas = <&dmac 0x266d>, <&dmac 0x266e>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		ssi3: ssi@100e4c00 {
+			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
+			reg = <0 0x100e4c00 0 0x400>;
+			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 316 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "int_req", "dma_rx", "dma_tx";
+			clocks = <&cpg CPG_MOD R9A08G046_SSI3_PCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SSI3_PCLK_SFR>,
+				 <&audio_clk1>, <&audio_clk2>;
+			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+			resets = <&cpg R9A08G046_SSI3_RST_M2_REG>;
+			dmas = <&dmac 0x2671>, <&dmac 0x2672>;
+			dma-names = "tx", "rx";
+			power-domains = <&cpg>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g046-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.43.0

