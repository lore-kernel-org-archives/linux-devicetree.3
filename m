Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26D3EF672;
	Thu, 25 Jun 2026 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409190; cv=none; b=W9QtfhFv7nNUpPT4b2SqnKZEslzkHoVbF4oIkncTzUq2TkItqcuXY71tcXpBdQtKbfpS5BdqW490wJp0AXC6oHo1iKbtUZX0VBo2ycmr8lwrTnmJOKrt63JhF+tMJIAfw0812T+dNAhivfLrA0faVxgm6AExnoEAICkBZdWbMPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409190; c=relaxed/simple;
	bh=lIQrXHPEduipW6Hj0T0PV2Fyg/ObQ+nENmNrinpT9h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ev9yaJ8SP0lDwJLKm3MQGu1HZnvWjK+axe3Nd54laCqGVXuQqnaRNhC2TzeGBOMzSNLj9uab5CrGpVOe5YP/e7oexSEvGrOQcBkOh12pJtpP9DTIcTUt91FUwcJw2/pRonIuAu+oyE2CKsbnNJ2FZxNYInxLsIo7v09LBdL8Lbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I8de5XsW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I8de5XsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=lIQrXHPEduipW6Hj0T0PV2Fyg/ObQ+nENmNrinpT9h4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I8de5XsWer9oUd6umhLmk5yEh0HXekHqmiKO+s8GOpxtNhGFDm4Au0QxQWLraTN+D
	 j1QdUtLHv7ItwGL6JW/PtFpx+vj4lFz06blKVIqgY0tmmgACpw9+jxHtO3ZTnF1sMd
	 hrjRFj6rydm7eGZNEVr5qhje62srS/mn41CvMTuIqW9muouc62t0/4lkUX7rlkhTSb
	 d8io/ThmcKXoLsx2NlQVDrvoR4Ap70T3lrBqPviAdMttVY0W/b7+0CGXDiv+ffPaZD
	 0NnjzGev0l44uEc5oMcXE4NjP4FDrnEHhRGE/woYVwaGqwEUoL0llJsJfFak5fChUb
	 /lCleGd6NesdA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1760217E1583;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 166A4480065; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:47 +0200
Subject: [PATCH v7 20/27] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-20-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lIQrXHPEduipW6Hj0T0PV2Fyg/ObQ+nENmNrinpT9h4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9sJsCL2392xBrNchxTuWnPtN4NWuagWe
 ZdNCPBoAC+xrIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaPZ4P/0pP9pYtctzhJxHBThODKf8uG++izvpF4nMDI7QJ7Ey0lS/JIvWUykqVTRG/2MihNZl
 Bp7URr5YlCENF2eTxI6Gfr38RMI3eE8hyEUK5UbQcdht7MdO+cI67eab6C62dcAsh96f5mFUYnp
 th/1VfcAbOlufFuUuG+RKSe7l3xw/c43A5QoTpRaKiMMQ9Rhp8qSJAx6wifo1AO/mQKfDst+bWb
 hdTKEqG/Gi8WAoKzGGO+icyMrQXlNucsCoVHTdtb/4z08641ew/kSO1elSLq2soV+ZT838zjjmU
 AS8NbvSmJVIC46FO1isxoIsAvWR3dTtVmP9lc1aLMDfwd8zZHKqZoIjzdP85c6VkCfNJX86VH7H
 +raGXj8Jj5a8HV57RGmcQ7LpeiG4ZfwbVxBQE+/1vs0dYfs07DWUjBqW4R/m/u5seHm4R309I+e
 kslA1jtBWRvToHiMbH4E9timQXD5NkYE0RlghMmrGRYNGmvP3o4MjZ2x4gSSWqrkG7VKCeWeb/Y
 w+PNro3S7z84Sk6ZQv4gVYdxUTDgphXUIiot/i5UIfbRXqcF1fl6qsp6K0sgHjTI6nlxgtOnfbi
 fkp1AJxo0FrUrWGSNgHfDBrDz15x+SX9FhnLEfBf6xZ1CiODcS/G/HdtlEc5WQSbyj9blcf54Q7
 Pw3t+32j0xAjuf4+OHEctqg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b08f0c142b0d..3fa97a8c2555 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -625,6 +625,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -636,7 +637,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0

