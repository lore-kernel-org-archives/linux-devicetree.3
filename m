Received: from mail-m12782.qiye.163.com (mail-m12782.qiye.163.com [115.236.127.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D2B2C0298;
	Wed, 27 May 2026 02:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779850193; cv=none; b=LUAmYKqz+74bghvxChvfA4dx4P+QdDU9CkCgy7bVz8V5HnDlfXcHfDiB80TBZfwAgp+HaQAO4QG4hTrjYckzKJyPkk5L2fxsKZASPgljEnPDQeoBw+o56itBsS0bDnkLEUodQxSaMxDF5AnZUxCI9f8p6Co9Dh2e5Rl7nDICxiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779850193; c=relaxed/simple;
	bh=hG+TD4O8xl/gPcZ5J8BABusRLckj+sBwwx2W7tTrexM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AiWrbmmJ5ozab3unkcrAcXVyUD9DFPRmRGLEg2vFW3orilsnOta9hyNOTN0nwQ85cxMWsT8rR/uqIiLHLMJFNSo+uvnMTU1IQK+5UvQNscPVURLKsg8LSHGcUcQI26QnqcKBFzt05StOWT3oLPScOoc/aBbq140nukqeTW/Sg6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=K5Rb8grm; arc=none smtp.client-ip=115.236.127.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="K5Rb8grm"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3ff559ac4;
	Wed, 27 May 2026 10:44:33 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com,
	cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v9 04/10] arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
Date: Wed, 27 May 2026 10:43:30 +0800
Message-Id: <20260527024336.191433-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527024336.191433-1-damon.ding@rock-chips.com>
References: <20260527024336.191433-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e6751c95603a8kunm8053ce91bcedb7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaThlOVhoYQxoZHR0YT0pLT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=K5Rb8grmQSk+Fn8zr/EUAS36eqi3JW21gK41vF4tA3ftg1LkaZgRDmwqAqYP+tFQTtUaK63IjeeofXKaPMD06qNrZbRzB74gt5IttczqaFRZKT6btG2rWAx0ukJwg+TvT89u0shhERvtiGubS3K7d6nGqx8eTrd1V9rwlK8p0tE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
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

