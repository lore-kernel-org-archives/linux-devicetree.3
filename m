Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA0A47885D;
	Tue, 28 Apr 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392848; cv=none; b=qLzPJ4sX9Ww8i8yn3QdcjIP9N++o54ulG4NrAgMskqabj/DaWVo/Yq2OSOqIp8k2VKh5EKvcoVMSA5fTMs9VV9b+jWZ1EL4kKeZgqt3awEyYAQ/zWlgWvuhzbJ8s4eIDGfRnSWtH51O4psgp5tXbTGtpyqwgkDevUWjAgwpOukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392848; c=relaxed/simple;
	bh=vJfW11wiGelpe9cQawuDCFj8JmgWHyXe7dAI8G8ccBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQ6bBgyHGpdkEBdzpwr78VRMtNeZ3ggq5jznvPBD/8g5hN16C5BCdE08o2tfdX9+8OaMo+4q/iJl5gJZvGMpjQZ8moptCC/FhLAODCPLx6s3pnsPzQbV8pIAsiMntH734GUxZi16O6xqcrnH1jGY0eRIr/mY/0rwaL1AyF+XnZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eXlbmZtS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eXlbmZtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=vJfW11wiGelpe9cQawuDCFj8JmgWHyXe7dAI8G8ccBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eXlbmZtSCCZhfVcc+NE7e4yEjQUSOJk/hlAqPPoe/DQxlOwpe9tJvAlz2HPE0UR6S
	 Ib4SaqeHkOLn7JfGiAaY1HgdpZlpgQHVfo9S65ppy8l60G2eCPipf1jTolDT779h1o
	 K+0q5SXOl516a8SOnSMzzE5YvaD3uILRrYy90KGRW8tk732sMoVA+3XGkkS7XS6cYc
	 fQFQ0hlvZk1Rja5vRRiRoz8Lpe9Ak1CQf0CTcLBsm3zTSDZ2c7AfhORGTx6tOVTXVV
	 no1gBt2lJBcgi17gmu7jEl0iiZxXRXGY7oRsvlaYUAtmLN69CsOhYHUCy950xksG0b
	 mhI/KAwt1XaPQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F95B17E1580;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8B5F6480048; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:47 +0200
Subject: [PATCH v4 08/16] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-8-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vJfW11wiGelpe9cQawuDCFj8JmgWHyXe7dAI8G8ccBI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MkQUfVzVlT8HbCMYVEmPFLAMy9yuKxPs
 lfZnsfO5HO35YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qamZgP/03xZbJ6F8WnQI1p+ecPTzidZcRNHamtGeyIgiMW7DXJYuX3FL0uF4sInrunciJbalB
 anRf1gIco6rbFBdOypA7gXvPbB8HrTcQX2hGfmLWic+/Hq9dj8Di1LQ5KWnXtjbJPDiExqptKYZ
 d5Dw7pnd9Y7lkbSAJwp1Bu5u9FMCnPc9eAR2IJsXBhBdqLGSQIYhQWFs9tj5Du4YtVZDXBDVd+W
 GODdkpZzncoOGCKwocP33OykGdADmCqHIxJjdQn6LjJftKgSd+75FGnzVb4nnBAJJUW+Xa8nzVR
 zWbWX9ppKPhFS4oOqEMrKgF3CxILCqz4HavxwhAW7dTUG+luxVxiTp1t/3zJKn6RXH1rsmMoVQL
 aDbLBXw8gUt184OcPzSoCtZlwFGb8kMJqaRNmBnNmSAWukotV+CTqXBFgp7QASUTfRAuVVgbfwu
 5p2oOWyG0w2cfU/ZGhHw70gEncfrzRfBzp7QeHReKV6EG2f3shVe7PD9kbHiSHODRO5vQVcYD7w
 smsKdW4QJPyabSZkms2BqjlDmEuS1IytgorUiSE+StUJxD9t6GM8t41dzl/WzKwrqecA5b8lRP/
 HnWkQV6WUuYu0EhkMgt62Ebn2SqSUV11R3xzB8/t2TApkn7Z7cXY5B2kdnr4rDJ9CzwvbggcWKG
 dib4th/rd5jZCUDHw+Scp/w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index bf8394174294..6d7ca11b308e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -547,7 +547,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -576,7 +576,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1072,9 +1072,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1092,7 +1092,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

