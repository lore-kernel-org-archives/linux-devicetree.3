Received: from mail-m3296.qiye.163.com (mail-m3296.qiye.163.com [220.197.32.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E5B3264D8;
	Fri,  5 Jun 2026 02:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626528; cv=none; b=nMHQd1Y3PybQeB4CMSU/eZ471kqbP0WV3mUUm1CtJ2N0fZYZinCiXYD6oEVhg7aEu6R13YSleMwtjBWvtjRFcc6hylZp7mrXMuEW7hKXrjHDzxtcLFj5KDfLUoHkXRKnEANjcYfodn6aHeQerL0AQyzj97cuq9p374gThUDm5sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626528; c=relaxed/simple;
	bh=hG+TD4O8xl/gPcZ5J8BABusRLckj+sBwwx2W7tTrexM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N5sgayAofj5ZO4JX6lS3/CidGWgDDLtxQ6Zo+WD1DrL0uEmy0tVtLCSm19BBtr9gGMHtNB/R1p6QIrzlSPBnaAGFAbeYJv17Gbn5M3s9kYFSynrnCyVPQvuQWZ5pv2VP4idXpyBtva389mDGKaavWTQ2wXskeiE5xlNQjN18wg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QeR2R4AH; arc=none smtp.client-ip=220.197.32.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QeR2R4AH"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 412944cfa;
	Fri, 5 Jun 2026 10:23:18 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: sebastian.reichel@collabora.com,
	nicolas.frattaroli@collabora.com,
	alchark@gmail.com,
	detlev.casanova@collabora.com,
	cristian.ciocaltea@collabora.com,
	michael.riesch@collabora.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 2/3] arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
Date: Fri,  5 Jun 2026 10:23:04 +0800
Message-Id: <20260605022305.3058853-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605022305.3058853-1-damon.ding@rock-chips.com>
References: <20260605022305.3058853-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e9597906603a8kunm9494c848401a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHRpKVh1LGRpPGBpOTkkeTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QeR2R4AH26+DWH/4sQHJtZA53PIVdzRoRMUGCyr4r9nijT5A0cxY95AaCuTx0Ay1UbY9QU722TgU7LfHCXEU1LShxXrlny9N9TIFhZ4eWYFFPF7Xx7KyTH6Lxa6l+yteNpstd2CCsVB9Z5p+hLsKKve5Ys8OihuGeReZ/X2ApM0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FSnd82QhzgsTc9VLihugRZhMWxwKpTg7Bj65m7IRRDM=;
	h=date:mime-version:subject:message-id:from;

Add the required HCLK_VO1 bus clock to RK3588 eDP1 node with
corresponding clock-name "hclk". This clock is necessary for
the eDP controller to access video output GRF and work properly.

Previously the clock was enabled implicitly via GRF phandle
reference. Add it explicitly now to align with updated binding.

Fixes: a481bb0b1ad9 ("arm64: dts: rockchip: Add eDP1 dt node for rk3588")
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Modify the commit msg.
---
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index a2640014ee04..b251bb129cdb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -285,8 +285,8 @@ hdmi1_out: port@1 {
 	edp1: edp@fded0000 {
 		compatible = "rockchip,rk3588-edp";
 		reg = <0x0 0xfded0000 0x0 0x1000>;
-		clocks = <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>;
-		clock-names = "dp", "pclk";
+		clocks = <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>, <&cru HCLK_VO1>;
+		clock-names = "dp", "pclk", "hclk";
 		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
 		phys = <&hdptxphy1>;
 		phy-names = "dp";
-- 
2.34.1

