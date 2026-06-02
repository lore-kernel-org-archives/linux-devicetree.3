Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3B3876CF
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433234; cv=none; b=EUq+DWEopKVIYM62vvJE1CybOQh7Ph5SxVRAwauSJUOMPp9X9XzwGRikRsh4tDoen6GjH5tFN6cqRvuliTll7JwHfMDr0zzomtAnYUo3qxVMTLcHdwre6InFk8U3A6Kkc2pk4h3OpmNJXW0GqsWzhNInWuF8vlbIEWRXzBWCpsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433234; c=relaxed/simple;
	bh=jWgwRdGKyelX5YvNFOo9Gg6B0kYxM+mT9np5o34Zpv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvkREs81MhOy5/x4JZPnZqLbjDkkRC2aMbWictQBljDHcdgsMCON9VLqijMTewPL+yrANjiSRgeWhaKxil87vORee4509erLQz6a6Iq6K0xIJ2+kYjvnxvno51nJlepD9jIMHgt4p6B63AuNRa6kkfpnTFF4JEn04k5rJfaP2K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxeAtyZS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxeAtyZS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so2972072f8f.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433230; x=1781038030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/0/5J6oh4mYlfgHIIKIDyXXkIXGEhFBTOovRosPBvE=;
        b=KxeAtyZSpPXNmkTzhYzt+REalWf/vacDjkSsT7tIxPUIxCY3rPvtLZyitgakViQKvB
         3PyS8pwVrd+bIuYDmAEB0tB2H6WloYOoJQenWLJlFpbWqZ5Uyg9jJxZKQtffgSKwDXha
         wpsD7XUgawLSUmdSZYuuIvDThrom/hI/gibVKHZvKHxIdfOpARP0EN1ubAm0L+G6GuJy
         mGJSr5qcqPeiI1wT/dH/Kr5poneecOvxZ+9du8EpLUN8VYAbiqkLPucGlH7VED7aI6Jm
         rd2AyXz67NXbrxir/jSPFFbAigwisw0jQJA+ihmOpvyom8yDPw5esaesRbR1MEO70DKS
         sWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433230; x=1781038030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/0/5J6oh4mYlfgHIIKIDyXXkIXGEhFBTOovRosPBvE=;
        b=NFhPth+ed1i1sxvgelJ14IUnZ8UAg0eecdm7OfCoD736FwEf0KnI6ZNYcqrjFlUxui
         JjpYAX/b61MdaIUEt3Bhmjv96XtfN3r68pyozAc786nyuxdjlU9hFR3fujHEUg1TR+LI
         BNIAfyc/mslqK2xQkoL6vcROacLViaQLALa54ryG0peut3pjSwK5+iq4aJkgFOLx4x34
         8MDm6kQ5Kj7Zvm+cfLrEKsqOZjxH2VScbChXDcYeddbUA/WaCvkjRoYjE9ZQwe2HeuIW
         jjFvODm8PwV8y9lk9SpKFWMMkRViqDPjWvzmxmxojB/laJJ+SzOJ8gPeSIGteJNEFGz3
         VnEQ==
X-Gm-Message-State: AOJu0Yzn7hrBIt5qW9Le9s1MBYh/NBCYTtyY7Pfu+Tudr/7Z/US1E/nu
	V3B3j8siTXSCFkig/rlL7yHYIAPFoxlqeMJnph/L92QVRTVdKPsqcyoYhC0hDptI9eM=
X-Gm-Gg: Acq92OEoufH2uqJFxF8BmAeNODHbFvwLNmcsB5tVNtOSn/kNjh8k1itLORCjsTz85cO
	mrNMbZtIPOciCzUZmRWvACnAfmJFFd7geLdtg/6oWo7n1xec59sWYph96rhEIY0byaT+8QjXPRm
	s4N1aT/VQ8Ckg4+xaPAWu+wg5I+ZkWLcvUgVIlcwNdis42vgwTKqXQFfGPEbY3aH83hhMomxIkg
	ywxtjiMkqXDdrsS/QH15bR/uGgwsGAIdbE/3JGBO4rJmjGSUt8SUrZPIpAhI4pRlJbmz0Q7neB9
	oyXfxzspqAbPg5JtYRZiXv7XaLiywRWrI48fbhR8vRNPdaxJqgaBcVGKSrYp/DhD582xCeXf+OL
	+svHi9hcIK2oB0fqsCIivTbAxNGGBq8IqBdka1o7AqJIIij/MN87RJvp6UV99nF40OUSmnVAire
	H1eueP3kMWtea1abKdRdxNTKsNS97Hc4HX4jRE8UvwpCD1pIMysAbO5pbnBGfNGtDhwGCfjoP49
	40ZCEAfU/bOTt/4cFzPUzinVNpjNbRAPhlneJbcOwsAG4U54GrTbpBqs5Q/2Ho0XcY=
X-Received: by 2002:adf:f8ca:0:b0:45e:ea46:ce13 with SMTP id ffacd0b85a97d-460217a5a76mr103460f8f.10.1780433230415;
        Tue, 02 Jun 2026 13:47:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm1957833f8f.26.2026.06.02.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:47:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
Date: Tue,  2 Jun 2026 21:47:06 +0100
Message-ID: <20260602204707.1920839-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 1e94366bb7ee..ca8ecbcbddca 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1025,6 +1025,146 @@ rsci9: serial@12803000 {
 			status = "disabled";
 		};
 
+		pcie0: pcie@13400000 {
+			compatible = "renesas,r9a09g057-pcie";
+			reg = <0 0x13400000 0 0x10000>;
+			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
+				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 4 0x00000000>;
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
+			interrupt-map = <0 0 0 1 &pcie0 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie0 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie0 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie0 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
+			clock-names = "aclk", "pmu";
+			resets = <&cpg 0xb2>;
+			reset-names = "aresetn";
+			power-domains = <&cpg>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			num-lanes = <2>;
+			renesas,sysc = <&sys 0>;
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
+		pcie1: pcie@13410000 {
+			compatible = "renesas,r9a09g057-pcie";
+			reg = <0 0x13410000 0 0x10000>;
+			ranges = <0x02000000 0 0x38000000 0 0x38000000 0 0x8000000>,
+				 <0x43000000 0xa 0x40000000 0xa 0x40000000 5 0xc0000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 4 0x00000000>;
+			bus-range = <0x0 0xff>;
+			interrupts = <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 826 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 829 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 815 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 816 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 817 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 818 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 819 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 820 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 827 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 828 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 821 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 832 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupt-map = <0 0 0 1 &pcie1 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie1 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie1 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie1 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
+			clock-names = "aclk", "pmu";
+			resets = <&cpg 0xb2>;
+			reset-names = "aresetn";
+			power-domains = <&cpg>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			num-lanes = <2>;
+			renesas,sysc = <&sys 1>;
+			status = "disabled";
+
+			pcie_port1: pcie@0,0 {
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
 			compatible = "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.54.0

