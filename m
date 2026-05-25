Received: from mail-m4921.qiye.163.com (mail-m4921.qiye.163.com [45.254.49.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE2F3E3C62;
	Mon, 25 May 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698183; cv=none; b=nHbCqHrSBUMjGv6Ul0tZhGOMB5XiFbWR0WQzZn9unzPznkHNcdn2GvgvrBbHb1cUnyA1R4C0/K3qAIkWQdH7mZ4cDwTO04Ih9ZXzeJs5nt6xmElyzeVtRs8cK4St3spW22oMbKkbqEVkx2giCEd+aGfc1PHMKS9Q4Pee7OnVLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698183; c=relaxed/simple;
	bh=GFPWi/xaj2KK9JkNv4kgMVIXco4zFkyHwtNhMlrUhGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fFZpdDyg8e1D6fIfqEyOyxxbCuzzkFIWEzeaxcS5H38SdHmkldl0QIao3+9DcbQREsDq5VARzO2BpF9X0Ypd23yEUoALRHtxyZj3EovDVAwLXytUlK90VQaQYBE5OW0d5Aj4G7J2QmJuZl//dDcVHGhtG6Jrkvx5F2CpZM8SCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hIOa6F8O; arc=none smtp.client-ip=45.254.49.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hIOa6F8O"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fb20c071;
	Mon, 25 May 2026 16:20:54 +0800 (GMT+08:00)
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
Subject: [PATCH v7 07/10] arm64: dts: rockchip: Add eDP node for RK3576
Date: Mon, 25 May 2026 16:20:30 +0800
Message-Id: <20260525082033.117569-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525082033.117569-1-damon.ding@rock-chips.com>
References: <20260525082033.117569-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5e39001303a3kunmb64b9821102671
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCShhNVh5PHk5KGk5IHhhNSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=hIOa6F8O53arOgcS9XCjnWNwX0ouJmiQBZXdvai3CcIYmR/5YoJCem+EsU/cdRAWlfZL3mfcGMsQLUMCLfT90sAomhpfNB6upyXFdrho845I4D76EqYgw7V4PxPJz32oyy9W/pLrQToiWC53HYw0Qmb+hyMq+IwA6gSBwL2YawU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=K1DLY9Im8emQ1pvFmDCS9X34Zpvqnm1ezAB2dEZJU7I=;
	h=date:mime-version:subject:message-id:from;

Add full device tree definition for the integrated eDP controller
on RK3576, following the existing RK3588 hardware layout.

Configure required register range, clocks, interrupt, phy, power
domain, reset and grf properties to fully describe the controller.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

---

Changes in v2:
- Add Reviewed-by tag.

Changes in v4:
- Modify the commit msg.
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 28175d8200d5..733449cb88b1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1496,6 +1496,34 @@ hdmi_out: port@1 {
 			};
 		};
 
+		edp: edp@27dc0000 {
+			compatible = "rockchip,rk3576-edp";
+			reg = <0x0 0x27dc0000 0x0 0x1000>;
+			clocks = <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>, <&cru HCLK_VO0_ROOT>;
+			clock-names = "dp", "pclk", "hclk";
+			interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&hdptxphy>;
+			phy-names = "dp";
+			power-domains = <&power RK3576_PD_VO0>;
+			resets = <&cru SRST_EDP0_24M>, <&cru SRST_P_EDP0>;
+			reset-names = "dp", "apb";
+			rockchip,grf = <&vo0_grf>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				edp_in: port@0 {
+					reg = <0>;
+				};
+
+				edp_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		dp: dp@27e40000 {
 			compatible = "rockchip,rk3576-dp";
 			reg = <0x0 0x27e40000 0x0 0x30000>;
-- 
2.34.1

