Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981365;
	b=xGiGMXvRub3DoNVE4YRM4jCnKgp7thkXRRy8hyk7fUBjNbtayatJCeXPo82+M6yhhLVu
	 lPy7nEjYSwEtjr9oAuZWPymSmJcQEMGOHmiAtLPmHrNjGDkBZAtn/j/o5nff7j/8h4nbZ
	 A5qmicu8XPKKJoPs6Mo7sSK+WBl+ntqfXGJCL6sYh6hYhEmiMWjjTkcQ5Iq6XeSyxi3ym
	 tmkdU8/3TSWgvYL7K5MBckPU03pvsAOOQbYI+AinDUXvi0Hn6Dz182JVSCR2UocggsJnV
	 9H7lR34MeJGvxMDGX9STRx3Poe2c2j63CcekNjZRrm1YA0zIeYPK8ZX2OvhjfL9ytPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
	b=km1MBXqt69vlg8DyklagdcpnzinR1c7xI9JDlBXw8Dc0i0ed+5BN5jLk/kOUAYXeyqPC
	 bg1uqjj+M2I/sJGABuw45BTFTZO/UQ3uLvhlKU4JRXtjgITFc9G1eUwmjFp3/SZFnaGCk
	 LjB7LFyWqgm1HvJwpGxIFu3H/3TuSkSP2admyJ9tPWRyaBei37LjP+bkVwYCzpHcv/JMA
	 mAGDFZnbvBesapCI1VseUwR+BGhgD73E/NhFmAhPn6iIMXvWEhOddOQhN40VA/D4fxCqf
	 NYIGVKn4HIvz5K43zB3KQEkbE3qbIFiJvGgDyaQzj9JlZdgbEWg6UZkvHEd0ltznuVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dOC//fK9";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52B606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD52B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOC//fK9
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b77e464208so54739b3a.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981364; x=1795586164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
        b=dOC//fK9yMGtyxN5kDHTnR9tlM7/jhsLLym3+nuXtPLjesXSYiT9qu/oSXHVL8jCRc
         EjzRFhuNY654HinehtCkBEGizuNIL+tf18KAJseHtk5t43+g/QBArziqYL7ToUf8w4kj
         y/EABkM9SY4UfKE9KTrZlPw1Ql1EsHJh+6r2/KJ4z8tUqHXhzCCJq87c61GNOE93kODT
         cnfUqHs96VzacqE3VXvksBb0HkBcZ6atsDomJx+bEW84zKEKuKWXqfKWfi/GbBfy7YSn
         wZ9jsnx6JfWzgyrVIl/zF42BzRdGZNAeuEzB8j3W/+WwVS582jYrQMFfVLRVTxfHSbeQ
         z+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981364; x=1795586164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Px927uPzL0G0bD9p/DBHwmNAaSmtnfAuqfR/vrK6L/E=;
        b=lwKbbV5HsQ++t5K5/sGaN2u5VIj390cxDBlWXmw7jLssWurT4GTYbu5gj5Vvr/g021
         N+Uahl8rDukapzQ7tpB6g7I9LwuFBpx4QhbQyRTUFX/KSnqH8Xr9S9VhMzYFJk+l3B+v
         GeIKK1CMdyNoO8ke5Rr1+3dgjd93ZOu03bolGfTC5FQlhqVDHr5roVCj0TmdOm5jTqtD
         UbjyWVGc8f+tNRiDWR1J4qhG/NvIin3PQBA8c9LWM2aIhV3fGRGNqvLBMRDpojQXNwNA
         H+QxiF5CuDCTN7dR9oOI4FvFOrCZSg2WuBhkDu2JKjTBGl/Zz+KjV7mbzqCVbaeOOJyc
         EM7Q==
X-Forwarded-Encrypted: i=1; AL+hErGbZFSezkEc9/nmqO1B1bER9xDOhPPNr/2wlgX+95fBQZHfwtPu7jTp+RM1OnXXzGpqCQkcW4vjQSzz@vger.kernel.org
X-Gm-Message-State: APuU4Z9q0dYTtUlJKsivJcFOpN7A6ORffm6JFdzYhRFC6StEBqYVx537
	raRoWeyhE0nlCu9IaAbhetU+nExI3i35nAIa5qydTGGWKMKHdTbO9V35
X-Gm-Gg: AYBFou0jjbqLjo0yOf6zwEIpsKMYPuhwmHHgwJyl5jBLQATkCAtyjwuXEnjPy9YKgLV
	QxIBWGCpILFecyPB3EAw1zLCS6kjWVQt00RVA5upxyWgwJ7MgqTcHElEoPWUKzqUPFU6xHleuQM
	EAf9iznix8ivjgHNfPgsylG5Um3e+jbQAh/zbQ0pHsnhq/15qngUrc//BkcVvR/FTB5pv1kT2oO
	CAl8bHQ0mB0y3BecsTFF7E39bChuRHqnT/hFX0Ucc/lBHo8dnJXrcUhxH15TCWLWqq/qfqR+syE
	VByf0i9sebRzlHbvcTugRG6Ap5WQ1gSjOsQALmEtvSyExoDbERwOGDUnkkrQCcA84OFEzXggaSd
	X25pG+pzpkipxtCZOVLipvdr65vpgbLRJljyo95uT7IwC9BgVQ+VCHghgvwdgRHauEmFTncE6Go
	KzC8p0NRvw3rFnzeLaI3wHPRrLkt+Yxm+ylNDYO0TvVrE2IxecLDNoiST0WiuLErdEsHG+WQ/1F
	ba4IXSHo/+cJHfhFW+CNWLjfM7YlNuEjctvQ+7NnRON1TIlkyxQW3DuXUU9YHnviQe8lgC6Lrnh
	YmCXMOF9anYY8Qwp7cpJ8XaFyxfN/yVFyZbNwr2u5MaD8tozPGTV8g5JUs3mqhnwAlI3+K2Mk9M
	K8qbADZiE1Z3YdHPeTMBj
X-Received: by 2002:a05:6300:270d:20b0:3fa:c9d8:658f with SMTP id adf61e73a8af0-3fe893f7618mr1954376637.2.1794981363700;
        Tue, 17 Nov 2026 21:56:03 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:56:03 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:18 +0800
Subject: [PATCH v7 5/9] phy: rockchip-samsung-dcphy: Move block-level setup
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
Message-Id: <20261118-dcphy-rx-v1-v7-5-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
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
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=2576;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=jtUxPRys/dBRdscqaMmdtwL+bhADXEXJWj8FzO882mw=;
 b=UroCCPoJ8igH1/HP9OY6jDPFTILu0l5ZeEUfeBcqKSuK7zWUkiNd/OQKmsAoAfLFt2JaaWlW9
 jPr/Rva0/P3AOOYghEgZn1HzqiVjuMEoRxkhjnAOn+R30JcoqfjixUU
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

