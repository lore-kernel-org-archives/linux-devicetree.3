Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADFB3BFAD1
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 19:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982652; cv=none; b=PYsHwlwpQlVBOawonGMZ1vv38iX3IVXdOJVygdwzS/IYlHku7wDSOpo4T891K32dYiUY8ToXB73pSmex61rv4RKClXbydm86UpFhYB3zSMDwcSYU6tx0J4m1MSVD1g0nzwMqHLWLcC935v0pN/2DfVZJJwaF5QkLlo+TKS7McYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982652; c=relaxed/simple;
	bh=jaykkqk6APytVlB8lFP/9ih0dnKFDdj7DFXU0SmefTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AY/Wl4jpW2ZyLV7Ez7i4S4MDFd8LiWuYiVW0TrmSHAnk+OMOZxYp0Pe5OwisIx5GnxYAhG+yQykC7/i7xyG2JD5Htf0mZCvFz6/mibMqC12duniaBMsj0lGkdNexGmTO8PE4zbE25GlEuc3yYcOQLYza+lOeaG1ufgDps3JRXzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7WASimF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7WASimF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369ef6so4646885e9.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982647; x=1789587447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oi1B5SovbX07FFLvzdNpIPpwtrKOTqPfPy81gDmX7YI=;
        b=Q7WASimFmTwpkNEsw4F1I3NZhXGUpgObBGCT7BM9au96qaAB4CMyFoZM/DxXcqo6OD
         uyqyjzXzoxUcprBJQfky/3/RI1Dbs1ncrqS+Evzmr/7syThPptsPu+38AkDEclu5cY4I
         Q0DBkNSFxU399vN8SN6FZnTfDTzYhosvHswAc8faHWBvf1disPAavcJx9jq5t3FwZ9hL
         6k/eW2qRJIIc8bkXuwjAwUQ56gxZ3hLhL7xjyd/FnHRIxhBWYWRmYOH5kLLAdCjb8dPD
         3rmN17mKDOqKy8rsWm4VMjrm4KOHUkWEJwSx9nVVkeVLSWsGOZqBoBugjm06LoAUT9Pw
         pOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982647; x=1789587447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oi1B5SovbX07FFLvzdNpIPpwtrKOTqPfPy81gDmX7YI=;
        b=SIg2pnWvTG/nV4ShVcGY8AmfuUEsnXsAQprXqg5ecRYeq9kZD93LifweUZO+3uKkJG
         JzoRpgCuxSa/aIi+V1vRL6DpcHTQ7H5d2WmFEA3QANJf9EjV9fbDlFOTkWrfrRdT6aQh
         u6EBL9+dR3+/5xHoA1T8uEeHWLfZQ3A6t9A7VyfhuLISp6eumUyLjUn4NYXMcy3F+BFd
         oQadh9scdAVtEl3S0LBOIcHoEJ8BkXDaj09i+b+MUI2vls6ZjPz6CQ2fVwERb/R8XnsM
         bsHqrOUchXDhlHpU8ccZ6FJt3N+oCUsUGqDvVgxEWaEqdXdwp1Raire1sAai7gqcSvCr
         RCmQ==
X-Forwarded-Encrypted: i=1; AKwUvBylGrn95tyFbUQitBWHOTBKPSOFa01DDI4SsWtJAUkdBbpYO6IZG/Hk/Mk50qe7TFhO+8sVrSotFlOZ@vger.kernel.org
X-Gm-Message-State: AFuF++k38t/q4qWXnmFbujjqD2HUh61bALbnEWHui0n3uIjSXbHZt+GP
	rtSKTjued5hTuhFjWKO1DTeBbfIWDiY9yc7OYxZXfEudnHSoBb55O0Mh
X-Gm-Gg: AYBFou3TDknbqsFWeZQ85MxDVckuvR5GOZgSBJzK87eKID88oNF/uPldUS1hTTIoa59
	Ela8KMbi5waG71hjyc2LqTbVG7ej+93zhbKNRJfp3Ev7FtoBEcwImQTNV2BljB1iMZdN6/8Ir9D
	w5INClKYzowmkv6CIaooyijn7jLm4e/gzsgVIkHujoVtHhhYe1bNeKl6nvrm6tNW1Ndhgbu97J0
	Q+dPE/xw5gYaux5Ipck4bTC6r0oyEgLAEmomsgCLLKciudu3j9QseWjSBTQVahD5crJzIAkRo3M
	EDUBHnFlfe8EhXyo3pWG8hOwjlvpMXDoVAPLpxTIak4TfgEEkUj1RVZPKE2zI/9BkCguf3A+nHT
	i6qdoTm6Blh6xfUbt6WZ2IywBeeOp7yhoqGshefIhXyS9watwKqq2/1vJeGx7cZbO6QCbA8WIru
	6yMBaGp8w1zjdjwEr3l/FRi0IvJrGTTyubiF5E7Ou+c877BwnhAtBJz1qpUVHlW8OJaTsj0FRZf
	JVv6v+R3pyqLrNElqUZQciNeXBvrz3dJjYh76jTJCffGyU3y8hjrgUkwvV0fw/evDJx6wDAjDc+
	uHoaLnL1MmfPLK/iMU5TcA==
X-Received: by 2002:a05:600c:1d9a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49d258ef83amr68465945e9.6.1788982647257;
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:26 -0700 (PDT)
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
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/3] arm64: dts: renesas: r9a09g057: Move SDHI nodes into bus nodes
Date: Wed,  9 Sep 2026 20:36:38 +0100
Message-ID: <20260909193640.8069-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Wrap sdhi0, sdhi1, and sdhi2 in dedicated "simple-bus" wrapper nodes
(aof_sdhi0_bus, aof_sdhi1_bus, aof_sdhi2_bus), each carrying a dma-ranges
property.

Add dma-ranges to the enclosing bus node instead of the SDHI node itself,
since of_dma_configure() applies a dma-ranges property found on a device's
parent bus node, not one placed directly on the device. Wrapping each SDHI
instance in its own simple-bus node lets each one carry an independent
dma-ranges without affecting its siblings.

The same dma-ranges also let the rz-sysc driver derive the SYS_AOFn address
extension register programming for each SDHI instance, identified by its
MMIO base, per the SoC's address space extension mechanism.

Set each wrapper's dma-ranges to:

    dma-ranges = <0x0 0x40000000  0x0 0x40000000  0x0 0xc0000000>;

Leave the corresponding SDHI's low 1 GiB device-side segment
(0x0 - 0x3fffffff, SRAM/peripheral/xSPI/PCIe space) at its
identity-mapped reset default, and remap its remaining 3 GiB device-side
space (0x40000000-0xffffffff) 1:1 onto the same physical range. DDR on
this SoC spans up to 16 GiB starting at 0x40000000 (DDR0 and DDR1
combined), so this 3 GiB range stays entirely within DDR0's native base
and changes nothing for any of the three SDHI instances.

Allow boards that need a different target window (e.g. DDR1, or a
dedicated reserved-memory pool) to override dma-ranges per instance, as
done for SDHI1 on the RZ/V2H EVK in a subsequent commit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 123 +++++++++++++--------
 1 file changed, 75 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index bbaab75681c2..34639106d2cc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1577,63 +1577,90 @@ usb3_phy1: usb-phy@15880000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c00000 0 0x10000>;
-			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
-				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa7>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi0_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI0-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi0_bus: sdhi0-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi0: mmc@15c00000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c00000 0 0x10000>;
+				interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
+					<&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa7>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi0_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI0-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-		sdhi1: mmc@15c10000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c10000 0 0x10000>;
-			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
-				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa8>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi1_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI1-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi1_bus: sdhi1-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi1: mmc@15c10000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c10000 0 0x10000>;
+				interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
+					<&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa8>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi1_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI1-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-		sdhi2: mmc@15c20000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c20000 0 0x10000>;
-			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
-				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa9>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi2_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI2-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi2_bus: sdhi2-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi2: mmc@15c20000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c20000 0 0x10000>;
+				interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
+					<&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa9>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi2_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI2-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-- 
2.55.0

