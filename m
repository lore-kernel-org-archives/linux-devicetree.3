Received: from mail-m121162.qiye.163.com (mail-m121162.qiye.163.com [115.236.121.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2700459AF9;
	Wed, 19 Aug 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.121.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138550; cv=none; b=YVIXmd8shMET4OMcWSWAZt1dWf9eHtxtqdq0z1XCnrL5ONhek7mh2B8G6XQCSA7wLhJI+Iqpos2ZzEsP7g45/6rALANYn7Sv30+nxBKJqUzSce2i/ZkW7H8RQwNnbfsUEz6RxdLvmwHa+kAtwfCd+Q17n30ZC1bblnBG+ZC1URU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138550; c=relaxed/simple;
	bh=+zdUDQU/aAR22ziuHIY+z+VIEuCnr/IDIRMbHKTqiVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DKBaGOAN8s+0o/Of83ODzplXIPkTuP3+k/Iwob1oz1eWDUNZCc1ZWPY12sZXQfJgyqrYyLT0OlgXDHMzX7wmtM1exIKUPUtMBZaEeZ5wF52xSTGJClmxDCsRNGvajS43k6k7PHIY4g9LfS/qMu59dhEB6gA8g31tZ9s9k5w3m1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hpnSVBnI; arc=none smtp.client-ip=115.236.121.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hpnSVBnI"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a893477b;
	Wed, 19 Aug 2026 15:52:57 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 0/5] Add eDP lane mapping support
Date: Wed, 19 Aug 2026 15:52:33 +0800
Message-Id: <20260819075238.3007087-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa01902500203a8kunmf3c4117e328b99
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQxpPVksYGUoZTB1JSBhKSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=hpnSVBnIq9OtSVFfsFmtGQAVRTKhOxJW3QIVqp8+r1DRTvElg2PJd6Elsz36URPkkRCN6cNNHTZbEnWgYVa4IDgJm6055AMU8F50Y8tw2Rns42J8DV1YW4do6RgxjnDNpW/YQw13aB1HkJD+evbOxwfp+3cn9Q1/YBECogB+eVQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=VwuvEnIKeKcr7mUpwrsfs39UUTZK2wUaNNPcMc31/as=;
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
Patch 3: Restore mandatory for samsung,link-rate and samsung,lane-count
         properties
Patch 4: Add validation for samsung,lane-count property as preparation
Patch 5: Implement lane mapping in analogix_dp driver

Damon Ding (5):
  dt-bindings: display: bridge: analogix-dp: Add data-lanes support for
    endpoint
  drm/dp: Add helper to validate DP lane counts
  drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties
  drm/bridge: analogix_dp: Add validation for samsung,lane-count
    property
  drm/bridge: analogix_dp: Add support for optional data-lanes mapping

 .../bindings/display/bridge/analogix,dp.yaml  | 19 +++--
 .../rockchip/rockchip,analogix-dp.yaml        |  1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 70 +++++++++++++++++--
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
 include/drm/display/drm_dp_helper.h           |  6 ++
 7 files changed, 101 insertions(+), 18 deletions(-)

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

Changes in v6:
- Add a seperate commit to restore mandatory samsung DP DT properties.
- Add Reviewed-by tag.

Changes in v7:
- Add Reviewed-by tag.

-- 
2.34.1

