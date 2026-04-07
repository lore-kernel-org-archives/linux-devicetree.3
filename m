Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E928F3C3423;
	Tue,  7 Apr 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576197; cv=none; b=CzQ69bxI+HX48u8bY8TvDHBcLS+sqfDiesCFyOGsNYEUuGwKsRvVsO9Pz20ncnkB4iuadjM0RrzxW7sv/vPdo2uIDyyVbvEz1cZnUdEF7YWtNjRQTudbkyjsMdIUIAYWE+5TzRMuRkWFci5e5lPsThVb3ZXHJ0bk+gN2Txfe9e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576197; c=relaxed/simple;
	bh=+i/v/5Bz6CBBWsw0gSI2PCxHpGurnmksUFqsg15Zrig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/qEPNgb7dXfZUI7K0lBOeEkSL2ae7SkKrd0n2ZpNvqQLMQc+5Lxv1L39I+BixT80xO8CRYW16diL6Ytnr42XFr+P5iJYoNhM5c55pLsfcjgAEFruzEqoLiq1tYS8dOLx4nZVHyqvbCpDskiH+ptZAmavYn1F+rNeuK03RQAn2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6ogPDjJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6ogPDjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6E2C116C6;
	Tue,  7 Apr 2026 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576196;
	bh=+i/v/5Bz6CBBWsw0gSI2PCxHpGurnmksUFqsg15Zrig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6ogPDjJjwLCIB3AD0FvfnINgnXNs1H1hYuWTZMhGKSIQjNYzuMArH97KIR1r+m7u
	 RqLlWRKV2uxkyTdK0xtcAg+2lfzDoNjtv1GdBgWiRmFo5NnrjPCqpnD2P4osWPYYJF
	 fUXB7ilyABM2ztGS+8+HK20+6vnNggXugnuZU20SXMJW+D4htKQS4+oGQyWc8ufbxt
	 tA4W6Pr/fMZm4tIzv4+aPGXN/wGokKbXuWHjkicFxj+LCbTqk6gbMew6fEZxpRarwB
	 1bdbjjLOOfPf496X1ok+rMPfeODMQDgrr3X2Ja4X0reX51fDNNfCa8cJc5fCIWwHbM
	 au/zddGqmJNDA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: dts: microchip: add tsu clock to macb on pic64gx
Date: Tue,  7 Apr 2026 16:36:23 +0100
Message-ID: <20260407-laundry-clubhouse-86450e4acdfc@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-rely-speculate-dae3a81ea1fc@spud>
References: <20260407-rely-speculate-dae3a81ea1fc@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NLbe8+yUuxA8smHy5fVkynrXQ8TpWNyhFeATwq1MbaY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXVSpyZzNpPLv/iDXsEN/twv3Ls9aYTtJKEBQM2Jv9V /PVpnm/OkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR2GCGf1ZHhP4f8+UXcb7K xatjxaP8h7GK7XDCw8lepxP1s2uiHRkZnj/Uvuw9X9qTd+P8H+t/vLl94+EF/oj8m0xnVi9KLZO +xwYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

In increment mode, the tsu clock for the macb is provided separately to
the pck, usually the same clock as the reference to the rtc provided by
an off-chip oscillator. pclk is 150 MHz typically, and the reference is
either 100 MHz or 125 MHz, so having the tsu clock is required for
correct rate selection.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/pic64gx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx.dtsi b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
index c164d7bc270a2..e9ec376b1776b 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx.dtsi
+++ b/arch/riscv/boot/dts/microchip/pic64gx.dtsi
@@ -459,8 +459,8 @@ mac0: ethernet@20110000 {
 			interrupts = <64>, <65>, <66>, <67>, <68>, <69>;
 			/* Filled in by a bootloader */
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
-			clock-names = "pclk", "hclk";
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>, <&refclk>;
+			clock-names = "pclk", "hclk", "tsu_clk";
 			resets = <&mss_top_sysreg CLK_MAC0>;
 			status = "disabled";
 		};
@@ -475,8 +475,8 @@ mac1: ethernet@20112000 {
 			interrupts = <70>, <71>, <72>, <73>, <74>, <75>;
 			/* Filled in by a bootloader */
 			local-mac-address = [00 00 00 00 00 00];
-			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
-			clock-names = "pclk", "hclk";
+			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>, <&refclk>;
+			clock-names = "pclk", "hclk", "tsu_clk";
 			resets = <&mss_top_sysreg CLK_MAC1>;
 			status = "disabled";
 		};
-- 
2.53.0

