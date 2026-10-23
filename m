Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733764;
	b=eVuxXgqRQ20lqeKF+F6gxXzPHDaWYHUTf+bc5W3e53H3lPNw6CabdcmHloaPOYga7IeW
	 clqRMre8Zc0JZi4VPVvHvXiJBdVIiv7L1njMk8BeGM2cxtDl5ZS8LZyJRGlUqLwwfX13g
	 EijtVoflea0wBkW8jiuxTFYD1aimgcRBpjxd58ZVMDJUEZr7JRv17aE7syu9tvaZytnMP
	 Dl8b43spS93d2itRtvJAdEVMAgcplWOjM1IvpHw7TsiUCNtNZTGW63QVy+nBa1UvSbDSk
	 OfE0lmGZIFEZ9UsQaquwP5ilgL4XVi6MaSWXcNqowvjWgxGzMdcm0iXf+nqSZyiRhuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
	b=YP44iG1N2jvVVG82ROwSGS4b9m5GMxp0+m1l75bSrXrbBmGD4jEb9IPLB8H1Kp3HnZbJ
	 HplEKweicJkpoGJupn3FV5IXpL/uTSx0qD3YrRlIUOyd3BsiMc2A2YhrQnwxwtKu2VQLK
	 Vel5V55p5OAhCvqNFzWw/HNA1oDmrC4yIUABHkWtZR2zisRDNcEGUPUZdycvTFhg/XX/O
	 CAUgZWYO1zVNMU8fSIBknzaBZpvkHFM/PBrnQbI9osPA2fuuElW3prAqgoNpOEqlQMgI6
	 faOAhGgvvAN2hCyfR0zO/Cj/25jcmDfdpDuODQv3/kllCCmJI4BKzNI+oLhY0X/WEgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nk7s0DK4;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28394606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28394606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nk7s0DK4
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso422909eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 22:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733762; x=1793338562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
        b=Nk7s0DK4TAAr6Sk2v005iFo7VsaLzma7MH0YEyiAeqciWRtebKzf2dBcM6y8jf3YKV
         FZ2z/6k6Id3Bmo+er2UWk1g5K4YrZajDTDSLZ19HJlKu715ot0LLPG18at0cHVUlXpkv
         vvox6szm52RRhrFoZtXCOyw2CbsrL3CqOngo519JS0FiJmB1btH/eCrmxkX1eemXtmY0
         y+D/e4YCQx1ULD3rAFbBhgBDOJZDmFfbN5CtyyOZWuuTpQBM5oSKfGybWf0uK/0fnf9z
         wKWY1jrmJa8K8AKIbneSITpweA0/MEahPz5kvMYg0PYQXldgdWce3/couu4HT5DNLvoi
         2Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733762; x=1793338562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+chekywn+zjR8qKfFmlr4rUPqe8P6DWzkjYSgfwJdo=;
        b=iiDnz3uMcr/d/tLLJVP5PCulCc5HgcUamzjvkbLHxWTJWXd1Lcwp9JYFxEC/fze0Ys
         mEblSl1i0lAkg9Y/lKzoaEFpmmGCy2Om38uaECXBrZ4rzstBu9AyGMy0jBWM5GSumuST
         T+ms7ARhlGY9UFaaTNF1ta2h+Aqzyym9psEmzWCTnWccDvBiHRzQdTmojCzilqiQgZgP
         e/SGmWm9uIHdeDhxJV8tC+X1LYUSjhbEk4Iq8v3YPt3XF1RzGzQscsNXFmTaT2KdVX5e
         1fv+sEqKkEP3uEoau8be9PCfsleXA0vLPRVygvLaMeT90ZKTmKUSwm7QCqeqFXOFAArl
         np2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+KKWG+CK7lWdIgt9G5Xesnr7ND6eHb26FKKgSTxPeTC3x/s5uWlCr4EIiI0bptZbEd5DrFxktYWSN@vger.kernel.org
X-Gm-Message-State: AFq9FYIaaQGlb01O4nLQAQNw9cRvDaRiXe/t1Im04NUM5dAsprDk8o2f
	5vHs/aByEiP288W2haBFYgLk2RFl0zC5Az9Zaj0dYPKzHlesXbrjs6pMcLArk4Bj0v4=
X-Gm-Gg: AYBFou3F7CI1sDYAvX2ZvnTz+YNHx30qcdvhXAScI2qlGHfmlySsa+RRlBufj+O0FB3
	UZK1d2zRl02Ts0yDAK9BiA09xJWswOk35Ck/NfVdShWzVXzRMQbbIx4kUXX4vWJaCJ1AC6wdph2
	V0V+LvFLt9XE5f9KzMtA8EvEBtFnQNCQX6LZYK8XhyCVpoq1LzeQqQ/aVWKqwaRolJSPsYlixHP
	/LnRwV5JHclR5Ryy9Iw9RnMRofTPGBKrltUE/1nRs6CwYQgOh4qi8iodnW/8Z/Ur2sUhPRCtxhT
	0kcRiywmepwo+xfiOt6envY5CNkHwmMHznIcbOHiyyKaQzG6KGjESigQ01vyadScxEtfUnw0yOF
	1aZMsuMeRQ2r7NHSaDwF6Au7L7b3Pu7++WE2GLeGJnYTpQmgVllj8TVDnaMH+/wXJmtRpjvossY
	ZecWuMHq/XuCMHGScioFRED7Dgc4Lfsla6xZSYfP1tXXkYCqOhirK2aPp70lU1zwJa7dBbVPex/
	rmnMSPaV460XxlJGOKUn16fzgD/eULl/SioN592rwgt1PD/0mqemg==
X-Received: by 2002:a05:7300:f784:b0:366:7b5c:820e with SMTP id 5a478bee46e88-369d8f4e26cmr1801190eec.0.1792733761680;
        Thu, 22 Oct 2026 22:36:01 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:36:01 -0700 (PDT)
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
Subject: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Fri, 23 Oct 2026 13:35:46 +0800
Message-ID: <20261023053548.1595033-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023053548.1595033-1-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports.  Add the XPCS device node to the
SoC device tree.

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

The XPCS node is disabled by default and must be enabled at the board
level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
are always present and do not have a status property, as they are
static clock sources.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
via the phys property.  dtbs_check only validates required properties
for enabled nodes, so the SoC dtsi does not provide phys: boards that
enable the XPCS must supply it, since the SerDes link is a board-level
design choice (combphy1 on some boards, combphy2 on others).

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..20a72785adbc2 100644
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
@@ -110,6 +124,15 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3

