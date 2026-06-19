Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2A73B42CC;
	Fri, 19 Jun 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882946; cv=none; b=cJTRpSoJ29pcfA6oX9rq+rJz2A9pis9ZXfNPmVBhengPq9drBurq9fSpYEXYPvKNCJ64Ay7b8521Ko+XORLdqrqCCyIdNoyLmrALqAHimFIepz6mXjoLi4HHPp19dIKLKyMGtGGZGXBz136OuVc3YHGEwi1GEsLnr4mYaDSviUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882946; c=relaxed/simple;
	bh=EVPCL9zVkRBzg+EjML3hQjkCgGTjuY/mvZktdVccv/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVMBDgPpqJzqJZi1Fk5QngA9AgPbAJgeKDoaE6unay1X4mDsZLwgLR07YaRwdaEufedw0f3m+4V2av+b4FGyALbR3AEyb/26pggu0X48ebmepNUYVAftxVtf/9dr2RyijGb0ONTXZWu8h9eVyqhEjqQk4NcNVgtXrT8f4UGafkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RO0icPph; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RO0icPph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=EVPCL9zVkRBzg+EjML3hQjkCgGTjuY/mvZktdVccv/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RO0icPphqGTjLtKrM6tAJC5J0nGdDXBldmuDTvcQZ7sqL0YCJ/ia4LRaSsssX3icf
	 hasgDOohHXVSs7Iw4z8/T4XSclUbDaPD39qwwXdpMqcUyOBgBkNksVzWowR99Tq68Q
	 9ib6yEdkRe/FvsZQH1Fs4JYVzWqQfavjfziaTtSUl7YBUdAJ5Z/zOhyUClvVzEGtFF
	 08rok9axkliVDuS3fR/c0GohDcQblMkTRN/Fp6lBCDLek4zfrLGdxftfI40Q3LXgRy
	 nHxw3RK9q24LuySn91tRnO8sJxKRqAsp7EzJ6dy7exNmu/vI8eFwfDlQtNdfmk430w
	 ef6eRdRpJBnaQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5475117E1562;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 993AB480048; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:03 +0200
Subject: [PATCH v6 12/23] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-12-3bb1f54b3f35@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=EVPCL9zVkRBzg+EjML3hQjkCgGTjuY/mvZktdVccv/4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDiH4AF6nR0Y8pMlkq7ImAE1wb0xdod7j
 8SGg5kDmSYpPokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qafBgP/j11fTxdDdT0zWXlvJab2gavkKaEHs4sMgo1O3iDbDUI8ThDWCK4ogiOfSXwp66LTSA
 r5QY+p+Zl4swVIKSJM1xC0VqVG+gnJaPbOXMHx4rpoQdpicaAilahlvDqErk2+iDE13sbCycJBc
 xbxgDq7dmQ8E5xu28yvrk9VTwip48Q8kNQZBlXbq7cnlVDlHsTBp8xiwNuF1D6av4w9mF8Ng5XR
 wL4YE20m+tU+JqgpD4gFbXzAn5xG+FOYEisxKMsygiRL34/99ySO93iTOQTT/79TiBbIs5ewDVb
 bVW3gOk3ng0Z0YTJnZEdwb86GWStpCOh96WOoXuuphgYAnYQ44IQnDIuq5RErGBAfjR9rbuOCpZ
 +3HE2kTQPDKGaenIs9/6hWP3ttcN5wCRICQo7yxozhSqz3f0q/h4zZDzwJR/vX2wOMfOmooV+4x
 0jH2S9i25nTuulZU1lIiwGBbl1uTqukcQcOFo2DyXQ2ntYy5iYJI6f2RDrefllfT799SzDqR2cb
 U8JPPNB0BtAhgU3p6KllZFDXxJiLNBMb8aqw1l4zRRTmgbNCBzHTHiJ9sBEKfGVTyljueaX7aWQ
 QP/kpy12yQVLBfJWQCTiKkTCHzTPRsqugTy3Ed59cKzqduvKhBDjKd5ZvvTDVqeyAd2e7QzN83s
 EhCUWHnPRd9asaW+9YRof2A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a87cb5c0596e..e8b2adecb08a 100644
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
@@ -1073,9 +1073,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1093,7 +1093,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

