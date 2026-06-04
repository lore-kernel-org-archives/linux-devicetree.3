Received: from mail-m49195.qiye.163.com (mail-m49195.qiye.163.com [45.254.49.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15343AA9DA;
	Thu,  4 Jun 2026 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567750; cv=none; b=Z5dN4vEtKLOQAwusbSN0BjVqp1EgewoRie0s3fZSx8+DJmmhRN2ldMFG2Ptbv5cdAtTi2DUxCfHHlJnppKuHEiRntgyk3yMvBT/onp8z6bl/YDRlcCrpi1LWcp15OL0JITmDuh9fdfvt0pB7jVwvUdrobYXcLiUopK3wx4n7A9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567750; c=relaxed/simple;
	bh=TToKOJ8HzMEDviNXuVgVbvMEw1AdrwUnjdP5ZDmoOOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uWxB2yHbEuR2n6O6qg/e/+r7qWziQ88Qxc6RS6ZIQg594tfRvZGTHn5Ec4ynGsH9L5TQekVAuecav+KudnQB9Z/v9SFoP+T7K3Ch1NLcmmisTX4zWfyzpjArpoqPZzH+hFxX1hp5ytWcBUUN9ut88pJir4WjxtaDsCJxag/GDNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=SRoNSX3/; arc=none smtp.client-ip=45.254.49.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="SRoNSX3/"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 410f6c9c2;
	Thu, 4 Jun 2026 16:53:13 +0800 (GMT+08:00)
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
Subject: [PATCH v5 0/4] Add eDP lane mapping support
Date: Thu,  4 Jun 2026 16:52:16 +0800
Message-Id: <20260604085220.2862986-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e91d62fd503a8kunm52a01cd04098d9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaShhMVhlISU9DGUNIGUIeGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=SRoNSX3/Rkz5sDt4b7lrzl0FSMCFZz5YiIMR9Q8KMs5FNWV5tBgNNZAXmqJWx9ncaADyIWRJ3lZd0zTTh5x2Io0pNKosGErrfCQF1RxMepfFHBgT0pEQRPxJ8hQsqF5Ag6PvGu0nhEiksBYp7qY4aT+opIZci6Rqbc2nM9hE49A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=6/XfbGUuZBZ8YijYz/NsVn8w/usuYLa6S7gqMFXiOrk=;
	h=date:mime-version:subject:message-id:from;

This series adds configurable eDP physical lane mapping support via
device tree data-lanes property.

Lane mapping is mainly used for below scenarios:
1. Correct PCB lane swap and differential line routing crossover
   without hardware changes;
2. Adapt mismatched lane pin definitions between SoC and eDP panel;
3. Support multiple panel hardware variants on the same board
   by configuring data-lanes in device tree only.

The series includes driver implementation and device tree binding
updates to support custom lane mapping configuration from endpoint
node, and keeps default linear lane order if no configuration is given.

Patch 1: Add endpoint data-lanes property to analogix-dp binding
Patch 2: Add DRM DP helper API to validate DP lane counts
Patch 3: Add validation for samsung,lane-count property as preparation
Patch 4: Implement lane mapping in analogix_dp driver

Damon Ding (4):
  dt-bindings: display: bridge: analogix-dp: Add data-lanes support for
    endpoint
  drm/dp: Add helper to validate DP lane counts
  drm/bridge: analogix_dp: Add validation for samsung,lane-count
    property
  drm/bridge: analogix_dp: Add support for optional data-lanes mapping

 .../bindings/display/bridge/analogix,dp.yaml  | 19 ++++--
 .../rockchip/rockchip,analogix-dp.yaml        |  1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 64 ++++++++++++++++++-
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 ++---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
 include/drm/display/drm_dp_helper.h           |  6 ++
 7 files changed, 97 insertions(+), 16 deletions(-)

---

Changes in v2:
- Add lane mapping application scenarios in commit message.
- Remove redundant deprecated property 'data-lanes' for eDP node.
- Update port@1 $ref to /schemas/graph.yaml#/$defs/port-base.

Changes in v3:
- Squash [PATCH v2 2/3] into [PATCH v2 1/3].
- Add unevaluatedProperties: false to both the port@1 and endpoint
  nodes.

Changes in v4:
- Add validation for samsung,lane-count property as preparation.

Changes in v5:
- Add DRM DP helper API to validate DP lane counts.
- Apply DRM DP helper API to check the validity of samsung,lane-count
  property.
- Add Acked-by and Reviewed-by tags.

-- 
2.34.1

