Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E23ED5D4;
	Thu, 25 Jun 2026 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409186; cv=none; b=nn0cAVjfwjz1NH9HjDf9PqI00Zi9GkiJ7aGawBadM9Krp74FOZSivtBr59Q6I4ROGIljd0F/RlecyAP01wWA1CfxiTgvWtclFrwakYuK6NTkqJnPTitCTZwm9XYAqk1xdOKHptD0wdgE9SHTb5nz7VKTqiZZY5U6SbxEcsz77FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409186; c=relaxed/simple;
	bh=S8mBZ4Hlh7Ki9BChV9ZzEHUUZ4TaYKsVcqZFSMwsbAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Otf8h3gh6VtmGkj3hqdDUGf7Ft7y8Lw4YmBQUfiCatvuLrz0QI+1UD/3I4xn5wGeXxAwXpwbLtDofJPh9jPXPMVYw65Xm0PAq7l2zbFRAgENaTeT2uQoTXKh7s12c9CYL8lPd1GIBd3Z5G4POxdElkH23xovcuxuF/OChTXMAHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ya0mGJBm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ya0mGJBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=S8mBZ4Hlh7Ki9BChV9ZzEHUUZ4TaYKsVcqZFSMwsbAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ya0mGJBmu8o1P9eq2iGyOQygiBC1X8Xs8tSPSFwh/mRg3cLALZI2SbfBDtiUUovrr
	 QvUS3kNUN76tqAL78sYiwQXEVG7XIIQKMWbu1VF6vg5Gf9d+mYhmfJ8mwTvjzqDmDc
	 ydckFgZRQ4ECxvDOEE0WAc9NtDEE8Ia3ccHsbqBVdx1NFUU/9Itcs9V2f/0kOYydpv
	 X+6A4d27LxYohnw4sF2DQy/VcmVR4580QyCaBIMUyQ3wmlpFxEaGAzV720igPwoADD
	 TP0EX5T0v/lynXsU409ZPtAC7jfamNYksudBPWs+8hCUqkJT/9kEBBGPqggY47t4CO
	 Jpz/lpFbXxhQQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFD1317E140E;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0685248003A; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:36 +0200
Subject: [PATCH v7 09/27] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-9-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=S8mBZ4Hlh7Ki9BChV9ZzEHUUZ4TaYKsVcqZFSMwsbAs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9tYupvParE2L65hIg+cnbTldO7e6gNRi
 ASRjz2zah7skYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qan5IP/3m1eDFr0pV3lChdsejPXTbAdQy1/Szw81g+BP4AntJs61xAAZHAgTVHPsDdDctezgW
 k3JcW1xpIoINRY3OoQPSbuO3ipMfDZ+bBvbj9CyCeK86QI6UnYzSvv7XjAd6I+cxbfI6loQggjW
 iup61lMlKzf8I+JBs745/EQP6WdxeIPhdK+YjyOZlk6aOU9ZFb+DuvRTpuYZOf7DwoMd8K8TfqQ
 A66vtSnXxtes2UaX9Fpg0gSrEvkfLrHN5DhgXgjvBCq7sWEtp1mMF7c3li7hyD2apzlyWzoauCA
 8sNKHGaOt9HqSa68bz3ZNjkUpCZJhCIav9TC04U3iC6lW35XhJuVbTJpjS3esdTQ4algkLawQPa
 OEecy2AGRyscbm1muqbLDuKrc6HPJvK8im8yaISuoMZWHW19szPeo69wHxILZ1mu96WUkLc04qd
 GhbLdMDVvdD+hdEMcAez/I3PUdsf9Cug0SV1YBh7M4xI/2w/jdy98bXcj+Lyl4FEgwt2D+CoF3H
 UeXME4YsYy7fCV/wEtRjv3NVOCKq/tG3+W8JS0awC8ON4F5pGQBgucS597iwcOyKKRTaK5s4XW1
 6EORX0XHBIBrlx16XTfyN4Z/1XaTxG6Eadq9NziM//38HKfGF+hnFVF5MKDHYmynBx5URfv9zRs
 nWN71wfQQWTo/ts08uAg62w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2324f9050f63..989a7884d8b5 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1017,8 +1017,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0

