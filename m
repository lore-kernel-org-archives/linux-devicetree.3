Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BB02DB798
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632686; cv=none; b=qJ/92WKLH6AW+Xy/M0dIUJzvhZM9we9m7OOVmLOk2tydsxbbDyuols6R8wdHFlWc8ENqpgnREB4LIm+Ww5j++L2mDhDddspOqJxgHJuMaMF4R1sw3qRkF0rqgTDQ/87aEb7sgs8rvTKdZc+fNNNeUKmaJEtWHcWCZ2oKhCpfgJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632686; c=relaxed/simple;
	bh=9VDX2wyTfGXvirY2owoQqjTf1wba8DdvsYRwUvSlgV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAIjh5sVxAkPT+QUcbZsQUfBypSuJ6HviBIDrzxzr9IUBVRRraHl0Z4Az5zdgyaHl5+1+VQMVnWqxEmDVDvorjEqEpxaFiqSKjB0xd6DVMl1wmGyC7A7Gpv1bXTKgDQKNBaVW0b0tod/Bk6Q6A8xzRV5JH6eXacnWzXFNs8iBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qeYrOxfl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeYrOxfl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so20294605e9.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777632684; x=1778237484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q63HPKyCnCcFzQrI5n0Y9dzWcBoaBgHfQ6Ghkq+SBdw=;
        b=qeYrOxfldGb5yJKgOdbrJxctb1s3Od23MvzzBw83QTi2wmmmRRoYzi+8NSoayO2Ej+
         i6s1JrzxcG5wBayuVPCRQCqfVvUXPnrGk/MzVV9X98Rvj02DwkzRNuUJytF9D0h3PV1i
         hLVgbZA6k2uOcAFqmbVsImthPCFLQZGOaM3D3qgmNfn2U8cYxRwQw4n4n3cKTI4EcaT5
         Eyvcs0WLVJw70e6l7pT5abIkpuB0hzf0u0MsvCWg/ujgiKubvpLmnZIyiY6im7m8AXIX
         7XGEmR/6Lvv62PdKinmE8Z3OHQlEMwYXC3snF7Sssdp6G+MIOAyxaMYfcjyZRgnXQLN5
         Br7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777632684; x=1778237484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q63HPKyCnCcFzQrI5n0Y9dzWcBoaBgHfQ6Ghkq+SBdw=;
        b=fkKJhXAdvbtuUJKzXOf5sv5vtFKd86XMVt7gzO6q48jEpESsp1CJySyfmOIbvkzvNO
         UDO0+dtWjr2QIETjIF1UyPqH8KCY7fuDvN4SXSwpaYQtji31LUkWrvdev7nixhSmGoDw
         kw6VmaUrUN+ae1+Cj22uCJ5UtX01jW618lHartnRxS674PNCVuyX9F1OIjB9fEERxtZM
         gTYz4dMN27iC2ihYIWYg9kzprK9e4Z41fj9WJja068y+RcO59uhAl5iITlR17lVZPo9D
         Zq/s/XMyVKHXWYi2FQQE5ronEIaFGY2RADifm1vSgT53RST63ZfzhceodtzZCRWGypd3
         v8Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+X8ZG8Ky/AqvtWv4OgX7D4t+TjH4PmN8cJnps2STj34Zavnx5pZS45eP3Al9sGFPfjP2fhY06P6HKx@vger.kernel.org
X-Gm-Message-State: AOJu0YwBtMezU9EcTyL+Wgdiitl2xAoEGFVozao0qqlS+21OL1QGCVsj
	byXyFm+c7LkIIRPBxCg6H8RjosbnMNv5uvt8tYj36t51Q0OGPM0M3+jXreg/XtJ2714=
X-Gm-Gg: AeBDieta2A4uzBt3ipcZmwEg7gr/Y7H9JiAH0u8lWzj1NQoc33Ltn40oryOJ+8v15sB
	Z0AsoH01gnLujbRzyEIqUEfpzPFglklCsGJ8GaY+f2RpgN/1Pa6Igbc7xgyTRye7ygVZZ4k2u1f
	tKUSkEK3RQjG7e9cZYdy2We03k+BVQZF70Uu68kLvfAuObVPu24LXrsP6KWVquzU/DqG/42o3nz
	GeNRvKFv8zqr7k3vj+lZfaRXkqQCSnnHz3TkebckPglc7t8RWWFi9GmI7m1kEvI6MDHe2YY+BgQ
	e4H7rBFa2+DAl89GQUYGjNTyfoD/xeaOHX9GZNhQj6/836BZuP/PRjQDYVVLgWqrhGi/snzRbM2
	I4imnj5CTfnAOltq+fEBB5M9AFOZASGBoPLxh9Zpv1ZPuOKsHCYaqaVAGyiUNkL4q4BEiI+cQO5
	web7eJzmOOuRuJuBULwLdTb4LXwZUwM/I/eKowYDXp+Gj6FhAETyZ24IJN7Tf4Fs+ADmRw9m1Cs
	+5MyEZ3llSEIX+X6VxDb1HF/ttFydIxWwjyMPSxtVWkcvA=
X-Received: by 2002:a05:600c:c0db:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48a83f6b306mr79985945e9.12.1777632683509;
        Fri, 01 May 2026 03:51:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1220:5ff:c603:f3ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b99127sm122313805e9.0.2026.05.01.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:51:23 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add PCIe node
Date: Fri,  1 May 2026 11:51:15 +0100
Message-ID: <20260501105116.33452-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add PCIe node to Renesas RZ/V2N ("R9A09G056") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index dc5b116679c0..d6c8c39df2a4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1044,6 +1044,75 @@ rsci9: serial@12803000 {
 			status = "disabled";
 		};
 
+		pcie: pcie@13400000 {
+			compatible = "renesas,r9a09g056-pcie", "renesas,r9a09g047-pcie";
+			reg = <0 0x13400000 0 0x10000>;
+			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
+				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 2 0x00000000>;
+			bus-range = <0x0 0xff>;
+			interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+					  "serr_fatal", "axi_err", "inta",
+					  "intb", "intc", "intd", "msi",
+					  "link_bandwidth", "pm_pme", "dma",
+					  "pcie_evt", "msg", "all",
+					  "link_equalization_request",
+					  "turn_off_event", "pmu_poweroff",
+					  "d3_event_f0", "d3_event_f1",
+					  "cfg_pmcsr_writeclear_f0",
+					  "cfg_pmcsr_writeclear_f1";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
+			clock-names = "aclk", "pmu";
+			resets = <&cpg 0xb2>;
+			reset-names = "aresetn";
+			power-domains = <&cpg>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			renesas,sysc = <&sys>;
+			status = "disabled";
+
+			pcie_port0: pcie@0,0 {
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				ranges;
+				device_type = "pci";
+				vendor-id = <0x1912>;
+				device-id = <0x003b>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+			};
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g056", "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.54.0

