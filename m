Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F56046C825
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795557; cv=none; b=cAk/qst80N6/a7exs9sT/8IKuPxTI59rkoW3CVj1tQIDpR26yagHPIN3x/vsnuceBbOuooOnC8qyR0Q3B7HjTa52Xidqb8gaKn6S0Vpwp+tWRGOz9fWjJqIX0Rzoamap49RycXlcgGJ9u7QhozxAVyzcFrJ/9DLGOEGyRVjYXyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795557; c=relaxed/simple;
	bh=A5WWFF/meLRT9K96dBTf7EzhnS37KtSW6R5N30B3Ssw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsHNtBgI9OYT7LfLKHYdd/A+/HpfFXLKGwdvdNOxIb6HCIrXzlgv8Pz9V4SPkFEGGh3Nm9oAoasmrekYN7qEDbP4gWSVHuxgLF0rW/rcdu2xZX7gWz8dw85PhCEnyknntzgjgxGX6DlupDOhyiDO/s13rsTkNe3tc+xy/Yh9gB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9xOXlLr; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9xOXlLr"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so2170204a91.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795555; x=1789400355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=D9xOXlLr68TEJ+JBofZUaqo63eKYDmeOhvDTY1ZCmAPOg3xcz1CvcaIgr4TyTXnDOJ
         8PWhf6ztv8B5284R+9xulnkZSJoOD/8bVJysmGN0vOscjmcB27/jx/nzHMiFDat4c43w
         aq5MK5RrxUG5rUfXoYtuGN4x7LFYjSP5MzHQNt2Xn/Ao2lWJ4oz3IfVcmjZZxlYxY3Cu
         Gk7eMsh4L2UcbRsmpOGM0aOryw3w3jZyklS3Wr7cRx6w5z/P5dWu7Wz99hdX5xQdIl37
         GWKz8a4JsaHMYYLCQvsSUHwTB0J9shzMfq6nfYo368IZJBzWcQvC6NH3L/wEn9uxpZ1U
         Frkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795555; x=1789400355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=LTuP4jzseTAbr4+JET7Yc6o72yoD/j6T2MLcrrQ1IhFVrJuW/TFW5PdNprpBCyBsF5
         ogpe4rSMrTTiGhBpd3v3rV4p9fGo23llRNQl1lClPbC9g7Hx9G4RgHyJpJCOTyTrYYub
         6s+CtZj/nHIj7QCIt1mIzb75zrsSuRZ05v2zOLK0KoGgarxhMPhA5jsHiHDxsL1/rsCd
         X6F8KdahIcOQikNEuyOd93vBEmOBB6IWcBvnYyh7JF11IC6GBk5z6Hb1BnR5IKW/nt6j
         zVktza0KjJVMQ+lVnS9rCdO6h5vOF1Ldghbq0SENXGxzC0BYA18sPE3ZHv+j/veCfk0K
         8fxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNDonY1qwJFt/b7WLGsRSZy/vqyR/I6ZorTQY9wp3rwpkzCWCUKm2IT5iH/lGC1dYnw8Ld0kr2EWxw@vger.kernel.org
X-Gm-Message-State: AFuF++licriz0M1+1WTUfGLjVOjkSEQDm+mN0VRHG796x6UIefzW604h
	G9qdgxUoCo2VTrDC4VR07fUaymry3jWvLV8mCdYuT6F+Y1lweQvyhRc4
X-Gm-Gg: AYBFou3SSMVXRdHNAJYyUNrXOhSp2XVeVeyJwlHnXDZxGGp6Fd7BhhxcELto52yf4ZP
	Yvmpe7QNbKZUOnJfkaTglAL7E2cW77ax6gkzLhVMWitwOGwtU7iAO6lBafYfsORgVDjF70GAJah
	W2OAPhrOoA/uV+k0mlBt/OuaM66C4ieORuELrC0gEqF0xVGUsk03v3Tk/WWcyegovDMqkQQ+Ywn
	PlHUajYqyb29hr4zPsTfw08JPSCCPAqZyBNr3p5F3mQK+dDRZwMtD/gbAPj2hLGKXzzt9JsrVgK
	AXd7k77GArPxrSf7RdXuV/8+8yq/xrJPzfJOYYPaw/Bf7Li6CYT3/poDh8V7yXyKYC++QOLAHp5
	7iM7S9buW7dQFDopF4+MturAaaMUYb/3GqTvTm/0zr6hmzXsmXJVMIdfLwTxZFBJ8edqSglpBoq
	cK3tTucOs+XDuAlhFETMziWA1S6G6fjUqC+yIc9ViJCgxhpDLGZPSgalzmLDs=
X-Received: by 2002:a17:90b:2681:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39b261d52a4mr35850991a91.15.1788795555107;
        Mon, 07 Sep 2026 08:39:15 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:12 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v4 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Mon,  7 Sep 2026 23:37:08 +0800
Message-ID: <20260907153713.2572547-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
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

Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
providing the 125 MHz reference clock for the GMACs when operating
with XPCS.  These clocks are used as the assigned-clock-parents
for the respective GMAC nodes in board-level device trees.

The XPCS node and its pcs-mii sub-nodes are disabled by default and
must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
in use.  The fixed-clock nodes are always present and do not have a
status property, as they are static clock sources.

The XPCS node also requires a reference to the appropriate Naneng
Combo PHY via the phys property at the board level.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..989e164c0eb39 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -110,6 +110,51 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+
+		xpcs_mii0: pcs-mii@0 {
+			reg = <0>;
+			status = "disabled";
+		};
+
+		xpcs_mii1: pcs-mii@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		xpcs_mii2: pcs-mii@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+
+		xpcs_mii3: pcs-mii@3 {
+			reg = <3>;
+			status = "disabled";
+		};
+	};
+
+	xpcs_gmac0_clk: xpcs-gmac0-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
+	xpcs_gmac1_clk: xpcs-gmac1-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac1_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3

