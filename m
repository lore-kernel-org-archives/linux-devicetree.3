Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DDB3B3BE9;
	Fri, 19 Jun 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882944; cv=none; b=PKJqUm6QUyXGeooVIMfKRPT2AQKofhSy3YiROBn4txWFFSFOGCt1U3SnyM+6KQdhq371KZrp7jssBPduv0GyhxfXvKarTcYalQCpELqLgvwh7h580jMNimuSuQvEAiPzr4UG0EZ2NdKwrcB4kSq8V5pyjbK9cYdCmIfdkkWHwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882944; c=relaxed/simple;
	bh=XkxBhE43AoDT+fXnxn/rXtDSUP/GoHMA5Ex/HvjwnJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrKTka7PsDdQI+7uuyWtlnU1JH/wv/oW9l5NMWLUxzN5ovkX+Z+IL3G7LyzCVrn733QDTCDcfEd3I9iNUT/XIaK9bM3p6wmaRwxsV4Io50llq8i27pBxgDn3WzZPMWUZls/fz/d3YkTLgF7w0f60ihb48p4LbkdoHxUOunBcsxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AfMMRlGS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AfMMRlGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=XkxBhE43AoDT+fXnxn/rXtDSUP/GoHMA5Ex/HvjwnJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AfMMRlGSNdPV/PeVSYhKD8/iGzI4LGyiKOuYszC3ZTjUOq+yWPqJIQGCbjOAsb+Hn
	 9MBcob5vWQ7dVXxr8TxuE9qvoX9rvF/6nF40mX79evnPkb3g6xbdy0XfC8bpJOoCyh
	 cL/vXycUbga9No4aDFz5oDWtDMOKXRQEIGJYFarZ+Lb8JuQlqnupZfYUegcuArpAVR
	 emLKYLsfwc519qeGxHB6x5243M75csMDLYUwsZmXJ3EtLwbtK9our4pUZW6axXGCgJ
	 ugY5v1xUClRvop5GwODKpQRKvQtfD3qUFJYzciNmTEqrZv+xuU1rmz604uvBX64ctG
	 RqNymCGWKXnMg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C19B17E0FD2;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8E302480030; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:56 +0200
Subject: [PATCH v6 05/23] phy: rockchip: usbdp: Drop seamless DP takeover
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-5-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=XkxBhE43AoDT+fXnxn/rXtDSUP/GoHMA5Ex/HvjwnJ8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDh5QMMrs8NVH3Cu3tUynm1d3Luc7y/mN
 yDqqvwqRpM9kYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaRwcP/RC3+Y3fjWe6dlHutSVFb5nsEaDLKld9vvDY+Ls6zVDfekYZMq9F80XhNTBKdUDm09l
 /Nl+fx6OWJv0xJGnKBmYSVAkm9/JHrd1/Q+0oqrmF2pgK5jYVe2yxGu405xWH8zjbpsqm73/1HL
 Z884go7gMO09NY2xNTbl8MiyNBHJEGL447llVacIkOWKdtXowsWbQa+ihULgV8MvdVDxhTVESmn
 z3ottZeU/NoN/5VfPtO/AYJgvhewsEwxC7KLzAEomEGizapL2z1gupB6WPpa7HWPm06xLFHnf87
 Z1Zg3uVFXgr8LMaAeTBDLNJivukAb84zp+PTqvHMCgM6t8UHw/d4l/Dtboa+RQryWCEfc7vPLJx
 pdZZC+rj5HRE975XdhRYgtak3bzM0bUhJKCtfDZsQia2rcNNiSPQgPe0KWMaGrr9s3C3qO1DXhI
 RdDeHt/aBhtq+pcC1Ce2NTgCVj5VzLFKm+zjIuqJYNDAsxzQBDOqRhFj9jyG5rZ9JCJAF7/xfd1
 2XqhE8CjyAVNuBZgD6mjprq3j/WWJ6U7/IAcP+m3BVs1zIoJrI9PuSfA9cMcNNhF7C/JbvpAH9Z
 jp7t951g1eIAhgFzuIW7ahpmgIuqsynruE6yBsJgaDeCpsmoYWHnvlpi9/xBkQQjM5jhKOBOk57
 xY0kzTu0mOQh/XN+c9ZkooQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If the bootloader already enabled DP, keeping it enabled here means
the DRM stack can do a seamless takeover. Right now the DRM does not
support this and the code will leak clock resources on module removal,
so just drop this feature.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2845a012eafc..ffe39c968c70 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -936,9 +936,9 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
 	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
+		dev_dbg(udphy->dev, "Started with DP PHY pre-enabled; seamless takeover unsupported\n");
+
+	rk_udphy_disable(udphy);
 
 	return 0;
 }

-- 
2.53.0

