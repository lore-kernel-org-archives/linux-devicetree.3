Received: from mail-m49247.qiye.163.com (mail-m49247.qiye.163.com [45.254.49.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7E34B1B0;
	Thu, 21 May 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355491; cv=none; b=Kp4YgmuHOQXF7AJfsovu2YabGlaB8Sx4teBrwfgsSc9HGy6jWPh9HdZnSEuNnxN13hh5BcPWXQxs5gFKmNk27t2RIzlFgOgif8BHlOCoql5F8fE+YzXqvx8kTRwJYdAsPHTRCoHGNfDRoAW5z3kbOrQWcg7cdaOBnZ6no9iXwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355491; c=relaxed/simple;
	bh=enxS6LX75gY+Zwhp7EmegJ4TAofUxMIXqCA7oF6YGhk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KFuK0jyu+qVN3UT3XAqxc+uca/EQzo7FZfMY7xoJt/jyfVvluI6KMMOWT69OM9nUD6TaJ2h4FbeVCGWiheVCQo4Az195kOapFIO3PayDMDfSwu+2CK2HZOtQK7Gp6F7gCNBzesTCHS+ZWj9hbbLk4Ozfqa53RpgLQpxz3ymzJy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=LXD4Wsjk; arc=none smtp.client-ip=45.254.49.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="LXD4Wsjk"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f48aae48;
	Thu, 21 May 2026 16:08:54 +0800 (GMT+08:00)
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
Subject: [PATCH v6 00/10] Add eDP support for RK3576
Date: Thu, 21 May 2026 16:08:25 +0800
Message-Id: <20260521080835.1362416-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e499494ea03a3kunm810e96ea5eb72
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSBlCVkgeHRgYGUpPSkxMHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZS1VLVUtVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=LXD4WsjkCNBPEVPlMwLHc2gloJVQYGAY4DGswlt1lXdamyW22XQww3iCr8GTX90W084ddQKWhuYH152tlELjsvedgx2TlVuELesTuCNKBBGBwWGU9zoyP02k03PyWMaU6hjot4vD7sen5pVLPaXyb17LE7MTTuBBLtEqyMyCEvM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GyFf527O1l0SXTpuwsi/Qfvpfrf3BrGga1wKoHFIU0I=;
	h=date:mime-version:subject:message-id:from;

Patch 1-5 are to add missing clock "hclk" for RK3588 eDP nodes.
Patch 6-7 are to add the RK3576 eDP node.
Patch 8~10 are to support the RK3576 Analogix DP controller.

This series is followed by the [0] series.

[0] https://lore.kernel.org/all/20260409065301.446670-1-damon.ding@rock-chips.com/

Damon Ding (10):
  dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock
    for RK3588
  dt-bindings: display: rockchip: analogix-dp: Add per-clock
    descriptions
  arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
  arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
  drm/rockchip: analogix_dp: Enable hclk for RK3588
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3576
  arm64: dts: rockchip: Add eDP node for RK3576
  drm/bridge: analogix_dp: Rename and simplify is_rockchip()
  drm/bridge: analogix_dp: Add support for RK3576
  drm/rockchip: analogix_dp: Add support for RK3576

 .../rockchip/rockchip,analogix-dp.yaml        | 44 ++++++++++++++++---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +-
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |  3 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 18 ++++----
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 15 +++++++
 include/drm/bridge/analogix_dp.h              | 13 +++++-
 8 files changed, 108 insertions(+), 21 deletions(-)

---

Changes in v2:
- Split out separate patches to add the "hclk" clock reference.
- Split out separate patches to enable the "hclk" clock.
- Add Reviewed-by tag.

Changes in v3:
- Add a patch to expand descriptions for clocks of the eDP node.
- Add Reviewed-by tag.

Changes in v4:
- Modify commit msg.

Changes in v5:
- Enforce the correct third clock name on a per-compatible basis.
- Modify the commit msg simultaneously.
- Add Acked-by tag.

Changes in v6:
- Expand more detail commit msg about using hclk instead of grf clock.

-- 
2.34.1

