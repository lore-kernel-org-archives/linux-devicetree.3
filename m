Received: from mail-m822136210.xmail.ntesmail.com (mail-m822136210.xmail.ntesmail.com [8.221.36.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A8320CD9;
	Mon, 25 May 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=8.221.36.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697261; cv=none; b=XK2nDZlAPdta+t+D9J0h2QkF9dHR4a6qTUPhSTHJsh/JkCesE9wTpeP0Ee1VKYUU9XHh1SlZCuU/R+qC7blUfJyjjgyQTiqCymz8srMZtJE5aVtDyF5j7T8HchyzNKp5Kgt8gEwUzOMWG2YyoTyG+p5tzXcMTs7ynICjPGuSFrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697261; c=relaxed/simple;
	bh=aImzPp5uJDeNYOZPbMkK9KrLifDngJZZGhFpbhEHKgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZwloDPQWJIRSFl+KH02QxQJDSJ9EepwB4lJa4p6XHG+mxVO6E7KcrBKe/NePDeYsM96azpVdrs0a/34UQjyluQRcam1BLl+DrafIo9/NInZk8VxgveZ5JIY5siwCkcdZELCjZbMPoCu6ryZ6IcR6/5y7Rv2gxDYEazlUsn67uDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=C5sQewRA; arc=none smtp.client-ip=8.221.36.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="C5sQewRA"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fb20c035;
	Mon, 25 May 2026 16:20:44 +0800 (GMT+08:00)
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
Subject: [PATCH v7 00/10] Add eDP support for RK3576
Date: Mon, 25 May 2026 16:20:23 +0800
Message-Id: <20260525082033.117569-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5e38da2e03a3kunmb64b9821102624
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQhodVhhOH0sYSR4fGB8aSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=C5sQewRAnMjyhO8i7jz9e+eZiQT8w2+caF8SYEbiYmvGVtHFbn0e6EQ1MlGvbJzMBYEH7qDMqbuqWa0BbJOupqr+1NDJLLnDO7buAkXqtCBqDcRVTuFuPg/FHYxz9ZMexMvq3ujst3vBgC3o+te6owUBElXDmkot9jUO6QeG9/Q=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=G8Irmm9w/Y+LCXjqIi95SZWGWB2D1HdFHteTuohbRNw=;
	h=date:mime-version:subject:message-id:from;

Patch 1-5 are to add missing clock "hclk" for RK3588 eDP nodes.
Patch 6-7 are to add the RK3576 eDP node.
Patch 8-10 are to support the RK3576 Analogix DP controller.

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

 .../rockchip/rockchip,analogix-dp.yaml        | 41 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  4 +-
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  4 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |  3 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 18 ++++----
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 15 +++++++
 include/drm/bridge/analogix_dp.h              | 13 +++++-
 8 files changed, 108 insertions(+), 18 deletions(-)

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

Changes in v7:
- List all valid clock names at the top level, and constrain the clock
  count for each platform with minItems/maxItems in allOf.

-- 
2.34.1

