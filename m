Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD837881E;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630122; cv=none; b=KDYdbMwpJPCDytkdBY4T7L+pKq9cH7WHirNJWiGpp2VL/kze4qhkHRdyfgbM3RkGVgyJnN+g/WyqSyE5PRcSQ0GqBXxkCnV41Vc3L/8uWUYMaN/zYBNYFgc6gxs4AaxMEYFomGlMbycCHxfGjVxV0PSlLdjtWhEZgX2nQvMGcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630122; c=relaxed/simple;
	bh=uMmNbjfbAoAGlZjecUnHMoJphDiyRpVBDTeQLXwvQ/s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d9VLv7kPRK2dw3dL16lKMx2T6b9Xae68DxnIFNnpKhHcG6f0tMBch6vTckE1QBeK7fxMHYO5y/GOn2SG+W4nGSZgNi6pnl8MYcGvyAU21GXa1aT+l+a/uycDO9BCaFSdizBFzC7/RIRilbMuay7fmfxfKKC64sEHDkGqEvuo1Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rD0jGnwn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rD0jGnwn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 690A1C2BCC7;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784630122;
	bh=uMmNbjfbAoAGlZjecUnHMoJphDiyRpVBDTeQLXwvQ/s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rD0jGnwn+8OOG/3wUGuHR13MoYiQKgTaxZy2D48nXZXLPO9k2jAzusKrhiuaVQ2cx
	 UNF3ooo4Oj7+e8sBbMSLRQJslbpOPOnQZDb4U5tO20L7VG/MayzSA5NVZbeSR0fwvd
	 qvkXqZRzVn48joS6ML/rmwlR2oZcjmzuC4MqF8KKBzDTab/XQ7b2bEYOcNg15Q3II1
	 QiTT6RxJQuA73wPgGFCBzh5iEKwyGFlUqncc9bdmU8Hk6P0/7ezFKbsrgviWOana4V
	 woIfsOFmoMERNUgp8bZgoMcedgJ0Kq5Mtvld0jhLkveSOL9dmoa1w1/LAtdN0hGov+
	 iun7MXxAtBlIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F5BC4452D;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Subject: [PATCH 0/4] phy: rockchip-samsung-dcphy: support the D-PHY
 receiver direction
Date: Tue, 21 Jul 2026 18:35:18 +0800
Message-Id: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZLX2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyND3ZTkgoxK3aIK3TJDXcvENFPzNOPUlLQUSyWgjoKi1LTMCrBp0bG
 1tQAQ/WobXQAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784630121; l=3271;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=uMmNbjfbAoAGlZjecUnHMoJphDiyRpVBDTeQLXwvQ/s=;
 b=acbHnnO18n8HjxYAtF3k6BQfuQ17jUfRTvv3dVfAK0vIUGSL6af4OmcURZ4D/Cu4ZKceb00mc
 3/H7Qj4QAr/AXUoKmsbISIt8S9s8iVFS5sFB4nq3a+bANHpCjlgyZXD
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

The Samsung DC-PHY on RK3588 contains both a MIPI transmitter (DSI)
and a MIPI receiver (CSI) with separate register banks and resets.
Mainline currently models only the transmitter. This series adds the
receiver so a CSI camera can use the PHY, including running both
directions concurrently (a DSI panel and a CSI camera on the same PHY
instance).

Design notes, to answer the obvious questions up front:

- Direction as a phy-cell rather than a phy_set_mode() submode:
  The PHY core reference-counts power_on() per struct phy. Bringing TX
  and RX up and down independently requires one struct phy per
  direction; a submode on a single phy cannot express two concurrent
  owners. The extra cell selects which of the two phys a consumer
  gets, following how phy-exynos-mipi-video exposes multiple phys
  from one register block. The existing single-cell binding still
  resolves to the transmitter, ensuring shipped device trees remain
  unaffected.

- BIAS block coordination:
  The BIAS block is part of the PHY's common block and exists once for
  both directions (RK3588 TRM section 22.2), so it must be programmed
  only once. Whichever direction powers on first enables it; the
  first-on/last-off coordination follows phy-exynos-mipi-video.

- RX tuning:
  RX tuning uses fixed RK3588 defaults. Boards that need finer
  receiver tuning should extend phy_configure_opts_mipi_dphy rather
  than add private device-tree properties.

Patch summary:
  patch 1: dt-bindings: optional second #phy-cells cell for direction
  patch 2: prep: symmetric TX power on/off helpers, no functional change
  patch 3: register one struct phy per direction
  patch 4: implement the receiver

Testing:
The series was tested on an IEI WAFER-RK3588 board across the following
configurations:
- Concurrent TX/RX: IMX219 CSI camera capture (640x480, 1640x1232,
  1920x1080, and 3280x2464 in both RAW10 and RAW8) and OV5640 capture
  (1920x1080) through the DC-PHY RX, running concurrently with a MIPI
  DSI panel (ILI9881C, 720x1280) driven through the TX half of the same
  PHY instance.
- Standalone modes: DSI-only and CSI-only configurations.
- Backward compatibility: A shipped single-cell DSI device tree
  resolving unchanged to the transmitter.

HS-video fix that is not part of this submission; however, the receiver
support added here is exercised and verified independently by the
CSI-only capture tests.

Note: The DSI half of the concurrent test required a local dw-mipi-dsi2
---
Jason Yang (4):
      dt-bindings: phy: rockchip,rk3588-mipi-dcphy: support per-direction phys
      phy: rockchip-samsung-dcphy: factor MIPI D-PHY power on/off into helpers
      phy: rockchip-samsung-dcphy: model TX and RX as separate PHYs
      phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support

 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   |  22 +-
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 456 +++++++++++++++++++--
 .../dt-bindings/phy/phy-rockchip-samsung-dcphy.h   |  13 +
 3 files changed, 442 insertions(+), 49 deletions(-)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260721-dcphy-rx-v1-9af57f3edfd9

Best regards,
-- 
Jason Yang <jason98166@gmail.com>


