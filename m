Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298720;
	b=Q4DiRwYWrMB6kKNvkOWczVKuZED+HgEees+tzHjKozd9JGSY3m/+UEBNXISnKgMmWvYj
	 CC1HEAFyGV4HcI5m24XQDG+mI41k89iXeNVFe7h/GB70V6plev6xf+KQOloK8kI2GjEFZ
	 Um+Yu405WhLqH9s42n65c6MWAvpkHLtbyeuvEoQ9ySBm2SWtmGUl4B6t4CXmgNn2n+HR5
	 p46jntqHPFVR7HmIX9DA3MU1jwZwumrjo/sERiz4+5vPG2oETbSUGtZJOFKA2sMis0qfz
	 Y/41XwVB30QDLg/kue10PyiG8SeIJ9ELX3l5POnMruJtaoA4ekuBX1yGBV6u8wXuwxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=;
	b=cNRnonqh39cRh6yK7VWpd0LDeMRbWuvx8QKwPofO0/DmN8B9V/RKhv7IVMeAIVJPE5Id
	 xqvWNq+kF/3EuXMr1ZccmTMvHhJ7xkI9GgfVLEwMV0GUUChmsU7AhiYsbT7iBOznR94N5
	 PxBnXkopphseRszE8tMtydusRU+SySO9V+Gm2KnFAu1+UyRmen8tpQfEKs3MT45pTrfU8
	 lo+fJ7vIxDPK0OyJkpBZdyXokJraefydO0IdE4JdYfmbLbOQBrUxSLOKCqxuxM2Zhzlal
	 Efubpl79/MTXsZwNssBL0Dxla3L//rz8iC2t1MT4vei8lP1jfvHCGzE2Vtcv3UepZ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRxMP17B;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B8606A33A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70B8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRxMP17B
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35159e0092aso171599eec.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298719; x=1794903519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=;
        b=jRxMP17BmWpIjo4oI3xzNJiK0Lr+h7IrJdoOpgyyai6FudWgmyYQ3IqBxsnNociTBF
         GLtNs2RJo1N6vYOIbEt4JIMkODhYRzcK9S0ylgos7SU0XQDtCNcQFn+XziDR+BJh3QtF
         85N291oOAWR2nKTd5iegUZLlv3ReDRdhlWUrAaDidTcn7q4H44EezVLGRppBRYGuYCro
         7aMQrDceC5EV8I7LMqMfiT8avDS7bLUMhX8XjndlT1rkwDDKpLBYFEGxvoEPrp0+4Wzi
         RSIXGbSZ369HtbHIBktGTyWT01//7A9KkawJCpi02K9P/+dw9gpbN8Qz2O5KWjx8DZVh
         30Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298719; x=1794903519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJjN4yOJO47ZPiYrwc/9QIPNcniGJgIrcFp8qD1WpVk=;
        b=qjwlYwxo0uwSeMMsfaMvz5TEBfyR0cAHirnzdU+Iw0nrI5hHBzNa4eJEm6HvKjQXG5
         H2kkwrzCX1Z97tA33vyX5jHjRhgFwBKsavWGYPxV2ZqGLG6/BzTMdLtXVAJRblTwv2Be
         t773/Js5xykAE0+U1PYJOume2ZgjRWXjeFfmIJUWRyOCGDKi5sw9+vSL8P2Fd8731LNJ
         i8siBKxXlhViunhwc1XNGCxnRD+MUSAl6LBMItqN6a2sgE+VxPV5QlSGOBqVisWAcU78
         x4ZBWU3lXU5TGmJHB3Z4L6QdL+yEmoBd3roUcSJTKkyqNsvtEqOyHydVjrKeCgvN5sNz
         FSFA==
X-Forwarded-Encrypted: i=1; AL+hErEi21g2Ju1BI3zKs5Tc3NRHGGstKZTg1iBjXZ+Txm7OHSFSYEHWHh0XE9RLpnWFuz+AoQee5sng5tGu@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yy5gSjsdLjE/wmdQ5YgXdE2Gp3dLIqjq5bD/APCkAOMfvJ9N/
	vs1uxg+fzQo8k3fffu0RN1CDp4sVP2iRw0jJnaISuFjezmOpHZlg5/vy/8pMXU3io5s=
X-Gm-Gg: AYBFou06yJ2PIRH9KOYqpM64pb72J5vPUsTMNs5E9J+oYQOCg6wUzKCf8R/RzPdMOSl
	Eqc134PtBKKHdCJtLbHHXC39m+YNT0ywYpN0Lw/Li6yVfPXpiR0emU0RLRuOaFqzBvhYG/IOwDt
	mxoL5hcNq85A9NwwXSIMtphpCT6Pe8OswEGhxYlJ2UhaM1VggATHpSLKTxWH6re/7lV3/YJplHU
	mojfnUZVKWtU9VV232QnZpRJrfgi4yBQTs/OTcWK00jq2LD4a2wKA1RoD7H1PGkIhr7xFeD5Q7Q
	xPEO2HzQmIfas4V0y9vvL3sQs9+bH6j8N92110FpstYYsb/iUlhP5HMw2PBTm4LuTP6KSNAesHj
	DfDoZEuUdeFRJNW3wFCsUT1f5f14FaZEj/Zh03k/VmPiZNVImWAoJszc4pekT2bxo+2EnY3VtY0
	YEAJ3gaorjutuOQPKc0irZbgQotE8X/8VtPazFrW1nGluuTHdT1FUmaMknduabeECl43JitXm+E
	WFjEwK0HPNQvVqP5P3IvLTK+N50PRp7ho2VvgC3AK0XSeUSIi8Qp2W0WVNPTcLx8LOGdj6Gl81e
	WAHQbJW6dCe43O0ZidCUcpnqX3+K3ZI5D6CTIbLIoA+hXUle+gxhPzM2sm2C
X-Received: by 2002:a05:7301:d193:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-3751eb8d9c1mr3960604eec.2.1794298718342;
        Tue, 10 Nov 2026 00:18:38 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:37 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:08 +0800
Subject: [PATCH v6 5/9] phy: rockchip-samsung-dcphy: Move block-level setup
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
Message-Id: <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298692; l=2404;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=mM+rLgEKgftG4Li8VSkT3B5/6VzsZyoCu0+g9BozRtQ=;
 b=MhBIYlgHOfxIY0JdSsH11bY+ntMFX2QUl/Z+iUhq/Sj47py5uFQSNEZQ1a0S+/TDMphNcVUxz
 /PMKTJMSDxOBRnNExGVQFfBDNfshgq7qCsOxLRZAFzlsGMu2EG+KYGb
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

