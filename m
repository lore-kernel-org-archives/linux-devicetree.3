Received: from mail-m49218.qiye.163.com (mail-m49218.qiye.163.com [45.254.49.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535D33F5AB;
	Thu,  7 May 2026 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165989; cv=none; b=VcX4uhnm44ZICg4wKnz4wwRUcC5kw3/bPbvjMI0W3BO1EeujBTn++IV3GUFo9iVH2obHYS6n2FO0Gia/phmaLm7D2jcREY+X49C6kuYAGe7xKSvthF5EnyYk+SF4837N6derw6eDoqLDDFvgqTc1XUaCIN7l8wW5g59S3U7q16o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165989; c=relaxed/simple;
	bh=WtxYAeLQh44yUHWsivB3ymVx3bUC/SjVpn8o9fOhYYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hsdHnHDyBlIRC9jxMWr1evXJGcLTRLTjIZM6pv5YYB7s41B374m35tce3WffT+0uQqCRNeNOT1reKD5juWHVS01Z4GpV+1qAbWJf1iVlQfP2GL+klYDj1J0WjjlWFO4Vx8Qw4BfFx8BOHnB1Cqfk98phXB9ygPilrt15uClnAes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=dD34Tbn/; arc=none smtp.client-ip=45.254.49.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="dD34Tbn/"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7b63a3e;
	Thu, 7 May 2026 19:29:59 +0800 (GMT+08:00)
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
Subject: [PATCH v3 03/10] arm64: dts: rockchip: Add missing clock "hclk" for RK3588 eDP0 nodes.
Date: Thu,  7 May 2026 19:29:41 +0800
Message-Id: <20260507112948.1115003-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507112948.1115003-1-damon.ding@rock-chips.com>
References: <20260507112948.1115003-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e0233a34d03a3kunm4d1cbcd7269d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTk9JVh5CSExPHUhLGkpLTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=dD34Tbn/BFLTl61cXFzREkNVtWMMgHAXv3PRaAiJIMUBULzgWOMIFVqJM65dYTarNE9KNhFh/pMKHbK6fzzw2QC9Ll4u53H1FMMsYM5c2oULl6tsgFEN9kCcDZKubbMl0MeT99JUzrvzbMlMKHZtfgi8ojqKy5efnuX1XnbwMTA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wYxl9lpl0P8cqKF7Eh4Xph9oWNjI+IaMHaMkxQQbS4g=;
	h=date:mime-version:subject:message-id:from;

The RK3588 eDP controller needs the video datapath clock "hclk" to work
well. Previously, it works without explicitly adding this clock because
the 'rockchip,vo-grf = <&vo1_grf>' property implicitly enables HCLK_VO1.

Fixes: dc79d3d5e7c7 ("arm64: dts: rockchip: Add eDP0 node for RK3588")
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 4fb8888c281c..24a5ccbac08c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1712,8 +1712,8 @@ hdmi0_out: port@1 {
 	edp0: edp@fdec0000 {
 		compatible = "rockchip,rk3588-edp";
 		reg = <0x0 0xfdec0000 0x0 0x1000>;
-		clocks = <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>;
-		clock-names = "dp", "pclk";
+		clocks = <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>, <&cru HCLK_VO1>;
+		clock-names = "dp", "pclk", "hclk";
 		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
 		phys = <&hdptxphy0>;
 		phy-names = "dp";
-- 
2.34.1

