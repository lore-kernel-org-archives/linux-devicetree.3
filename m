Received: from mail-m15578.qiye.163.com (mail-m15578.qiye.163.com [101.71.155.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7109370D4D;
	Fri, 29 May 2026 04:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780027857; cv=none; b=cEQqSXI5Kg6leLMZ4FJW0Rznqs+2adbNR8i94YwGoJjRRJHKTi2ckKzVAMjXg0tw3bRG9HtUu5boeWwwUPomnXnUGhkZNttelg7ep6hqynaKbuvjHEECtCVwPOneXvG6U7JyWdOR5YsAqBtWnHJx5vSTj12i1hVfyvwVbPbZkr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780027857; c=relaxed/simple;
	bh=M3tE1WPIzsoyL9eYIh3PS64dNcEV29PFlja64XmBbzM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d5V+Nh3i+CcUc6hY38U3GiSe53t+645C8sKmfdyMmoX0pOS3uh+Qh692bwcu6MyGXrNwz54oIu5S26Z1m/kSzBb5FVQvE4y28B3PTbSvrUDsCgmvVBCiWTdpwWFXINxbeowhd2+5Mh1CRXTjFJO54guzIkSByp77YwAvOD7mQus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EX0fV5U2; arc=none smtp.client-ip=101.71.155.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EX0fV5U2"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 404653b80;
	Fri, 29 May 2026 12:05:34 +0800 (GMT+08:00)
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
Subject: [PATCH v4 0/3] Add eDP lane mapping support
Date: Fri, 29 May 2026 12:05:27 +0800
Message-Id: <20260529040530.741336-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e71e8ae0a03a8kunmaf9a1d48e6b97
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCThpKVh8eGU8fH0xPS09JSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=EX0fV5U2VSGpba33TzMsCFZZW90mZSSHH2S/G4d3l2NMISqNkFlsVJOuH8HkfQqpMKWAAmZ9Oe861qGr9Deg9tFDMekzaRg7urkUwEz4G05im20HydE2iOK5J+OwHEJo04uwIxO2aYoxnhi3864z4fe+IhDx1dTvucVyfBximAE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DWebs7+LB3ebsJnzaXVAOm3CvPMJPGCS3AcXWbRqA24=;
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
Patch 2: Add validation for samsung,lane-count property as preparation
Patch 3: Implement lane mapping in analogix_dp driver

Damon Ding (3):
  dt-bindings: display: bridge: analogix-dp: Add data-lanes support for
    endpoint
  drm/bridge: analogix_dp: Add validation for samsung,lane-count
    property
  drm/bridge: analogix_dp: Add support for optional data-lanes mapping

 .../bindings/display/bridge/analogix,dp.yaml  | 19 +++--
 .../rockchip/rockchip,analogix-dp.yaml        |  1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 69 ++++++++++++++++++-
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
 6 files changed, 96 insertions(+), 16 deletions(-)

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

-- 
2.34.1

