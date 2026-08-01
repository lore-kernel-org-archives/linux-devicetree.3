Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC635E1D9
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594234; cv=none; b=RA7Ev2qmzUaKha2Jwcfd+E/F+vyqfxQmhJEqngwmrXFsDXN3xVdSAmO7MF3hr7U9CjNvsQcHIuwj1RIlhY197ZCIWP7FZB4rMqzYVNA4KV8YtPq9jrZa4NVyGza+wSzv0addXywD0G3zrNVb4kyF6eyvk9PmHAeu6bCmKpHqG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594234; c=relaxed/simple;
	bh=A5WWFF/meLRT9K96dBTf7EzhnS37KtSW6R5N30B3Ssw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMO5GEShMVC4NV3ybwtFQgtX3vb18/A+9lGztTvSV5FRcYkfy/NgMJwq1NEVDj5DCwQ3+o0lmssbxlv0iaV5uN6Cf/l210VGybYNd1RVKcITDnO/MckPE2mtDUTZtMVvDC5UjqguBU6u+cwBAa3Hl95OZdz+lB7AxnuafC9xQAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiAp/jDP; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiAp/jDP"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2cac634f921so6328695ad.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594227; x=1786199027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=eiAp/jDPrFCRsEoNBP/AY/SrR5HzDrh4s/i1RQhIC7ax6+MJ5Ng2paeBj4edB/js1/
         3SJ0x34qZYcG3sYp34pcoWzpP5h37FgfLXHnO/S0Rc5by9xqOY2kgx2VWAOLmsLN+toS
         R0gsgoYTcd5GIbKeBxUJah7Uvp4YnMqK6DITqvU7zwODJAr22K/p9xDKhzVdWOEOZHgq
         k0cKKCs9ZvqxxGUxLxtFUO3JnEwoXKgDCNVvhu11mLwBvfEQbHJRLsk0g42Qq/JEuO/U
         m31nqcywjo/WVs6m6T0dZ1LOfmMcgdA/re7bQzO+pGi+FNe4ZcUovsar1E9HrfgT1Y66
         n9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594227; x=1786199027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=dOHqM1hnxDeNzHy09s4OiskjLBLY4a6MPisJ3yI5FbotqChpzke+xzy/FM8xNrAQ1H
         csvLI0a/YnNHUbFkFTA2kBzMV81tVBvRnHI4zP+VsKOh+qnNdasQKVxmiS7Bksu8xF9B
         VpOn+AdJv8e2UOtrSAvRWDMXlu+i9xEkRFqA/hEQLsyhPbp1H6oYFWScRrsido1rjL3F
         dV2KfaA69gqeFrrmGPPx8U2948f8Xtr8FmeXJJhY86u96MnB+6jPXdfG0ExpafhrgJox
         402/Nof9CWYzre80gqoFcAv81CzkUmM6NrAezroB8q/vZy3ycHmUdjcXaEnGTL0LdThv
         P6Lw==
X-Forwarded-Encrypted: i=1; AHgh+RpsJIs6rbu6MmkuIa9W8168xc54Xh4CE8UZS4VhUjtY1OZ5Zg4bVa/oxWOg4ZUOUZI5dsQV+n1P9GfY@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjhcFYI/KvkwBLEdAUSpDuvsb5vk71YbY6MfQHJjL1XOnH9rL
	Dl8x7e3b46nuNC5MT0I1xmcBPBW9CuoQaVrDtpYgMpzRlJAeo7c74c2N
X-Gm-Gg: AR+sD12iR9DQrPT5bUPVTKSS5uvJGgwI6rfffB6vozbmjKe/9DvYy3BIypUxH8gvnaX
	6i+9x1eJ5RRD/UgrfJUk7VVxAVxMgH2n5DewG3aU/GjpRlS003HpiPV2VApd3pM5f9JfsyXfn4c
	bbKsc5A1SiU0U7OMMRtTY3oZzBuPYm5OnBOUD+JhhHI/mSJhNmUAENRTHYgcrrbae/krvuIuLCW
	MME8qwmTZLo995CbZ36yqq0FWGr30JVmdcWshJlD3hrae7mY7hqDmD/GT3lbEgFYjFEZXdiKJen
	++6gt5dg7VDKtziTtosm1BjGbPb66AuTp7/bgcNycQObn7Djk1CmBfzYBks1tbVKHaVElKwqxdl
	+ABMMyQPOGobgT3uDyThekNnitGw6PilGDHRoXwY/mj7+wJTP7sPQZpN3gnJsVA9o46CFTH81qw
	Z6TxEE7A0mNqRF8ieJyK6uY0kTN1RLec+rZNn2m66m5Jw1W4BFCs8lTa8=
X-Received: by 2002:a17:903:1a30:b0:2cc:670d:9b2f with SMTP id d9443c01a7336-2d052412606mr37512065ad.33.1785594227258;
        Sat, 01 Aug 2026 07:23:47 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:46 -0700 (PDT)
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
Subject: [PATCH v2 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Sat,  1 Aug 2026 22:22:29 +0800
Message-ID: <20260801142244.679437-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
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

