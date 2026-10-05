Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332643CE7B
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240049; cv=none; b=sJjGfsD8AK4vhGwmKjllNZ0Nb+Qx3RcyRaxIYRSUYHOkS9FSnAbe/GsoiJqA6xG26N+e+bDqc2kccXow1kDnqje7iGvHYnhQcjLBKyuaCAyoOBAm/lRxVmHPjzygzcehPNVyiVMS5rCFarfcQKziKQrrGD9jZxa6NgVvn1GpTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240049; c=relaxed/simple;
	bh=xsSc6ydPheU6yQKTsn8eVtJAu8IiKQ9vJAoJqkKw3sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmSWweoCk4Urf4W8tWAhi9tx5hxj7QLC9JljRa2AWvncFL6yaYErRPObJDeIETeOwO7H4myGG9Q+tgbdi7NNEpHmvvRXIwHnl1K9Zs8czbE3ZpAWwKYjJarDkc0y02QKdaBvSmEf0nnP4Xs+k+54Bap+56zbIaknPzLoXot1sd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWVWGtH5; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWVWGtH5"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e31e9f035fso8676035ad.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240042; x=1791844842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIbZ2Qb+jhg9YxUorYRFCm5h/dMc9oDQD6qvJFZg4XI=;
        b=kWVWGtH5MEgwwkACyXDu6QSQoDz0RffnFv+UEHU2MzkkHjsDJQahAzyGFLXg06Veh4
         sT5nyEDQzIH5PShO+WEw8f4NRQvV/BjSVSbEKsNBdwaY6R0AY7KXziCryDr9YTFup6Ho
         m1I2TlQcqUJkraisuL8EmCuKVc04kQndkJ7Xfq2f6yRf3Ac2U2qI34rfkrkOZ/zD2IUg
         vOhIDxOiAnQ95OHhZ6FT7J+TvFHvHrhumwDlNXbp3MMkvcT4I56rhhhGJJMsRwNnlTKU
         E+P8Aw6eKYfzSdgVbyG8ScXIHATqvyAfujH5EtHPtWt4bIHDF2phuB4fKOij5554nlZt
         OVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240042; x=1791844842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIbZ2Qb+jhg9YxUorYRFCm5h/dMc9oDQD6qvJFZg4XI=;
        b=Lm4eQu8XC6Ho1A8ek0iTqB4fo5W8M1ePG//7DUPwaCJ8TUrwyau6s49IiNTKCsdTIF
         NiXt/oRl/7gHiuo66rbvmRv2ZSn1kMl+qiyI8tUgPfMzOR1jFWXEjtP65WLJpnV1UiFZ
         7aBNvM1ehp/+dd7qeYarGAMOVlrpsUYPntTqUE5ulA2LCTFwt406NrdBA18bih0sAGj4
         PZa4uGcWHd3msauOnEbzrSpYYltiCD34qDTC30jNUdtyZC8FwBrWCOYGAP0Yrc9f/K8R
         jACXkAn63tYB8HMQWxNBKjFcdHFPEG+Sc2QO/61G28ZAFJWeAGlfkQzQ3CUWMbQAEQJN
         PL6w==
X-Forwarded-Encrypted: i=1; AKwUvBw5gexVuuU63cMWCUAdzgeFNDoCCt/naQsE67TMXk2bPQ7vtd7PFWszIgw8FJPSntvPSUwf4bTcD+lw@vger.kernel.org
X-Gm-Message-State: AFq9FYKRZu4fu8e/kqFDh2wbg0ZuAU0hzXYd5mzPPvhOWuJ1DRjpc0NZ
	rGUKhbFT/8R99NwQmArfVaNkJmGnRpVKRh5vA3iZIONoLIQDWn+3ac9l
X-Gm-Gg: AYBFou3G+TCCGYrBd4INCr7m/7gyMfvhj3RHhNDtEJG6ssg6xpqfKFmFcHjBwblsu6W
	/t9226xOPzyxsXuZqwvrK9MTVS84KZ9DuSyjcRLGXzAZk0+6PIGsqmWszMU2W6pjk/fTrkEdntu
	FixROvWc1c9Sr0G4oE3Te7fuJx6OCyIbieF8T6GTZs6++XLkc5Fz+xOYMZvizhdt/QJl4eWXz02
	QV2aWzKwbT3QGQM21ENk+2qP8w53UH/uwL0M60KbguX5ZFXkknu1YjQNVakgCSNttBZWq+0AYdz
	NhbCO/s8fC015RHkQ1LzUOcKnLnmTcb2zEKouwOzpIaZBmcc6DCZMZXekYClPAjYzgln5d4KpKc
	w+6R7/T5ksitBIL4H3cnIJ5ur03FMYlQgzIz7uJqAVEt9iGKS2XR/eJn7bm4og0/wT+aoYyBRd6
	FJK03yXjCMBfGbZDYWrdo++48Wf4MQ+ERMw2eznJNiB4u6zdk9hOXk7dGEDULyD11CzaM1
X-Received: by 2002:a17:90b:1cc4:b0:3a4:b8f3:8193 with SMTP id 98e67ed59e1d1-3a6cecb7bdemr5049021a91.48.1791240042184;
        Mon, 05 Oct 2026 15:40:42 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:41 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 1/2] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Tue,  6 Oct 2026 06:40:07 +0800
Message-ID: <20261005224008.1140250-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005224008.1140250-1-coiaprant@gmail.com>
References: <20261005224008.1140250-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports.  Add the XPCS device node and
its pcs-mii sub-nodes to the SoC device tree.

The XPCS device is accessed via the APB3 bus at 0xfda00000 and
requires the CSR clock (PCLK_XPCS) for register access and the EEE
clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
PD_PIPE power domain must be enabled before any register access.

Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
125 MHz reference clock for the GMACs when operating with XPCS.  Their
clock-output-names match the CRU mux parent names in clk-rk3568.c, so
boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
assigned-clock-parents.

The XPCS node and its mii sub-nodes are disabled by default and
must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
in use.  The fixed-clock nodes are always present and do not have a
status property, as they are static clock sources.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
via the phys property.  dtbs_check only validates required properties
for enabled nodes, so the SoC dtsi does not provide phys/phy-names:
boards that enable the XPCS must supply them, since the SerDes link is
a board-level design choice (combphy1 on some boards, combphy2 on
others).

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..2cea108b31a4e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -8,6 +8,20 @@
 / {
 	compatible = "rockchip,rk3568";
 
+	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
+	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac1_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
 	cpu0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -110,6 +124,37 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+
+		xpcs_mii0: ethernet-pcs-mii@0 {
+			reg = <0>;
+			status = "disabled";
+		};
+
+		xpcs_mii1: ethernet-pcs-mii@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		xpcs_mii2: ethernet-pcs-mii@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+
+		xpcs_mii3: ethernet-pcs-mii@3 {
+			reg = <3>;
+			status = "disabled";
+		};
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3

