Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298716;
	b=F7bxhX8VWByqFaC4loDcRJJSHJdy4HACQzJSIvgvkEmxCruHYRoHXuFHhdQex/GduUTY
	 TomgNR9rP9gpYxk/xKGIQEAAyxaAQgVdesGo8ypaqQF5BKnwES7p4bOgFZQiOi9Sr+WcE
	 32VdeP85Uqnto8+B4yGYrH9RKDO2gDVW9vm94I4uYCY/StmjWa6Uk+sszjyzh1cgNkhGA
	 qSKMLvb3MwhOT+xe9JM/RfM7p3AN629Je8WTKJv/gY3SfsrCOPFap7/FETARuPzx0iSbj
	 aRTcoatQP1aNNgIT7E1B20C0oqdvBXOdr4awl28ToClstwtOwtE0y0x/ThLq9BrJdAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=;
	b=xw40yn1yPdljwuwrD//K0Yvsq1k+mpvSTB2Qy2tzxW5IuLtc2Pbo6Ab8u/ZSaTcDUTFK
	 Bb5UTQqHd82FtprNFjvEmgIRKoInE/Q9saqohJWNJ01lFepKL4AEhRk3aCsmVxs9aOg66
	 lm9ZA4AUQz37SWXQQvcRQHhfDyp9dPewBOuskWBfuO6lZzXyS6EY4CiAqDtvQPOOdV9/9
	 kH/agWdJodF8Bf5cpDXbFQL8dv/FdGrV/GfJT38BczsRskHBjzK0Qqricc90Q30qgmNl/
	 QeaYbSD0rDok9PW7MGvJABnGxs/vAxiCcYJ1hooYoGNfALhJj6Y5MGsdgkFaQmjPqrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X555yNbB;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F00606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X555yNbB
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3719e3cb82bso204826eec.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298715; x=1794903515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=;
        b=X555yNbBFCpYDWbq9ryGy7Fqx2egoQOUnyrC/iElbU6wg8tYYnSZbX7MdhTPu2C3Qv
         Z7G/7T1VxeuHAl+rl/PqKDFzFKkIsQJW5nrW+sAop4nZYiwkzD/OFw/tyKYZWFBip8zf
         xx8FGwoyzSK7SfLFQi2UPTWyVfjwmSklAeXn5vdmkcB3vneE7b8jYtxDs9vgqRNCKAWK
         1qjvzBaMkJ1jmRSidUL2g+cC2r6PoieY6PDeBzD2OxonDidgqEVS7IaVTzX+TP2v3xHw
         cUe7JxW3tpgBryvzmKuFA85X6EdjyZKi657TLDXtXgZj2safHVj79SLE2wj6wM80aV8I
         m2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298715; x=1794903515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mp9IyFvT16+hX88RJrtjgklK+/LOWFoJEWqYM2GWuMQ=;
        b=uJ69y/wAO8WwieBjpT3KjqaA0fjiK9NYNqatBymAnhAzTlq+mtk6ysRaR7AH9Kr6sL
         Ipt9gTFVztGtnxUXsAnGKE9j3ctC7Y9c1ZrdM1ci6FAlTLDhOVw1+DFYhU1ipBuH9zNs
         qOEWcmz8pEfyjbw5m80jTEOlDYc+NJ8qMiXih/a6fCp54PjxtNf1ANFwTOmG5VxvCBqh
         NsQUjZxtnuxJB7JTB6TL9ym5gXQUTGl3slLL/dX5MrzT0LSDMVL0PNI6MU8TOYjAYzCv
         kcs4toZPhjv76nkJiCX5huHFbjpDabt+icLxWJMbg5TY1EHLomaLU9Mmb+MwWmXRYChk
         wJEQ==
X-Forwarded-Encrypted: i=1; AL+hErGcMofI3ZLis70SSG/WhGsYYGK1/l4Ub5RHhvJv2FpjmZw4/8E0v6R7wuiCcnAo2lz+UfV8hWaDLE4b@vger.kernel.org
X-Gm-Message-State: APuU4Z+/BtFNMMRzCzS0pRpS/7Wj/P/mcf4/RgBQM/4nvWMJ57TDjgW/
	CKn/uX6Hkgt8FeRgJg+LuRxTTaUOG06CGfNG6nqt897RltHnyvWtBltcnGy9hxWXPVc=
X-Gm-Gg: AYBFou2RTHlPAqlh3OY9m3U2CdWEZGuGb3TILArATj2Ec9d3Zn2a+n6SvjX0WpfI4S3
	4AFs6WTMcT8pIxzuxdlv2K9s9bjHZB46UzBzatUO/xg1BII9sc/qYSMP/Wr9PTrRwKYe1NKDkmH
	L6GFquFmZA/CgUvvYM/eAuGL2hx/7GEJ5lqohKwiwSaTTL1npyG+xIwugoHmLJV6WA0DxrJ8qV6
	eOUKPzcfTezQFZw879qt68bEUOUczdnhQdbZVcj5xAkla9Or6FBg5OjQdsY1AXyH40xSpxQO4V/
	G5Q0ne8LZstRKEcQcnT4rBcWx9OdhXS0k3TvdHuV1hCeJFkP795fcdTuQTP8h3BHJRH763W92+a
	WRlU8yJjSsGoiOi53HplY6sPNmgMs6hKpyw0tsblcP9wZt4vUsIZqL8F4DP2hgYk/ipy/zFMFQI
	gMRhugSHH+2sOLZqcB1Jg1Zo4vLydirSw5K8QfEaWMYj1vOe5U4YVvZL4icgBt3kdXzCzTVtowI
	f7ZHgt9gcPwhM/cLlLYwBiF0J+XPpIrGcOwlfuPSEf7rrtP7Eu8WlllLLnT/VDXxI/MRHr0Y+xO
	/YgCp4rgGsrRBdaTcx/SlK2cGZxz4Q5o/+TV6/QF8njTNvuSc9btUAIYaZQ9OM7X0uwZrAq9QyH
	id5ywJA==
X-Received: by 2002:a05:701b:290a:b0:16b:4f52:a08 with SMTP id a92af1059eb24-1b3b5bc5b75mr3383821c88.0.1794298714350;
        Tue, 10 Nov 2026 00:18:34 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:32 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:07 +0800
Subject: [PATCH v6 4/9] phy: rockchip-samsung-dcphy: Always write the
 rate-dependent registers
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
Message-Id: <20261110-dcphy-rx-v1-v6-4-d681ba20b36a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=2619;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=LIh1d9RdBI9/gBSpmLf2Ww3xecRtR289gfN7TNiw1rk=;
 b=vh7WtesJEslT9LQa1QgtXchs2lhrai6pBKF9E8aFtdAdpc8JEMUwWFHoiWRWDV5rnQJfNXII2
 CyvmkFGqTM0Cpv/XpwfG7MNyurBRtigfnqqPGRKy5yIICDDKwRT+Ojn
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The lane timing init functions write DPHY_MC_ANA_CON1, the four data
lane ANA_CON1 registers and DPHY_MC_DESKEW_CON0 only above a data
rate threshold, and the registers have to be zero below it [1].

Today the APB reset at the start of every power_on provides the zero.

A later change moves that reset to runtime resume, so a power_on at a
lower rate after a higher one would keep the old values.

Write the registers on every power_on, with zero below the threshold.

[1] RK3588 TRM: sections 22.4.2 (reset values) and 22.4.3
    (DPHY_MC_ANA_CON1, DPHY_MC_DESKEW_CON0)

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 24 +++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index ce1bc62497c5..7a009d87a665 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1228,7 +1228,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MC_ANA_CON0, val);
 
 	if (lane_hs_rate >= 4500)
-		regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, 0x0001);
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_ANA_CON1, val);
 
 	val = 0;
 	/*
@@ -1259,7 +1262,10 @@ samsung_mipi_dphy_clk_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	 * under 1.5Gbps or equal to 1.5Gbps.
 	 */
 	if (lane_hs_rate > 1500)
-		regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, 0x9cb1);
+		val = 0x9cb1;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, DPHY_MC_DESKEW_CON0, val);
 }
 
 static void
@@ -1284,12 +1290,14 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON0, val);
 	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON0, val);
 
-	if (lane_hs_rate >= 4500) {
-		regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, 0x0001);
-		regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, 0x0001);
-	}
+	if (lane_hs_rate >= 4500)
+		val = 0x0001;
+	else
+		val = 0;
+	regmap_write(samsung->regmap, COMBO_MD0_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD1_ANA_CON1, val);
+	regmap_write(samsung->regmap, COMBO_MD2_ANA_CON1, val);
+	regmap_write(samsung->regmap, DPHY_MD3_ANA_CON1, val);
 
 	val = 0;
 	/*

-- 
2.43.0

