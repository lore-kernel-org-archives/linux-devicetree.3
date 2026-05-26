Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2A3BB12C
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828057; cv=none; b=A9zu2NI2uJnybjZb8zkPbMTDVzV+xknKb+ILxO+X6gx9+xSFLh9JdWQ2+IIKYA0jyXFioEF8tiVJ51L8ZUQeWAv+SU1rNn29gyxhgPJXp2OcYS8Ba3blBa4UesGLs4MdqPFF7vLgYtZumHtOnf9c2/PzJFrdkvys2T6NdC3qtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828057; c=relaxed/simple;
	bh=6apCiPC9mcMFU0hi5ukxwZXH3fULndcRn8LEFUpXutc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHJYdoR4A2BQkGpnXovFtcSJN/Tx1iWChTSJmHg3j78FIMiN4AL+9hVPB/ZcuF+54EJm4slVw8hm/QbVH5zQpz7e62/JsvGorjCHboZ++Y4aBRdgmtaTJ1Qv5etxc4M5gObVzMoR975MPL7Dtbj+2y7FvR7Lc7OBKvRubFjcl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVUxJ/oC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVUxJ/oC"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3192395f8f.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779828052; x=1780432852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yED8FeUX8lEhP/zAzWDGf7qGvopI0BwZ8sUjQrJnpxM=;
        b=sVUxJ/oCxwAUtakjnEpCcobWEYmSVLeVctZzJtCntnGPPYkczTB1gT8Hb+F8QelroF
         gMZ98cYd3LEYrzRUrEhP9DJYAuEr+u4lGNXA4qMLWh+Eky9yIInrLiEWbZpY9AWLpUrj
         SsPxr1rANm0GI6KgC+ZeBhL1M23N8PeFG849Fsfl8CY3mPTmZFWg0XbgwUB0Zmnq50KS
         I5glsbbqfvoUFIpbvZYTTay3la8ROfqzsLtjwSa/DdrNgqh7WRm62wGMFLoyZ+tFJO5O
         jUjc4s7PZLE6iwKRPiF7f2UnLlLL1+eNQoPFtZu5myKm47Zf80AT8QLX/Nf6A7KEzKsq
         mOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779828052; x=1780432852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yED8FeUX8lEhP/zAzWDGf7qGvopI0BwZ8sUjQrJnpxM=;
        b=gpXgurlLagQ1y49SnXJYL1MamDgyARQEfpOWWz9ct06oopoBS0zOi2ky3+2Uo5d262
         9Ey0Ahc3CjBuokaS+LePEFuS0HdX5DG8xCpDUPsKrH7RPUPO7NfK9klvgZNCCEq6uMY0
         MQZqah1ELsgVev+fqPJBC0PHd65p9ufVNOvzpsstlGG9Xy8hnh4TUl9bkkst76z7enrg
         fquW6DRVyMtfxMIO+Vh4HiNKh06MdJmoSbzvldLOS1pFljoHnnSBg6+Stie3Vt5dAq3d
         bEAiu+6IzEyBtSHVyeLc0A35k7SbbRptpNIOLA7uaDOnjEFUysit6wXmH13qOihTFze1
         bhTA==
X-Forwarded-Encrypted: i=1; AFNElJ8J24DngCXiYQtMXehhAIM1DpdZWNM5FwbxxH5lNwtVvjUHzEnD57RadJ3qNaP0oSe+th8EJaCDCuv6@vger.kernel.org
X-Gm-Message-State: AOJu0YxvKo7uYKvfp47moz32jMnXi2hviSqvqMqpruW3PeRVxSHod4Fe
	4PWdRCDoSpDzBBc1a6HKmeEKQtjx0u6EOFLcw2Dfincc2A78Bf+qLHiS
X-Gm-Gg: Acq92OHG5WO5PuF+L4kTnc9Rc19zvmEyTL0U2s1iTbFU7yrXJInsy0OoQlXZyy7A+vQ
	cQ3hCckS1g/7j080M3SGeFtnyUnNgoImtEdVb+sZduzvLwSK3Fut9ZD5qGXc68p4BY5Wxw7rU+9
	FGXY6FeKDCuA2sEiCdVh9y4lEE/O1oGcaCJ3OzzHdfOdAdAq40iJELOy/PDKw4NKZky21PuSo5I
	cgdH5EGJvAzTFvdmHYak+MjC6cFzGEg+nVNecMMk9J2JYSUBLN1AtEbX8uXV+G/30PbMZaA7Nuw
	CPywaI4q8K5Au2MCgJ8W0mQ9sX4GX+BH/O5roO2l3KVJrkelFnLa76CuErXgyYuXzGtq7tR1KFe
	ZIMWdyxVwnuszShLXZ/o6DKapKfH9J1XwN/8ZdOk69twk4MmGEDm94lTrxKUuvj5+tRpSDDJefL
	tuux7itZt4+WHxYeVnhfKUVTNVdgy4GX3Mby85QcsIAOBugwvbCCRC2tLNYgMWOyrqWju+lyN7U
	8ZiSOUAE6PyfrTyOyV2MD3/cHzEXWgOFnugLEA32jHa8WGY
X-Received: by 2002:a5d:64e1:0:b0:43d:77a8:3baf with SMTP id ffacd0b85a97d-45eb38af927mr34847916f8f.32.1779828052494;
        Tue, 26 May 2026 13:40:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6e49:e380:c3e5:25e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm904864f8f.12.2026.05.26.13.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:40:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
Date: Tue, 26 May 2026 21:40:43 +0100
Message-ID: <20260526204045.3481604-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree nodes for the two xSPI (Expanded SPI) controllers
integrated into the RZ/T2H (R9A09G077) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index fe5d206d4def..1b194361fef8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1006,6 +1006,44 @@ mii_conv3: mii-conv@3 {
 			};
 		};
 
+		xspi0: spi@801c0000 {
+			compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c0000 0 0x1000>,
+			      <0 0x40000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 4>,
+				 <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 0x4>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		xspi1: spi@801c1000 {
+			compatible = "renesas,r9a09g077-xspi", "renesas,r9a09g047-xspi";
+			reg = <0 0x801c1000 0 0x1000>,
+			      <0 0x50000000 0 0x10000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pulse", "err_pulse";
+			clocks = <&cpg CPG_MOD 5>,
+				 <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
+			clock-names = "ahb", "spi";
+			resets = <&cpg 5>;
+			reset-names = "hresetn";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
 			reg = <0 0x80280000 0 0x10000>,
-- 
2.54.0

