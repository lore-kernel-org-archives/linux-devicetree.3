Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1783C1D6C;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313755; cv=none; b=B9kiT1jrehZe9rFF5HYDGtlyZSwO94jkvjGLl5lVqVWuewgzJ8r48L8qfI0hj2Vuwvhlqd3u8MdVDvmNss3KPSJSl4QovzmC3Gkepgfm9S3Sb/RYwCVOV4MsJO9Why25LjQlAj9HyF4g2KQJf3HK2EZfkWzqjQTKBR2rwC8W5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313755; c=relaxed/simple;
	bh=DWRhVzxI1C3wXkqKVNxNuGCTQI6vLn5Bk41TAuSUgsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7v/AU8Zjgvb+9M1KoarNEs0OGiAZhuzdle2jevUz6JfhH83Wib539SB+kTuOhImjtx9S1WKG92jGXE7ylkjHGBnO/ui9eVwb36asPmzbRvgLaVSDNh5UDrzF/9BM/CzYMt9NaDza8XgVTVX0hSErUzx+FXU9QARu1GCFpZ2G4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaFpnvMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaFpnvMi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5736BC2BCF7;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787313755;
	bh=DWRhVzxI1C3wXkqKVNxNuGCTQI6vLn5Bk41TAuSUgsE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OaFpnvMirgQyd1SxUFyhFisLd4c2TdFX2XbF1+VmPfuOvyunqD6bk+sRJ/q4eqWfw
	 PAcT97OvrRXAE0qcvYZnNCllELb0RVL/6JqXbM4t4AimuL58aJBOLqbd3Z05vxDwJJ
	 Sqc4holO2Cy7zZaqUwLFQ7nrRPdWG8FSILrKnwpU0KfG5ynKEgvQg3ROc+RMrwvKuM
	 DqJKtwpzb8MzJ1S6maLZQZQbFEIeWetL26iLQNOMuIM66MWCktT8JZjYkIlGyBicsT
	 325PUCo++k/qEUyGLtHWAnK6t/T/DkHbii7qiS4Je4qPwcOMsOPDiac2P7hkN1hquT
	 CQU2XbRGxoyJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2B7C5DF87;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Fri, 21 Aug 2026 20:02:29 +0800
Subject: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and PHY_TYPE_CSI
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787313753; l=1230;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=QW75aipJ7r+1l1HjnUlKV1E5sUZRB/BcBCVtuuiQvtA=;
 b=bz+eOdVuKzA1nXEkvtCyvOk8VSkT+16IY2otvOlUYef0QPyiVMe96H9WbD/KJDy79VrmZVK/z
 DDmmxdPuGQiDWSGcCqly3/fUJ/0N7C73PqqhpJQwbhtO+Kb5DaGPaRK
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
Reply-To: jason98166@gmail.com

From: Jason Yang <jason98166@gmail.com>

A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
and in some PHY blocks both work at the same time. The existing
PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
the transmitter or the receiver.

Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
D-PHY or C-PHY and transmitter or receiver. They do not replace
PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
binding.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..8ee3f88e6d80 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,8 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_DSI		14
+#define PHY_TYPE_CSI		15
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.43.0


