Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765689;
	b=w67H5xoc0MRfZJNOIVoTv6ac3NxfaEyfyHfVpplSEuNSHu/jcwxqwPfdCxiV/xSpI0rG
	 jnxqDvc3bbd/H8AIT1evNb9PB0/b2GMtZPO8oVQCO7U3PJgjEainwDw5wzonMtnjpODLO
	 503UBT5TH/FM7y8J86pApg3aDDZSyn9QXbKg6JIE4b8uTP9HBcAJQfnJDGrk23puPl6t4
	 DItj4oH89k73UDEdxmxdSHlyA+y0vMBECbYvSKFn1f0VWZTWXrh5vSuCVsb0gjjFug78V
	 j7iqvItO1rhIN5hRvmgMPl+mAGwsmCUkdKGcCZXtNoetoXCiRqo5CGJF6h2OF24xZbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
	b=FtrKxE1xjzBtjpAdLMlNpjH/7p+P3s+9yUkxlPsP5kLhuenK+KE71xuWhKqU6MSZ7sXl
	 YjpX9QQqmA3doF88MKm1/D/BDRLC7KI1riEny1Aez/nkGjzpSjjuM7T5hIYVM9znrzSYT
	 nXPUaLZ0i0/WsZxj3iozkHxPiI1eQ4Xh+XIEyx8nKs833KZyNLRcS0kibKoNr4bAhtRAU
	 hetUq0nLQssYkw3vvSHAgk5whpZjC8T2f1rJtby6nhTVCnFD3iLRZt4sPkPtt9hLSQg0s
	 Mx/QvrOig4S+U5lY13C/m0aXoQue2gVPVJIuHxXndRuIXCLymIJfYYApFtbD41AU4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRJGpkw2;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3572D606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3572D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRJGpkw2
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c34f07ecso525778eec.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765688; x=1796370488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
        b=kRJGpkw2/isn4Rto+ejdc+s1Ctqa+YRZcqilUBNRR9aMhGWTK6XV54BCE3ST8VQnrG
         +F8yd/zE7BtnlzViBMkxmMxFcnPhPo0mhP8hQtP/W94FSPlkt1Jb/lbGfHIiNfPGnt2p
         iHvf+gI9J+QBtmHQt3PU5tRy34gk0xPa6V0AxrlJ348mtGK6ArDAOhua00ODIamcdlYw
         DQfGoqXKRqGxA95Db/+MiudKPmnryIB8bXrJC3MUPPTT0iUpaCOjw9u/EmB78k6JIFFD
         isTxVZJRO5tdEDrAoJtDSeTih7cd2vStw5BIkwTyUx7IaDxUmRJu3rNuKG01SjiZJl8K
         CCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765688; x=1796370488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
        b=vLm3OaUCSomblU7PvJgUN6k6za15fURuhbM0KbGBAlH36fPZRQasYvPkrZ79PLQkYc
         AKtnsaaPm5121KqyYNDR+dmItruXYComQ9jdHgrRYJTfHfgf0xEX7sLgrYbmsrbDOFKU
         5GKhOtk3u8HvfBTVVSRn0XkWY44lPhVPid3j2k9Axw+Rxl6asJwcZcZ71SzlKYWs075l
         z+iYnCYgYp/jQRi3gg/+bB1G6tMWJKL6l1lHAcOQ4H693g1ogJFs8Jj3D3V2o4FfHs/h
         6vEoa/hdsDwBk9NST6qqgUn7pDo/kTvXxR7sxpxkACRB4M7QZzdjpnJRAZkY0EmLg2Rg
         SRQg==
X-Forwarded-Encrypted: i=1; AL+hErHXGXvpZgYZ0ZbGskxGc0m9vJSckpV3X9G//bwpe+KMf5JjgD3eblCaAG+zywFd0R4/+2ieVZNqszFZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/zo4cXex5NjjuI1ZwrP81+DejatIgWAR5qHNxYI47l4JrBf/48
	5tT9QzNqd7nfuQYtaoUWHX6rhhF/R/ySHFvM+k8MkfV808UjmUz+qrGa
X-Gm-Gg: AZFdTZeOJ3/Jh8psVGdZdZvpWjzuNRbi/QxW1k3Z8tI+tk20e6pqArrFo1GWi56WHqP
	MxDqFV98lb1Zaad/XjBgDOuNr7w+OeAWjd+ttA7grRM5HSze21RF2acBBSKqjjPNPz5vSKaaWt5
	Kgj7yOvfc04sjsnHrH30YsF06axgVSBEgfbnrLqIFIr8WLyJOJTF0YUN1+TNTujwmnjSR6Okd6A
	/RNJMwpv3Cfy2BhH4sgUdO2AHPcb7m8Xas+X2fiyKvQHQG1N4BtlexFbuKdqG3vs7soWerXgGdK
	FvYSbvwWNxhgyJ4KCg4eJUV+ei/4PyUvqnD/CWBqUou8fh2MtnoyCRqb7EJfSWzL7Gwj1kwlB9T
	YtBskuPfZafE5MX/rDGlGdoWF8WGEGe+328BSnlDkGm1TNrhcChia0NjGHibYjIc+gRs30BH4/4
	8y6wjy4rfm8C7lEiNn7ktxauFM6EE/ksahTDqskegZbYXr0jas75kvM/kAhLsK16qRtgTYec1qA
	cLoZyadSc/1ALmeVQKGznagq4/W5U+EZ/7yElu4mDPwCylALRwfxehwVToymtVCKG5SR9mtaZFV
	nUDh9m+tUW6vOgIBljQi3whf5lz2UCnjWksnU9UptzhLHpJBVPKC8qalFOfkpt1W9CBmuUxMBjl
	60uY04zNLmVnw25lC9ayjjw==
X-Received: by 2002:a05:7301:b8e:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3856e245b2fmr30879256eec.1.1795765687873;
        Thu, 26 Nov 2026 23:48:07 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:07 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:41 +0800
Subject: [PATCH v8 5/9] phy: rockchip-samsung-dcphy: Move block-level setup
 to runtime resume
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dcphy-rx-v1-v8-5-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=2576;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=jtUxPRys/dBRdscqaMmdtwL+bhADXEXJWj8FzO882mw=;
 b=jkc37NZ76qcvOYh5agQApQZtcQNReG1ovWyKUO8AV4O6rA0hn5+ykfSDc3v6dCTbakuw3whoa
 RZekMTnabqABs36D1Fvx+n0lqo98RCypPDEV8yvtWa2Bk4UHKNDLy2M
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The APB reset and the BIAS references have to be treated as block-level
[1]: both the transmitter and the receiver need them, and they only have
to be programmed once. They are programmed from the transmitter's
power-on path today.

A later change registers one struct phy for each of them, and a second
consumer coming up would then reset the block underneath a PHY that is
already running.

Program them from runtime resume instead, where whichever of the two
comes up first brings the block up and a second one no longer resets it.

This puts the BIAS writes ahead of the per-PHY reset assert, where the
TRM's worked example has them after [1]. That is safe: neither M_RESETN
nor S_RESETN covers the BIAS registers, and the values written are those
registers' reset defaults.

[1] RK3588 TRM: sections 22.4.1 (address map), 22.4.2 (reset values),
    22.6.1.2 (reset) and 22.6.4.1 (D-PHY transmitter start-up)

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7a009d87a665..d6acc3e2d448 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1346,7 +1346,6 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 
 	reset_control_assert(samsung->m_phy_rst);
 
-	samsung_mipi_dcphy_bias_block_enable(samsung);
 	samsung_mipi_dcphy_pll_configure(samsung);
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
@@ -1373,10 +1372,6 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
-	reset_control_assert(samsung->apb_rst);
-	udelay(1);
-	reset_control_deassert(samsung->apb_rst);
-
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_power_on(samsung);
@@ -1667,6 +1662,12 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	reset_control_assert(samsung->apb_rst);
+	udelay(1);
+	reset_control_deassert(samsung->apb_rst);
+
+	samsung_mipi_dcphy_bias_block_enable(samsung);
+
 	return 0;
 }
 

-- 
2.43.0

