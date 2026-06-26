Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0683C0A0D;
	Fri, 26 Jun 2026 20:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507310; cv=none; b=LjFCwoeZgmC2x9B/Y0LYqa4Y1+HdNZJxSUghXEqlu4azrrL8VCiHppqCG6AfTP8wmbTyyf49IHiQpeOWu9xqkFFNBZQflWng/ZSveyKWcWCnx90nQgdGoqTEzdxN61WEIGgB4Ez77s0a4Mtk9alNC2P2fJPu1q1AQPyy4sJNt3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507310; c=relaxed/simple;
	bh=B1hFP7GBgjpJwgyiWYAhEXHS75Uh6G1z6FfSU+iGafs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GAlssoaH1S2hAfYMPOhf+YufWBkVeFKKLZ/8N1H0VNbnaZRw2yqQqhEQKlSUAiNAp67KEoHAKoUjD+ycPQpgHYF6DFOiN3Kvbxtmdt8CU7byKViQQed0ZNG3OpvKQM2XzxWD90S9273bZ9CdL31Qk+oI9mOqVaOO0pz87xwUxrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=knVVh50V; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="knVVh50V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=B1hFP7GBgjpJwgyiWYAhEXHS75Uh6G1z6FfSU+iGafs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=knVVh50VwsLWBd3KmIY6qlXZ2RKNkgsLJvenbrSi43HLpf8+Lr8RqdwSNBphGjdyW
	 hidvPbGG5jVg9ItVHzi+go9c1UFYfO4YJyPaljuKrQP90xSWu82upoW0m3rzgYQ6DU
	 ku+bCmLDE5sR2HKhKzwwKrAjgYCPBA+vIlay5Et52VVI0IBLXMu6bxOM9y2TrD0+R3
	 +aKQuUkbQ0T2gGQ5mYcr03jXDANGrj8Z9aNt83TWF2/Vfh9sLV3yjvZOisMFbhj+an
	 FfpKYJlre3D8w1OUw57aoUIjT3DyCg46o4vHXbAvhsBmdlnNlaH7zaHnf13hcMNbES
	 B56L8TneN8Q8w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4B3117E1562;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1FC8048004E; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:07 +0200
Subject: [PATCH v8 14/29] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-14-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 bh=B1hFP7GBgjpJwgyiWYAhEXHS75Uh6G1z6FfSU+iGafs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVvFMZUvwP9JJZT9HW0X7ypcrsANPUvG
 HWkf89JIpkaR4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qais4P/1Z05N3q8Wy/MvxN6cxl33Az2WGK46F+hKVJyTkr60nPFLSFY8ieGZOSjX6kpNv12OW
 7hRVRybTo1h7xtQaCbVp1xOTKAWxhF/u7yPb6SbDGKgDCebJVdXcWrydpOQ2FuuIquCZEj26QKd
 bN472U2vknW0MWcuEX8MTvaK87wkMoR7HujD/uQonDBkdfG7nM6UWC2L0ifsd6mo4Nixl+vsq0s
 5+DWyoSl+ObaYgtXCQMzky2FSuX6rLWxa3cid/tgejGRcVQwExYqJTMk7f14YKPb+GiTtvEb+yF
 n6InaUXAHS8SXONeRMrzecYFrZIuqNRfWZg4lUzkep8lkvTt+PElN9eXWs4DOLkn3qY+K2cKEkC
 087wWpcogksDFgbXyz+qGEwr9dbfhLtSFWz1AZ5BDa3ZDI2Ruimss8usM3LpqER7R8Jg4NV4all
 X8W4Af6g0aMHyCvis0X8NR2cXJbdfBB3FmeUDlBngspvu3SIj9AelypGWjWNRWZuL+qPQNQJ/ph
 18pJJ26ht0el1dRb5XeSwft8E4xpPXW1EpMWF8KBbgkMiLAeNZzpBXIF9KNhUg0V8mIS93UfFX7
 tjMfpinsbGyFfxvaY3aiWiifuaowDNkVJC45dMDUlyGDRdTqFKuIYvpXykW97+6Z8MGQJHgCXfx
 sSNb0QLCR1qMsDCe2Oxw5IQ==
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
index 6de8ac3f9144..db1ad3c2a953 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,7 +550,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -579,7 +579,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1082,9 +1082,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1102,7 +1102,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

