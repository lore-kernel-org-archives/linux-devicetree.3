Received: from mail-m49247.qiye.163.com (mail-m49247.qiye.163.com [45.254.49.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBCF331A66;
	Thu, 14 May 2026 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742421; cv=none; b=L+o+SSp15nEEv8dm6ietPJoYE1SHaY/ahah3NyQr1tdQPa2o7J+i+BSRfA+2xXzWwn9o8qefkhZBVU4O4ACxzZNZv1pxJISs+CHbwMo+Qjz0LacKw/tSDwGbjtjsO+8LpYFTC96CiaKaNpLwOtPw9bgPNca/0sV9zdfGllmpUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742421; c=relaxed/simple;
	bh=9CjZxLLbK13JfTnC51jhNirJv5ZHFQcU6UtJA40SsFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cMjH6May31g04h/rbhrcDOCgIvhs0TrXmVN5Fyxe5lQI/+eCBNi2k3En2BM9iZQ40CP8Ir6PQTTyBwLwKDXF3YfERQ/nhRhq/1Y8M8bEov8KrHoLK6VBeNZ8IZe1RhOZF2solnrNtMGkD/u+hWEqtXyDFRrI+cVyNJyaIUFRCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=CYTuWHLM; arc=none smtp.client-ip=45.254.49.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="CYTuWHLM"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e617edc1;
	Thu, 14 May 2026 15:01:37 +0800 (GMT+08:00)
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
Subject: [PATCH v1 0/3] Add eDP lane mapping support
Date: Thu, 14 May 2026 15:01:30 +0800
Message-Id: <20260514070133.2275069-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e254a750203a3kunm8191ae6fc25e5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHU9KVh8fTxhKGkpDSk4YQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CYTuWHLMpjwkGVPAKOdbtuZfTKnZHW0hVVSbEMbxFNHLlPoYi3JeAE/i3+Wn3C//ZyJxcVW+b5089AMYqPVFcXHCNS1mz6Gk+DwJn4qQtQaEliNcrvkDWR1rGhXXyz0mxp3k/1bFdGoiyBk5/GOAFerCcTkm758Jh5//w22uJWo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=uNef38etfNJEmvmQwL1S16fQzDZRoboQW/hgxScsiQQ=;
	h=date:mime-version:subject:message-id:from;

This patch series is followed by:
https://lore.kernel.org/all/20260513074414.2053435-1-damon.ding@rock-chips.com/

This series adds configurable eDP/DP physical lane mapping support
via device tree data-lanes property.

Lane mapping is mainly used for below scenarios:
1. Correct PCB lane swap and differential line routing crossover
   without hardware changes;
2. Adapt mismatched lane pin definitions between SoC and eDP panel;
3. Support multiple panel hardware variants on the same board
   by configuring data-lanes in device tree only.

The series includes driver implementation and device tree binding
updates to support custom lane mapping configuration from endpoint
node, and keeps default linear lane order if no configuration is given.

Patch 1: Supplement inherited properties for rockchip,analogix-dp schema
Patch 2: Add endpoint data-lanes property to analogix-dp binding
Patch 3: Implement lane mapping in analogix_dp driver

Damon Ding (3):
  dt-bindings: display: rockchip: analogix-dp: Expose inherited
    properties
  dt-bindings: display: bridge: analogix-dp: Add data-lanes support for
    endpoint
  drm/bridge: analogix_dp: Add support for optional data-lanes mapping

 .../bindings/display/bridge/analogix,dp.yaml  | 24 ++++++--
 .../rockchip/rockchip,analogix-dp.yaml        |  7 +++
 .../drm/bridge/analogix/analogix_dp_core.c    | 56 +++++++++++++++++++
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 15 +++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |  4 ++
 6 files changed, 97 insertions(+), 13 deletions(-)

-- 
2.34.1

